<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:edm="http://www.europeana.eu/schemas/edm/"
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/">
    <ns prefix="dcterms" uri="http://purl.org/dc/terms/"/>
    <ns prefix="edm" uri="http://www.europeana.eu/schemas/edm/"/>
    <ns prefix="oai_dc" uri="http://www.openarchives.org/OAI/2.0/oai_dc/"/>
    <!-- Required Fields -->
    <pattern id="RequiredElementsPattern">
        <title>Required PA Digital Elements</title>
        <rule context="oai_dc:dc">
            <assert test="edm:dataProvider" id="Required1" role="error">There must be a contributing institution</assert>
        </rule>
    </pattern>
    <pattern id="EDMDataProviderElementPattern">
        <title>Additional Contributing Institution Requirements</title>
        <rule context="oai_dc:dc/edm:dataProvider">
            <assert test="normalize-space(.)" id="EDMDp1" role="error">edm:dataProvider must contain text</assert>
        </rule>
    </pattern>
</schema>
