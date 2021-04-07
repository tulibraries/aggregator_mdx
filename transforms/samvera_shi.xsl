<?xml version="1.0" encoding="UTF-8"?>
<!-- Use: Ingest of Science History Institute OAI-PMH -->
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


    <xsl:include href="oai_base_crosswalk.xsl"/>

    <!-- unmap rights holder (corrent and incorrect); duplicates rights field -->
    <xsl:template match="dcterms:rightsholder" priority="1">
        <xsl:value-of select="null"/>
    </xsl:template>
    
    <xsl:template match="dcterms:rightsHolder" priority="1">
        <xsl:value-of select="null"/>
    </xsl:template>

    <!-- identifier elements -->
    <xsl:template match="dpla:originalRecord">
        <xsl:call-template name="identifier"/>
        <xsl:call-template name="isPartOf"/>
        <xsl:call-template name="dataProvider"/>
        <xsl:call-template name="isShownAt"/>
    </xsl:template>
    
    <!-- preview -->
    <xsl:template match="edm:preview">
        <xsl:call-template name="preview"/>
    </xsl:template>
        
        
    <!-- templates -->
    
    <!-- identifier -->
    <xsl:template name="identifier">
        <xsl:variable name="objID" select='substring-after(.,"/works/")'/>
        <xsl:variable name="baseURL" select='substring-before(.,"works/")'/>
        
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:identifier">
                <xsl:value-of>padig:</xsl:value-of><xsl:value-of select="$oaiUrl/padig:url[. = $baseURL]/@code"/><xsl:value-of>-</xsl:value-of><xsl:value-of select="$objID"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- isPartOf -->
    <xsl:template name="isPartOf">
        <xsl:element name="dcterms:isPartOf">
            <xsl:value-of>Science History Institute Digital Collections</xsl:value-of>
        </xsl:element>
    </xsl:template>
            
    <!-- dataProvider -->
    <xsl:template name="dataProvider">
        <xsl:variable name="objID" select='substring-after(.,"/works/")'/>
        <xsl:variable name="baseURL" select='substring-before(.,"works/")'/>
        
        <xsl:if test="normalize-space(.)!='' and $baseURL = $oaiUrl/padig:url">
            <xsl:element name="edm:dataProvider">
                <xsl:value-of select="$oaiUrl/padig:url[. = $baseURL]/@string"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- isShownAt -->
    <xsl:template name="isShownAt">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="edm:isShownAt">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- preview -->
    <xsl:template name="preview">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="edm:preview">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
