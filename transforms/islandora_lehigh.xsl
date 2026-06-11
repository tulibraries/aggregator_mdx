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
    <xsl:template match="dc:identifier[position() = 1]">
        <xsl:call-template name="identifier"/>
    </xsl:template>
    
    <!-- format mapping: DCMI terms to dcterms:type, formatTerms to dcterms:format, otherwise to dcterms:extent -->
    
    <xsl:variable name="formatTerms" select="('Picture postcards', 'postcard', 'postcards', 'Stereograph')"/>
    
    <xsl:template match="dc:format" priority="1">
    
        <xsl:if test="normalize-space(.) != ''">
            <xsl:call-template name="format">
                <xsl:with-param name="strings" select="normalize-space(replace(., '&amp;amp;', '&amp;'))"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <!-- templates -->

    <!-- format -->
    <xsl:template name='format'>
        <xsl:param name="strings"/>
        <xsl:param name="delimiter"/>
    
        <xsl:variable name="formatValue">
            <xsl:choose>
                <xsl:when test="contains($strings, $delimiter)">
                    <xsl:value-of select="normalize-space(substring-before($strings, $delimiter))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="normalize-space($strings)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:if test="$formatValue != ''">
            <xsl:choose>
                <xsl:when test="matches($formatValue, '(^text.*$)', 'i')">
                    <dcterms:type>Text</dcterms:type>
                </xsl:when>
                <xsl:when test="matches($formatValue, '(^image.*$)', 'i')">
                    <dcterms:type>Image</dcterms:type>
                </xsl:when>
                <xsl:when test="matches($formatValue, '^(movingimage.*$|moving\simage.*$)', 'i')">
                    <dcterms:type>Moving Image</dcterms:type>
                </xsl:when>
                <xsl:when test="matches($formatValue, '^(sound.*$)', 'i')">
                    <dcterms:type>Sound</dcterms:type>
                </xsl:when>
                <xsl:when test="matches($formatValue, '^(physicalobject.*$|physical\sobject.*$)', 'i')">
                    <dcterms:type>Physical Object</dcterms:type>
                </xsl:when>
                <xsl:when test="matches($formatValue, '^(interactiveresource.*$|interactive\sresource.*$)', 'i')">
                    <dcterms:type>Interactive Resource</dcterms:type>
                </xsl:when>
                <xsl:when test="matches($formatValue, '^(stillimage.*$|still\simage.*$)', 'i')">
                    <dcterms:type>Still Image</dcterms:type>
                </xsl:when>
                <xsl:when test="$formatValue = $formatTerms">
                    <dcterms:format><xsl:value-of select = "$formatValue"/></dcterms:format>
                </xsl:when>
                <xsl:otherwise>
                    <dcterms:extent><xsl:value-of select="$formatValue"/></dcterms:extent>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
        
        <!-- recurse on remaining format values -->
        <xsl:if test="contains($strings, $delimiter)">
            <xsl:call-template name="format">
                <xsl:with-param name="strings" select="normalize-space(substring-after($strings, $delimiter))"/>
                <xsl:with-param name="delimiter" select="$delimiter"/>
            </xsl:call-template>
        </xsl:if>
        
    </xsl:template>
    
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
    
    <!-- identifier -->
    <xsl:template name="identifier">
        <xsl:variable name="itemID" select="replace(replace(substring-after(.,'digital-special-collections/'),'[^a-zA-Z0-9\-:_]','_'),'_3A','_')"/>
        <xsl:variable name="baseURL" select="substring-before(.,'digital-special-collections/')"/>
        
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dcterms:identifier">
                <xsl:value-of>padig:</xsl:value-of><xsl:value-of select="$oaiUrl/padig:url[. = $baseURL]/@code"/><xsl:value-of>-</xsl:value-of><xsl:value-of select="$itemID"/>
            </xsl:element>   
        </xsl:if>
        
    <!-- isShownAt -->  
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="edm:isShownAt">
                <xsl:value-of select="normalize-space(.)"/>
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
