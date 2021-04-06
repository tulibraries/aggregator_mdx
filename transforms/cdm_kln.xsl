<?xml version="1.0" encoding="UTF-8"?>
<!-- Use: Qualified Dublin Core from CONTENTdm -->
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

    <!-- this could be used for any intermediate provider that uses cdm; would need to add setSpecs and corresponding dataProvider to lookup -->
    
    <xsl:include href="oai_base_crosswalk.xsl"/>

    <xsl:template match="//oai:setSpec">
        <xsl:if test="normalize-space(.)">
            <xsl:call-template name="dataProvider"/>
            <xsl:call-template name="isPartOf"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="dc:identifier[position() = last()]">
        <xsl:if test="normalize-space(.)">
            <xsl:call-template name="identifier"/>
            <xsl:call-template name="intermediateProvider"/>
            <xsl:call-template name="isShownAt"/>
            <xsl:call-template name="preview"/>
            <xsl:call-template name="iiifBase"/>
            <xsl:call-template name="iiifManifest"/>
        </xsl:if>
    </xsl:template>
    
    <!-- templates -->
    
    <!-- dataProvider -->
    <xsl:template name="dataProvider">
            <xsl:variable name="setID" select="normalize-space(.)"/>
            <xsl:if test="$setID = $ContInt/padig:cont">
                <xsl:element name="edm:dataProvider">
                    <xsl:value-of select="$ContInt/padig:cont[. = $setID]/@string"/>
                </xsl:element>
            </xsl:if>
    </xsl:template>
    
    <!-- isPartOf -->
    <xsl:template name="isPartOf">
        <xsl:variable name="setID" select="normalize-space(.)"/>
            <xsl:if test="$setID = $setSpecList/padig:set">
                <xsl:element name="dcterms:isPartOf">
                    <xsl:value-of select="$setSpecList/padig:set[. = $setID]/@string"/>
                </xsl:element>
            </xsl:if>
    </xsl:template>

     <!-- Identifier -->
    <!-- Create $baseURL and $objID -->
    <xsl:template name="identifier">
        <xsl:variable name="itemID" select='substring-after(.,"/id/")'/>
        <xsl:variable name="colID" select='substring-before(substring-after(.,"collection/"), "/id")'/>
        
        <xsl:element name="dcterms:identifier">
            <xsl:value-of>padig:KLN-</xsl:value-of><xsl:value-of select="$colID"/><xsl:value-of>-</xsl:value-of><xsl:value-of select="$itemID"/>
        </xsl:element>
    </xsl:template>

        <xsl:variable name="objID" select='substring-after(.,"/cdm/ref/")'/>
        <xsl:variable name="baseURL" select='substring-before(.,"cdm/ref/")'/>
        <xsl:variable name="itemID" select='substring-after(.,"/id/")'/>
        <xsl:variable name="colID" select='substring-before(substring-after(.,"collection/"), "/id")'/>
        
    <!-- Intermediate Provider -->
    <xsl:template name="intermediateProvider">
        <xsl:variable name="baseURL" select='substring-before(.,"cdm/ref/")'/>
        
        <xsl:if test="$baseURL = $oaiUrlInt/padig:url">
            <xsl:element name="dpla:intermediateProvider">
                <xsl:value-of select="$oaiUrlInt/padig:url[. = $baseURL]/@string"/>
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
        <xsl:variable name="objID" select='substring-after(.,"/cdm/ref/")'/>
        <xsl:variable name="baseURL" select='substring-before(.,"cdm/ref/")'/>
        
            <xsl:element name="edm:preview">
                <xsl:value-of select="$baseURL"/> <xsl:text>utils/getthumbnail/</xsl:text><xsl:value-of select="$objID"/>
            </xsl:element>
    </xsl:template>

        <!-- IIIF Base URL -->
    <xsl:template name="iiifBase">
        <xsl:variable name="baseURL" select='substring-before(.,"cdm/ref/")'/>
        <xsl:variable name="itemID" select='substring-after(.,"/id/")'/>
        <xsl:variable name="colID" select='substring-before(substring-after(.,"collection/"), "/id")'/>
        
        <xsl:element name="svcs:hasService">
            <xsl:value-of select="$baseURL"/> <xsl:text>digital/iiif/</xsl:text><xsl:value-of select="$colID"/><xsl:text>/</xsl:text><xsl:value-of select="$itemID"/>
        </xsl:element>
    </xsl:template>
    
    <!-- iiifManifest -->
    <xsl:template name="iiifManifest">
        <xsl:variable name="baseURL" select='substring-before(.,"cdm/ref/")'/>
        <xsl:variable name="itemID" select='substring-after(.,"/id/")'/>
        <xsl:variable name="colID" select='substring-before(substring-after(.,"collection/"), "/id")'/>
        
        <xsl:element name="dcterms:isReferencedBy">
            <xsl:value-of select="$baseURL"/> <xsl:text>iiif/info/</xsl:text><xsl:value-of select="$colID"/><xsl:text>/</xsl:text><xsl:value-of select="$itemID"/><xsl:text>/manifest.json</xsl:text>
        </xsl:element>
    </xsl:template>  
</xsl:stylesheet>
