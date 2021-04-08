<?xml version="1.0" encoding="UTF-8"?>
<!-- Funnel cake name: Filter -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:edm="http://www.europeana.eu/schemas/edm/"
    xmlns:padig="http://padigital.org/ns/"
    xmlns:oclcdc="http://worldcat.org/xmlschemas/oclcdc-1.0/"
    xmlns:oclcterms="http://purl.org/oclc/terms/"
    xmlns:oai="http://www.openarchives.org/OAI/2.0/"
    xmlns:oai_dc='http://www.openarchives.org/OAI/2.0/oai_dc/'
    xmlns:oclc="http://purl.org/oclc/terms/"
    version="2.0">

     <!-- do not map records containing a filtered out identifier -->
    <xsl:variable name="filterids" as="element()*">
        <Item>test-filter-record-1</Item>
        <Item>test-filter-record-2</Item>
        <Item>P133108</Item>
        <Item>P133108</Item>
    </xsl:variable>
</xsl:stylesheet>
