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

    <pattern>
      <title>DPLAH fields required</title>
        <rule context="oai_dc:dc">
          <assert test="dc:title">There must be a title</assert>
          <assert test="dc:rights">There must be a rights statement</assert>
        </rule>
    </pattern>
    <pattern>
      <title>Required fields must contain text.</title>
        <rule context="oai_dc:dc/dc:title">
          <assert test="normalize-space(.)">The title property must contain text</assert>
        </rule>
      </pattern>
      <pattern>
        <rule context="oai_dc:dc/dc:rights">
          <assert test="normalize-space(.)">The rights property must contain text</assert>
        </rule>
      </pattern>
</schema>