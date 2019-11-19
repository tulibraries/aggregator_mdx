<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:edm="http://www.europeana.eu/schemas/edm/"
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/">
    <ns prefix="dcterms" uri="http://purl.org/dc/terms/"/>
    <ns prefix="dc" uri="http://purl.org/dc/elements/1.1/"/>
    <ns prefix="edm" uri="http://www.europeana.eu/schemas/edm/"/>
    <ns prefix="oai_dc" uri="http://www.openarchives.org/OAI/2.0/oai_dc/"/>

    <pattern id="RequiredElementsPattern">
      <title>DPLAH fields required</title>
        <rule context="oai_dc:dc">
          <assert test="dc:title" id="Required1" role="error">There must be a title</assert>
          <assert test="dc:rights" id="Required2" role="error">There must be a rights statement</assert>
        </rule>
    </pattern>
    <pattern id="TitleElementPattern">
      <title>Required fields must contain text.</title>
        <rule context="oai_dc:dc/dc:title">
          <assert test="normalize-space(.)" id="Title1" role="error">The title property must contain text</assert>
        </rule>
      </pattern>
      <pattern id="RightsElementPattern">
        <rule context="oai_dc:dc/dc:rights">
          <assert test="normalize-space(.)" id="Rights1" role="error">The rights property must contain text</assert>
        </rule>
      </pattern>
      <pattern id="RelNoHarvest">
          <title>Additional Metadata Requirements</title>
          <rule context="oai_dc:dc/dc:relation">
              <assert test="normalize-space(.) != 'pdcp_noharvest'" id="RelNoHarvest1" role="error">The relation element must not contain stopword</assert>
          </rule>
      </pattern>
      <pattern id="RightsNoHarvest">
          <title>Additional Metadata Requirements</title>
          <rule context="oai_dc:dc/dc:rights">
              <assert test="normalize-space(.) != 'pdcp_noharvest'" id="RightsNoHarvest1" role="error">The rights element must not contain stopword</assert>
          </rule>
      </pattern>
</schema>
