<?xml version="1.0" encoding="UTF-8"?>
<!-- Funcake name: 'Villanova' -->
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

    <xsl:include href="oai_base_crosswalk.xsl"/>
    
    <xsl:template match="dc:identifier">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="isPartOf"/>
            <xsl:call-template name="identifier"/>
            <xsl:call-template name="dataProvider"/>
            <xsl:call-template name="isShownAt"/>
            <xsl:call-template name="preview"/>
            <xsl:call-template name="iiiManifest"/>
        </xsl:if>
    </xsl:template>
            
            
    <!-- templates -->
    
    <!-- isPartOf -->
    <xsl:template name="isPartOf">
        <xsl:element name="dcterms:isPartOf">
            <xsl:value-of><xsl:text>Villanova University Digital Collections</xsl:text></xsl:value-of>
        </xsl:element>
    </xsl:template>
    
    <!-- identifier -->
    <xsl:template name="identifier">
        <xsl:variable name="objID" select='substring-after(.,"https://digital.library.villanova.edu/Item/")'/>
        <xsl:variable name="baseURL" select='substring-before(.,"Item/")'/>
        
        <xsl:if test="$baseURL = $oaiUrl/padig:url">
            <xsl:element name="dcterms:identifier">
                <xsl:value-of>padig:</xsl:value-of><xsl:value-of select="$oaiUrl/padig:url[. = $baseURL]/@code"/><xsl:value-of>-</xsl:value-of><xsl:value-of select="$objID"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- dataProvider -->
    <xsl:template name="dataProvider">
        <xsl:variable name="baseURL" select='substring-before(.,"Item/")'/>
        <xsl:if test="$baseURL = $oaiUrl/padig:url">
            <xsl:element name="edm:dataProvider">
                <xsl:value-of select="$oaiUrl/padig:url[. = $baseURL]/@string"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- isShownAt -->
    <xsl:template name="isShownAt">
        <xsl:element name="edm:isShownAt">
            <xsl:value-of select="normalize-space(.)"/>
        </xsl:element>
    </xsl:template>
    
    <!-- preview -->
    <xsl:template name="preview">
        <xsl:variable name="objID" select='substring-after(.,"https://digital.library.villanova.edu/Item/")'/>
        <xsl:element name="edm:preview">
            <xsl:text>https://digital.library.villanova.edu/files/</xsl:text><xsl:value-of select="$objID"/><xsl:text>/THUMBNAIL</xsl:text>
        </xsl:element>
    </xsl:template>
    
    <!-- iiiManifest -->
    <xsl:template name="iiiManifest">
        <xsl:element name="dcterms:isReferencedBy">
            <xsl:value-of select="normalize-space(.)"/><xsl:text>/Manifest</xsl:text>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
