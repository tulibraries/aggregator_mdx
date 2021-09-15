<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" 
  xmlns:dcterms="http://purl.org/dc/terms/"
  xmlns:dc="http://purl.org/dc/elements/1.1/" 
  xmlns:oai_qdc="http://worldcat.org/xmlschemas/qdc-1.0/"
  xmlns:edm="http://www.europeana.eu/schemas/edm/"
  xmlns:oai="http://www.openarchives.org/OAI/2.0/"
  xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
  xmlns:oai_dcq="http://www.bl.uk/namespaces/oai_dcq/">
  
  <ns prefix="dcterms" uri="http://purl.org/dc/terms/"/>
  <ns prefix="dc" uri="http://purl.org/dc/elements/1.1/"/>
  <ns prefix="edm" uri="http://www.europeana.eu/schemas/edm/"/>
  <ns prefix="oai" uri="http://www.openarchives.org/OAI/2.0/"/>
  <ns prefix="oai_dc" uri="http://www.openarchives.org/OAI/2.0/oai_dc/"/>
  <ns prefix="oai_qdc" uri="http://worldcat.org/xmlschemas/qdc-1.0/"/>
  <ns prefix="oai_dcq" uri="http://www.bl.uk/namespaces/oai_dcq/"/>

    <pattern id="RequiredElementsPattern">
      <title>Title field required</title>
        <rule context="/">
          <assert test="//*[local-name()='title']" id="Required1" role="error">There must be a title</assert>
        </rule>
    </pattern>
    <pattern id="NoHarvest">
      <title>No stopword required</title>
      <rule context="//*">
          <assert test="not(contains(normalize-space(.),'pdcp_noharvest'))" id="NoHarvest1" role="error">The record must not contain stopword</assert>
        </rule>
    </pattern>
  <pattern id="Collection">
    <title>Collection record check</title>
    <rule context="//*[local-name()='type']">
      <assert test="not(starts-with(normalize-space(.),'Collection'))" id="Collection1" role="error">Collection records are invalid</assert>
    </rule>
  </pattern>
  <pattern id="APSUrlPattern">
    <title>Remove collection records from APS stream</title>
    <rule context="//*[local-name()='identifier']">
      <assert test="not(starts-with(normalize-space(.),'https://diglib.amphilsoc.org/islandora/graphics/'))" id="APSUrl" role="error">Contains object URL for collection-level APS record</assert>
    </rule>
  </pattern>
</schema>