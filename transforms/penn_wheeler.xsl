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


    <!-- Create elements based on dc:identifier -->
    <xsl:template match="dc:identifier">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="identifier"/>
            <xsl:call-template name="isShownAt"/>
            <xsl:call-template name="preview"/>
            <xsl:call-template name="isPartOf"/>
            <xsl:call-template name="dataProvider"/>
            <xsl:element name="edm:rights">https://creativecommons.org/publicdomain/zero/1.0</xsl:element>
        </xsl:if>
    </xsl:template>

<!-- TEMPLATES -->

        <!-- identifier -->
        <xsl:template name="identifier">
            <xsl:element name="dcterms:identifier">
                <xsl:value-of>padig:PENN-</xsl:value-of><xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:template>

        <!-- URL -->
            <xsl:template name="isShownAt">
                <xsl:element name="edm:isShownAt">
                    <xsl:value-of>http://dla.library.upenn.edu/dla/wheeler/image.html?id=</xsl:value-of><xsl:value-of select="."/>
                </xsl:element>
            </xsl:template>

    <!-- Preview -->
             <xsl:template name="preview">
                 <xsl:variable name="lowerID" select='lower-case(.)'/>
                 <xsl:element name="edm:preview">
                     <xsl:value-of>https://repo.library.upenn.edu/thumbs/</xsl:value-of><xsl:value-of select="$lowerID"/><xsl:value-of>.jpg</xsl:value-of>
                 </xsl:element>
             </xsl:template>

    <!-- isPartOf -->
    <xsl:template name="isPartOf">
        <xsl:element name="dcterms:isPartOf">
            <xsl:value-of>Wheeler Image Collection</xsl:value-of>
        </xsl:element>
    </xsl:template>

    <!-- dataProvider -->
    <xsl:template name="dataProvider">
        <xsl:element name="edm:dataProvider">
            <xsl:value-of>University of Pennsylvania</xsl:value-of>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
