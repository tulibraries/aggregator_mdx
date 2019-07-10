<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:edm="http://www.europeana.eu/schemas/edm/">
    <ns prefix="dcterms" uri="http://purl.org/dc/terms/"/>
    <ns prefix="edm" uri="http://www.europeana.eu/schemas/edm/"/>
    <!-- Required Fields -->
    <pattern>
        <title>Required PA Digital Elements</title>
        <rule context="record">
            <assert test="dcterms:title">There must be a title</assert>
            <assert test="dcterms:rights or edm:rights">There must be a rights statement</assert>
            <assert test="edm:isShownAt">There must be a trackback URL</assert>
            <assert test="edm:preview">There must be a thumbnail URL</assert>
        </rule>
    </pattern>
    <pattern>
        <title>Additional Title Requirements</title>
        <rule context="record/dcterms:title">
            <assert test="normalize-space(.)">The title element must contain text</assert>
        </rule>
    </pattern>  
    <pattern>
        <title>Additional Trackback URL Requirements</title>
        <rule context="record/edm:isShownAt">
            <assert test="normalize-space(.)">The trackback URL must contain text</assert>
        </rule>
    </pattern>  
    <pattern>
        <title>Additional Thumbnail URL Requirements</title>
        <rule context="record/edm:preview">
            <assert test="normalize-space(.)">The thumbnail URL must contain text</assert>
        </rule>
    </pattern>
    <pattern>
        <title>Additional Rights Requirements</title>
        <rule context="record/dcterms:rights">
            <assert test="normalize-space(.)">dcterms:rights must contain text</assert>
        </rule>
    </pattern>
    <pattern>
        <title>Additional Rights Requirements</title>
        <rule context="record/edm:rights">
            <assert test="normalize-space(.)">edm:rights must contain text</assert>
        </rule>
    </pattern>
</schema>
