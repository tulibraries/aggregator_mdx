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

    <pattern id="NoHarvestPattern">
      <title>Check to invalidate HP Western PA Maps records</title>
      <rule context="oai_dc:dc/dcterms:isPartOf">
        <assert test="normalize-space(.)!='Western Pennsylvania Maps'" id="NoHarvestPattern1" role="error">Records from the Western Pennsylvania Maps collection are invalid</assert>
      </rule>
    </pattern>

</schema>
