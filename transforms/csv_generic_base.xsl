<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:dcterms="http://purl.org/dc/terms/"
  xmlns:dpla="http://dp.la/about/map/"
  xmlns:edm="http://www.europeana.eu/schemas/edm/"
  xmlns:oclcdc="http://worldcat.org/xmlschemas/oclcdc-1.0/"
  xmlns:padig="http://padigital.org/ns"
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

    <xsl:include href="remediations/lookup.xsl"/>

    <!-- drop nodes we don't care about (header values, records marked deleted, specific relation fields) -->
    <xsl:template match="text() | @*"/>

    <!-- base record. Matches each OAI feed record that is mapped. -->
    <xsl:template match="//record">
        <oai_dc:dc xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dpla="http://dp.la/about/map/" xmlns:edm="http://www.europeana.eu/schemas/edm/" xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" xmlns:oai_qdc="http://worldcat.org/xmlschemas/qdc-1.0/" xmlns:oclc="http://purl.org/oclc/terms/" xmlns:oclcdc="http://worldcat.org/xmlschemas/oclcdc-1.0/" xmlns:oclcterms="http://purl.org/oclc/terms/" xmlns:schema="http://schema.org">

            <!-- will match specific templates that relevant for dplah. -->
            <xsl:apply-templates/>

            <!-- add templates you have to call - e.g. named templates; matched templates with mode -->
            <xsl:call-template name="hub"/>
        </oai_dc:dc>
    </xsl:template>

    <!-- CSV-SPECIFIC TEMPLATES for fields that do not contain delimited text -->   

    <!-- Alternative Title -->
    <xsl:template match="Title[position() > 1]">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:alternative">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- Publisher -->
    <xsl:template match="Publisher">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dcterms:publisher">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- Extent -->
    <xsl:template match="Extent">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dcterms:extent">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- Description -->
    <xsl:template match="Description">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dcterms:description">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- Rights statement -->
    <xsl:template match="Rights">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dcterms:rights">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- Rights URI -->
    <xsl:template match="Rights_URI">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="edm:rights">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- Identifier; see updated recommendation below -->
    <xsl:template match="Item_No">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dcterms:identifier">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- Identifier; added per updated guidelines. Header name "Identifier" was previously recommended for URL. To avoid cleanup/confusion, header value "ID" is recommended here instead. -->
    <xsl:template match="ID">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dcterms:identifier">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- Title -->
    <xsl:template match="Title[1]">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dcterms:title">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- Preview/Thumbnail URL; see updated recommendation below -->
    <xsl:template match="Thumbnail">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="edm:preview">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- Preview/Thumbnail URL; added per updated guidelines -->
    <xsl:template match="Preview">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="edm:preview">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- Trackback URL; see updated recommendation below. To accommodate already ingested collections, retaining map from Identifier header here. -->
    <xsl:template match="Identifier">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="edm:isShownAt">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- URL; added per updated guidelines -->
    <xsl:template match="URL">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="edm:isShownAt">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- Contributing Institution -->
    <xsl:template match="Data_Provider">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="edm:dataProvider">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- Intermediate Provider -->
    <xsl:template match="Intermediate_Provider">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dpla:intermediateProvider">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- NAMED TEMPLATES -->

    <!-- Hub -->
    <xsl:template name="hub">
        <xsl:element name="edm:provider">
            <xsl:value-of>PA Digital</xsl:value-of>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
