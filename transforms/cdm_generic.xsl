<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:dpla="http://dp.la/about/map/"
    xmlns:padig="http://padigital.org/ns"
    xmlns:edm="http://www.europeana.eu/schemas/edm/"
    xmlns:oclcdc="http://worldcat.org/xmlschemas/oclcdc-1.0/"
    xmlns:oclcterms="http://purl.org/oclc/terms/"
    xmlns:oai="http://www.openarchives.org/OAI/2.0/"
    xmlns:oai_dc='http://www.openarchives.org/OAI/2.0/oai_dc/'
    xmlns:oclc="http://purl.org/oclc/terms/"
    xmlns:oai_qdc="http://worldcat.org/xmlschemas/qdc-1.0/"
    xmlns:schema="http://schema.org"
    xmlns:svcs="http://rdfs.org/sioc/services"
    version="2.0">
    <xsl:output omit-xml-declaration="no" method="xml" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <!-- Use includes here if you need to separate out templates for either use specific to a dataset or use generic enough for multiple providers (like remediation.xslt). -->

    <xsl:include href="oai_base_crosswalk.xsl"/>
    <xsl:include href="cdm_generic_templates.xsl"/>

    <!-- Create collection name -->
    
    <xsl:template match="oai:header/oai:setSpec">
            <xsl:call-template name="isPartOf"/>
    </xsl:template>

    <xsl:template match="dc:identifier[position() = last()]">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="dataProvider"/>
            <xsl:call-template name="identifier"/>
            <xsl:call-template name="isShownAt"/>
            <xsl:call-template name="preview"/>
            <xsl:call-template name="iiifBase"/>
            <xsl:call-template name="iiifManifest"/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>