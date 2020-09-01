<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" 
  xmlns:dcterms="http://purl.org/dc/terms/"
  xmlns:dc="http://purl.org/dc/elements/1.1/" 
  xmlns:oai_qdc="http://worldcat.org/xmlschemas/qdc-1.0/"
  xmlns:edm="http://www.europeana.eu/schemas/edm/"
  xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/">
  <ns prefix="dcterms" uri="http://purl.org/dc/terms/"/>
  <ns prefix="dc" uri="http://purl.org/dc/elements/1.1/"/>
  <ns prefix="edm" uri="http://www.europeana.eu/schemas/edm/"/>
  <ns prefix="oai_dc" uri="http://www.openarchives.org/OAI/2.0/oai_dc/"/>
  <ns prefix="oai_qdc" uri="http://worldcat.org/xmlschemas/qdc-1.0/"/>

  <pattern id="RequiredElementsPattern">
    <title>Ingest fields required</title>
    <rule context="oai_qdc:qualifieddc">
      <assert test="dc:title" id="Required1" role="error">There must be a title</assert>
    </rule>
  </pattern>
  <pattern id="TitleElementPattern">
    <title>Required fields must contain text.</title>
    <rule context="oai_qdc:qualifieddc/dc:title">
      <assert test="normalize-space(.)" id="Title1" role="error">The title property must contain text</assert>
    </rule>
  </pattern>
  <pattern id="NoHarvest">
    <title>Additional Metadata Requirements</title>
    <rule context="oai_qdc:qualifieddc/*">
      <assert test="not((contains(normalize-space(.),'pdcp_noharvest')))" id="NoHarvest1" role="error">Record must not contain stopword</assert>
    </rule>
  </pattern>
</schema>
