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
    
    <!-- waiting on provider to add rights metadata or provide a statement -->
    
    <!-- collection name -->
    <xsl:template match="oai:header">
        <xsl:call-template name="isPartOf"/>
    </xsl:template>
    
    <!-- identifier, etc. -->
    <xsl:template match="dc:identifier">
        <xsl:call-template name="preview"/>
        <xsl:call-template name="isShownAt"/>
        <xsl:call-template name="identifier"/>
        <xsl:call-template name="dataProvider"/>
    </xsl:template>
    
    <!-- rights and rights URI -->
    <xsl:template match="dc:rights" priority="1">
        <xsl:value-of select="null"/>
    </xsl:template>
    
    <!-- unmap source -->
    <xsl:template match="dc:source" priority="1">
        <xsl:value-of select="null"/>
    </xsl:template>
    
    <!-- don't map incorrect value from language -->
    <xsl:template match="dc:language" priority="1">
        <xsl:if test="normalize-space(.)!='' and not(contains(normalize-space(.),'Click'))">
            <xsl:call-template name="lang_template">
                <xsl:with-param name="strings" select="replace(normalize-space(.),'&amp;amp;','&amp;')"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <!-- templates -->
    
    <!-- isPartOf ; uses setSpec if exists otherwise uses identifier. provider was not able to add setSpec metadata for sets 3 and 4. -->
    <xsl:template name="isPartOf">
        <xsl:variable name="setID" select="normalize-space(oai:setSpec)"/>
        <xsl:variable name="recordID" select="normalize-space(oai:identifier)"/>
        <xsl:choose>
            <xsl:when test="normalize-space(oai:setSpec) != ''">
                <xsl:if test="$setID = $susquSetSpecList/padig:set">
                    <xsl:element name="dcterms:isPartOf">
                        <xsl:value-of select="$susquSetSpecList/padig:set[(. = $setID)]/@string"/>
                    </xsl:element>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="$recordID = $recordIDList/padig:recordID">
                    <xsl:element name="dcterms:isPartOf">
                        <xsl:value-of select="$recordIDList/padig:recordID[(. = $recordID)]/@string"/>
                    </xsl:element>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- preview -->
    <xsl:template name="preview">
        <xsl:if test="normalize-space(.) != '' and contains(.,'/thumbnails/')">
            <xsl:element name="edm:preview">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- isShownAt -->
    <xsl:template name="isShownAt">
        <xsl:if test="normalize-space(.) != '' and contains(.,'/items/show/')">
            <xsl:element name="edm:isShownAt">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- identifier -->
    <xsl:template name="identifier">
        <xsl:variable name="itemID" select="replace(substring-after(.,'/items/show/'),'[^a-zA-Z0-9\-:_]','_')"/>
        <xsl:variable name="baseURL" select="substring-before(.,'items/show/')"/>
        
        <xsl:if test="normalize-space(.) != '' and contains(.,'/items/show/')">
        <xsl:element name="dcterms:identifier">
            <xsl:value-of>padig:</xsl:value-of><xsl:value-of select="$oaiUrl/padig:url[. = $baseURL]/@code"/><xsl:value-of>-</xsl:value-of><xsl:value-of select="$itemID"/>
        </xsl:element>
        <xsl:element name="edm:rights">
            <xsl:value-of>http://rightsstatements.org/vocab/CNE/1.0/</xsl:value-of>
        </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- dataProvider -->
    <xsl:template name="dataProvider">
        <xsl:variable name="baseURL" select="substring-before(.,'items/show/')"/>
        
        <xsl:if test="normalize-space(.) != '' and contains(.,'/items/show/') and $baseURL = $oaiUrl/padig:url">
            <xsl:element name="edm:dataProvider">
                <xsl:value-of select="$oaiUrl/padig:url[. = $baseURL]/@string"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
