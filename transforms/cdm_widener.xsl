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

    <xsl:include href="cdm_generic.xsl"/>

    <!-- do not map digitization date; identified with '_' -->
    <xsl:template match="dc:date" priority="1">
        <xsl:if test="not(contains(normalize-space(.),'_'))">
            <xsl:call-template name="date_template">
                <xsl:with-param name="strings" select="replace(normalize-space(.),'&amp;amp;','&amp;')"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- remove repo name from format -->
    <xsl:template match="dc:format" priority="1">
        <xsl:if test="not(contains(normalize-space(.),'Widener University Archives'))">
            <xsl:call-template name="fform_template">
                <xsl:with-param name="strings" select="replace(normalize-space(.),'&amp;amp;','&amp;')"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <!-- unmapping source; broken links, etc. -->
    <xsl:template match="dc:source" priority="1">
        <xsl:value-of select="null"/>
    </xsl:template>

</xsl:stylesheet>
