<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
  xmlns:dcterms="http://purl.org/dc/terms/"
  xmlns:edm="http://www.europeana.eu/schemas/edm/"
  xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/">
  <ns prefix="dcterms" uri="http://purl.org/dc/terms/"/>
  <ns prefix="edm" uri="http://www.europeana.eu/schemas/edm/"/>
  <ns prefix="oai_dc" uri="http://www.openarchives.org/OAI/2.0/oai_dc/"/>

  <!-- This schematron is to be used as a post-transform validation for the DPLAH DAG only.
  Continue to add contributors/collections to the bottom of this file and in the .xspec as
  institutions are reprocessed-->

  <!-- Required Fields -->

  <pattern id="RequiredElementsPattern">
    <title>Required PA Digital Elements</title>
    <rule context="oai_dc:dc">
      <assert test="dcterms:title" id="Required1" role="error">There must be a title</assert>
      <assert test="dcterms:rights or edm:rights" id="Required2" role="error">There must be a rights statement</assert>
      <assert test="edm:isShownAt" id="Required3" role="error">There must be a trackback URL</assert>
      <assert test="edm:dataProvider" id="Required4" role="error">There must be a contributing institution</assert>
      <assert test="dcterms:identifier" id="Required5" role="error">There must be an identifier</assert>
    </rule>
  </pattern>
  <pattern id="TitleElementPattern">
    <title>Additional Title Requirements</title>
    <rule context="oai_dc:dc/dcterms:title">
      <assert test="normalize-space(.)" id="Title1" role="error">The title element must contain text</assert>
    </rule>
  </pattern>
  <pattern id="DCTRightsElementPattern">
    <title>Additional Rights Requirements</title>
    <rule context="oai_dc:dc/dcterms:rights">
      <assert test="normalize-space(.)" id="DCTRights1" role="error">dcterms:rights must contain text</assert>
    </rule>
  </pattern>
  <pattern id="EDMRightsElementPattern">
    <title>Additional Rights Requirements</title>
    <rule context="oai_dc:dc/edm:rights">
      <assert test="normalize-space(.)" id="EDMRights1" role="error">edm:rights must contain text</assert>
    </rule>
  </pattern>
  <pattern id="ItemURLElementPattern">
    <title>Additional Trackback URL Requirements</title>
    <rule context="oai_dc:dc/edm:isShownAt">
      <assert test="normalize-space(.)" id="ItemURL1" role="error">The trackback URL must contain text</assert>
      <assert test="starts-with(normalize-space(.),'http')" id="ItemURL2" role="error">edm:isShownAt must contain a URL</assert>
    </rule>
  </pattern>
  <pattern id="EDMDataProviderElementPattern">
    <title>Additional Contributing Institution Requirements</title>
    <rule context="oai_dc:dc/edm:dataProvider">
      <assert test="normalize-space(.)" id="EDMDp1" role="error">edm:dataProvider must contain text</assert>
    </rule>
  </pattern>
  <pattern id="IdentifierElementPattern">
      <title>Additional Identifier Requirements</title>
      <rule context="oai_dc:dc/dcterms:identifier">
          <assert test="normalize-space(.)" id="Identifier1" role="error">The identifier element must contain text</assert>
      </rule>
  </pattern>

  <!-- Remove selected contributors and collections from DPLAH following reprocessing -->

  <pattern id="HPWesternMapsNoHarvestPattern">
    <title>Check to invalidate HP Western PA Maps records</title>
    <rule context="oai_dc:dc/dcterms:isPartOf">
      <assert test="normalize-space(.)!='Western Pennsylvania Maps'" id="NoHarvestPattern1" role="error">Records from the Western Pennsylvania Maps collection are invalid</assert>
    </rule>
  </pattern>
  <pattern id="TempleUNoHarvestPattern">
    <title>Check to invalidate Temple University records</title>
    <rule context="oai_dc:dc/edm:dataProvider">
      <assert test="normalize-space(.)!='Temple University'" id="NoHarvestPattern2" role="error">Records from Temple University are invalid</assert>
    </rule>
  </pattern>

</schema>