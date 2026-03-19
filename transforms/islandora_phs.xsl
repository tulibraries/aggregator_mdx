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
    
    <!-- preview -->
    <xsl:template match="dc:identifier.thumbnail">
        <xsl:call-template name="preview"/>
    </xsl:template>
    
    <!-- isShownAt, identifier, data provider -->
    <xsl:template match="dc:identifier[position() = 1]">
        <xsl:call-template name="identifier"/>
    </xsl:template>
    
    <!-- map format to format rather than fileFormat -->
    <xsl:template match="dc:format" priority="1">
        <xsl:element name="dcterms:format">
            <xsl:value-of select="normalize-space(.)"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Rights and Rights URI -->
    <xsl:template match="dc:rights" priority="1">
        <xsl:variable name="rights" select="replace(replace(replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&lt;p&gt;',''),'&lt;/p&gt;',''),'&lt;[^&gt;]+&gt;','')"/>
        
        <xsl:if test="normalize-space($rights)!=''">
            <xsl:variable name="rightsURI">
                <xsl:analyze-string select="$rights"
                    regex="https?://rightsstatements\.org/vocab/[^\s]+|https?://creativecommons\.org/[^\s]+">
                    <xsl:matching-substring>
                        <xsl:value-of select="."/>
                    </xsl:matching-substring>
                </xsl:analyze-string>
            </xsl:variable>
            <xsl:variable name="rightsText"
                select="normalize-space(replace(replace($rights,
                'https?://rightsstatements\.org/vocab/[^\s]+|https?://creativecommons\.org/[^\s]+',''),
                '(^[\s;,]+|[\s;,]+$)',''))"/>
            
            <xsl:if test="normalize-space($rightsURI)!=''">
                <xsl:element name="edm:rights">
                    <xsl:value-of select="normalize-space($rightsURI)"/>
                </xsl:element>
            </xsl:if>
            <xsl:if test="$rightsText!=''">
                <xsl:element name="dcterms:rights">
                    <xsl:value-of select="$rightsText"/>
                </xsl:element>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
    <!-- templates -->

    <!-- preview -->
    <xsl:template name="preview">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="edm:preview">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
  
    <!-- identifier -->
    <xsl:template name="identifier">
        <xsl:variable name="itemID" select="replace(replace(substring-after(.,'/islandora/'),'[^a-zA-Z0-9\-:_]','_'),'_3A','_')"/>
        <xsl:variable name="baseURL" select="substring-before(.,'islandora/')"/>
        
        <xsl:if test="normalize-space(.) != ''">
        <xsl:element name="dcterms:identifier">
            <xsl:value-of>padig:</xsl:value-of><xsl:value-of select="$oaiUrl/padig:url[. = $baseURL]/@code"/><xsl:value-of>-</xsl:value-of><xsl:value-of select="$itemID"/>
        </xsl:element>
            
    <!-- isShownAt -->
            <xsl:element name="edm:isShownAt">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
            
    <!-- isPartOf -->
            <xsl:element name="dcterms:isPartOf">
                <xsl:value-of>Presbyterian Historical Society Digital Collections</xsl:value-of>
            </xsl:element>
        </xsl:if>
    
    <!-- dataProvider -->
        <xsl:if test="$baseURL = $oaiUrl/padig:url">
            <xsl:element name="edm:dataProvider">
                <xsl:value-of select="$oaiUrl/padig:url[. = $baseURL]/@string"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
