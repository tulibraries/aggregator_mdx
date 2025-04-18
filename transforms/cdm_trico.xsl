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

    <xsl:include href="oai_base_crosswalk.xsl"/>

    <!-- OAI setspec template for Contributing Institution and Collection Name -->
    <!-- Contributing Institution -->
    <xsl:template match="//oai:setSpec">
        <xsl:if test="normalize-space(.)">
            <xsl:variable name="setID" select="normalize-space(.)"/>
            <xsl:if test="$setID = $ContInt/padig:cont">
                <xsl:element name="edm:dataProvider">
                    <xsl:value-of select="$ContInt/padig:cont[. = $setID]/@string"/>
                </xsl:element>
            </xsl:if>
            
    <!-- Collection Name -->
            <xsl:if test="$setID = $setSpecList/padig:set">
                <xsl:element name="dcterms:isPartOf">
                    <xsl:value-of select="$setSpecList/padig:set[. = $setID]/@string"/>
                </xsl:element>
            </xsl:if>
        </xsl:if>
    </xsl:template>

     <!-- Identifier -->
    <!-- Create $baseURL and $objID -->
    <xsl:template match="dc:identifier[position() = last()]">

        <xsl:variable name="objID" select='substring-after(.,"/cdm/ref/")'/>
        <xsl:variable name="baseURL" select='substring-before(.,"cdm/ref/")'/>
        <xsl:variable name="itemID" select='substring-after(.,"/id/")'/>
        <xsl:variable name="colID" select='substring-before(substring-after(.,"collection/"), "/id")'/>

        <!-- Dummy Identifier -->
        <xsl:if test="$colID = $ContInt/padig:cont">
            <xsl:element name="dcterms:identifier">
                <xsl:value-of>padig:<xsl:value-of select="$ContInt/padig:cont[. = $colID]/@code"/>-</xsl:value-of><xsl:value-of select="$colID"/><xsl:value-of>-</xsl:value-of><xsl:value-of select="$itemID"/>
            </xsl:element>

        <!-- URL -->
            <xsl:element name="edm:isShownAt">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>

        <!-- Thumbnail -->
            <xsl:element name="edm:preview">
                <xsl:value-of select="$baseURL"/> <xsl:text>utils/getthumbnail/</xsl:text><xsl:value-of select="$objID"/>
            </xsl:element>

        <!-- IIIF Base URL -->
            <xsl:element name="svcs:hasService">
                <xsl:value-of select="$baseURL"/> <xsl:text>digital/iiif/</xsl:text><xsl:value-of select="$colID"/><xsl:text>/</xsl:text><xsl:value-of select="$itemID"/>
            </xsl:element>

        <!-- IIIF manifest -->
            <xsl:element name="dcterms:isReferencedBy">
                <xsl:value-of select="$baseURL"/> <xsl:text>iiif/info/</xsl:text><xsl:value-of select="$colID"/><xsl:text>/</xsl:text><xsl:value-of select="$itemID"/><xsl:text>/manifest.json</xsl:text>
            </xsl:element>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
