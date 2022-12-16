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

    <!-- WORK IN PROGRESS testing initial harvest -->

    <!-- collection name -->
    <xsl:template match="oai:header/oai:setSpec">
        <xsl:call-template name="isPartOf"/>
    </xsl:template>

    <!-- identifier, data provider -->
    <xsl:template match="oai:identifier">
        <xsl:call-template name="identifier"/>
        <!-- data provider -->
        <xsl:element name="edm:dataProvider">
            <xsl:text>Moravian Historical Society</xsl:text>
        </xsl:element>
    </xsl:template>

    <!-- preview -->
    <xsl:template match="dcterms:identifier[normalize-space(.) != '' and contains(.,'.jpg')][1]">
            <xsl:call-template name="preview"/>
    </xsl:template>

    <!-- templates -->

    <!-- isPartOf -->
    <xsl:template name="isPartOf">
        <xsl:if test="normalize-space(.)">
            <xsl:variable name="setID" select="normalize-space(.)"/>
            <xsl:if test="$setID = $moravianSetSpecList/padig:set">
                <xsl:element name="dcterms:isPartOf">
                    <xsl:value-of select="$moravianSetSpecList/padig:set[(. = $setID)]/@string"/>
                </xsl:element>
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <!-- preview -->
    <xsl:template name="preview">
        <xsl:element name="edm:preview">
            <xsl:value-of select="replace(normalize-space(.), '/original/', '/medium/')"/>
        </xsl:element>
    </xsl:template>

    <!-- identifier-related processing -->
    <xsl:template name="identifier">
    <xsl:variable name="itemID" select="substring-after(.,'oai:moravianhistoricalsociety.reclaim.hosting:')"/>
    <xsl:variable name="identifierSubstring" select="substring-before(.,$itemID)"/>

        <xsl:if test="normalize-space(.) != ''">
            <!-- isShownAt -->
            <xsl:element name="edm:isShownAt">
                <xsl:text>https://moravianhistoricalsociety.reclaim.hosting/s/mhs/item/</xsl:text><xsl:value-of select="normalize-space($itemID)"/>
            </xsl:element>

            <!-- identifier -->
            <xsl:element name="dcterms:identifier">
                <xsl:text>padig:MORAVIAN-</xsl:text><xsl:value-of select="$itemID"/>
            </xsl:element>

        </xsl:if>
    </xsl:template>


    <xsl:template name="dataProvider">
        <xsl:variable name="baseURL" select="substring-before(.,'items/show/')"/>

        <xsl:if test="normalize-space(.) != '' and contains(.,'/items/show/') and $baseURL = $oaiUrl/padig:url">
            <xsl:element name="edm:dataProvider">
                <xsl:value-of select="$oaiUrl/padig:url[. = $baseURL]/@string"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
