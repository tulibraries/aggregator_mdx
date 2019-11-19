<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/">
    <ns prefix="dcterms" uri="http://purl.org/dc/terms/"/>
    <ns prefix="oai_dc" uri="http://www.openarchives.org/OAI/2.0/oai_dc/"/>
    <!-- Required Fields -->
    <pattern id="RequiredElementsPattern">
        <title>Required PA Digital Elements</title>
        <rule context="oai_dc:dc">
            <assert test="dcterms:identifier" id="Required1" role="error">There must be an identifier</assert>
        </rule>
    </pattern>
    <pattern id="IdentifierElementPattern">
        <title>Additional Identifier Requirements</title>
        <rule context="oai_dc:dc/dcterms:identifier">
            <assert test="normalize-space(.)" id="Identifier1" role="error">The identifier element must contain text</assert>
        </rule>
    </pattern>
</schema>
