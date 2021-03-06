<?xml version="1.0" encoding="UTF-8"?>
<!--Funcake name: 'DPLAH to Funnel Cake crosswalk' -->
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

     <!-- Use includes here if you need to separate out templates for either use specific to a dataset or use generic enough for multiple providers (like remediation.xslt). -->

    <xsl:include href="remediations/lookup.xsl"/>
    <xsl:include href="remediations/filter.xsl"/>

    <!-- For using this XSLT in Combine, you need to replace the following with an actionable HTTP link to the remediation XSLT, or load both XSLT into Combine then rename this to the filepath & name assigned to remediation.xslt within Combine.
    <xsl:include href="https://raw.githubusercontent.com/tulibraries/aggregator_mdx/main/transforms/temple.xsl"/>
    <xsl:include href="https://raw.githubusercontent.com/tulibraries/aggregator_mdx/main/transforms/remediations/filter.xsl"/>
-->
     <!-- drop nodes we don't care about, namely, header values -->
    <xsl:template match="text() | @*"/>

     <!-- drop records where the OAI header is marked as 'deleted' -->
    <xsl:template match="//oai:record[oai:header[@status='deleted']]/*"/>

     <!-- base record. Matches each OAI feed record that is mapped. Filters out records with dc:identifier values contained in remediations/filter.xsl -->
    <xsl:template match="//oai_dc:dc[not(dc:identifier[string() = $filterids])]">
        <oai_dc:dc xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:dc="http://purl.org/dc/elements/1.1/"
            xmlns:dcterms="http://purl.org/dc/terms/"
            xmlns:dpla="http://dp.la/about/map/"
            xmlns:edm="http://www.europeana.eu/schemas/edm/"
            xmlns:oai="http://www.openarchives.org/OAI/2.0/"
            xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
            xmlns:oai_qdc="http://worldcat.org/xmlschemas/qdc-1.0/"
            xmlns:oclc="http://purl.org/oclc/terms/"
            xmlns:oclcdc="http://worldcat.org/xmlschemas/oclcdc-1.0/"
            xmlns:oclcterms="http://purl.org/oclc/terms/"
            xmlns:schema="http://schema.org" >

             <!-- will match specific templates that relevant for dplah. -->
            <xsl:apply-templates />

            <!-- add templates you have to call - e.g. named templates; matched templates with mode -->
            <xsl:call-template name="hub"/>
            <xsl:element name="dcterms:isPartOf"><xsl:value-of>Fur Trader&apos;s Journal</xsl:value-of></xsl:element>
            <xsl:element name="dpla:intermediateProvider">
                    <xsl:value-of>Historic Pittsburgh</xsl:value-of>
            </xsl:element>
            <xsl:element name="edm:dataProvider">
                <xsl:value-of>University of Pittsburgh</xsl:value-of>
            </xsl:element>

        </oai_dc:dc>
    </xsl:template>

     <!-- DPLAH-SPECIFIC TEMPLATES -->

    <!-- Title -->
    <xsl:template match="dc:title[1]">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:title">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- Alternative titles -->
    <xsl:template match="dc:title[position() > 1]">
        <xsl:if test="normalize-space(.)!=''">
            <dcterms:alternative>
                <xsl:value-of select="normalize-space(.)"/>
            </dcterms:alternative>
        </xsl:if>
    </xsl:template>

    <!-- Contributor
    <xsl:template match="dc:contributor[position() != last()]">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:contributor">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    -->
     <!-- Contributing institution from contributor
    <xsl:template match="dc:contributor[position() = last()]">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="edm:dataProvider">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    -->


     <!-- File format
    <xsl:template match="dc:format">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="schema:fileFormat">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
     -->

    <!-- Relation -->
    <xsl:template match="dc:relation">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:relation">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- Identifier -->
    <xsl:template match="dc:identifier">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:identifier">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- Thumbnail URL -->
    <xsl:template match="dc:identifier.thumbnail">
        <xsl:variable name="ObjURL" select='substring-before(., "/datastream/TN/view/")'/>
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="edm:isShownAt">
                <xsl:value-of select="$ObjURL"/>
            </xsl:element>
            <xsl:element name="edm:preview">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- Hub -->
    <xsl:template name="hub">
        <xsl:element name="edm:provider">
            <xsl:value-of>PA Digital</xsl:value-of>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
