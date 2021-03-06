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
            <assert test="edm:preview" id="Required1" role="error">There must be a thumbnail URL</assert>
        </rule>
    </pattern>
    <pattern id="ThumbnailURLElementPattern">
        <title>Additional Thumbnail URL Requirements</title>
        <rule context="oai_dc:dc/edm:preview">
            <assert test="normalize-space(.)" id="ThumbnailURL1" role="error">The thumbnail URL must contain text</assert>
        </rule>
    </pattern>
</schema>
