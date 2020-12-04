<?xml version='1.0' encoding='utf-8'?>
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
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
    xmlns:oclc="http://purl.org/oclc/terms/"
    xmlns:oai_qdc="http://worldcat.org/xmlschemas/qdc-1.0/"
    xmlns:schema="http://schema.org"
    xmlns:svcs="http://rdfs.org/sioc/services"
    version="2.0">    
    <xsl:output omit-xml-declaration="no" method="xml" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>
        
    <xsl:include href="oai_base_crosswalk.xsl"/>

    <!-- collection name -->    
    <xsl:template match="oai:header/oai:setSpec">
        <xsl:call-template name="isPartOf"/>
    </xsl:template>
    
    <!-- preview -->
    <xsl:template match="dc:identifier.thumbnail">
        <xsl:call-template name="preview"/>
    </xsl:template>
    
    <!-- isShownAt -->
    <xsl:template match="dc:identifier[last()]">
        <xsl:call-template name="isShownAt"/>
        <xsl:call-template name="identifier"/>
        <xsl:call-template name="dataProvider"/>
    </xsl:template>
    
    <!-- templates -->

    <!-- isPartOf -->
    <xsl:template name="isPartOf">
        <xsl:if test="normalize-space(lower-case(.))">
            <xsl:variable name="setID" select="normalize-space(lower-case(.))"/>
            <xsl:if test="$setID = $setSpecList/padig:set">
                <xsl:element name="dcterms:isPartOf">
                    <xsl:value-of select="$setSpecList/padig:set[. = $setID]/@string"/>
                </xsl:element>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
    <!-- preview -->
    <xsl:template name="preview">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="edm:preview">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- isShownAt -->
    <xsl:template name="isShownAt">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="edm:isShownAt">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- identifier -->
    <xsl:template name="identifier">
        <xsl:variable name="itemID" select="replace(substring-after(.,'/object/'),'[^a-zA-Z0-9\-:_]','_')"/>
        <xsl:variable name="baseURL" select="substring-before(.,'islandora/')"/>
        
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dcterms:identifier">
                <xsl:value-of>padig:</xsl:value-of><xsl:value-of select="$oaiUrl/padig:url[. = $baseURL]/@code"/><xsl:value-of>-</xsl:value-of><xsl:value-of select="$itemID"/>
            </xsl:element>      
        </xsl:if>
    </xsl:template>
    
    <!-- dataProvider -->
    <xsl:template name="dataProvider">
        <xsl:variable name="baseURL" select="substring-before(.,'islandora/')"/>
        
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="edm:dataProvider">
                <xsl:value-of select="$oaiUrl/padig:url[. = $baseURL]/@string"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
