<?xml version="1.0" encoding="UTF-8"?>
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

    <xsl:include href="upenn.xsl"/>
    <!--
        <xsl:include href="remediations/filter.xsl"/>
    -->

    <!-- drop nodes we don't care about, namely, header values
    <xsl:template match="text() | @*"/>  -->

    <!-- drop records where the OAI header is marked as 'deleted' - removed since this is built into airflow harvest
    <xsl:template match="//record[header[@status='deleted']]/*"/> -->

    <!-- base record. Matches each OAI feed record that is mapped. -->

    <!-- Create elements based on dc:identifier -->
    
    <xsl:template match="dc:identifier">
        <xsl:variable name="objID" select='substring-after(.,"/cdm/ref/")'/>
        <xsl:variable name="baseURL" select='substring-before(.,"cdm/ref/")'/>
        <xsl:variable name="itemID" select='substring-after(.,"/id/")'/>
        <xsl:variable name="colID" select='substring-before(substring-after(.,"https://digital.library.upenn.edu/women/"), ".html")'/>
        <xsl:variable name="lowerID" select='lower-case(.)'/>

        <!-- Local identifier -->
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:identifier">
                <xsl:value-of>padig:PENN-</xsl:value-of><xsl:value-of select="normalize-space($colID)"/>
            </xsl:element>
        </xsl:if>

        <!-- URL -->
            <xsl:if test="normalize-space(.)!=''">
                <xsl:element name="edm:isShownAt"><xsl:value-of select="normalize-space(.)"/></xsl:element>
            </xsl:if>   
    </xsl:template>
        <!-- Preview - none in collection
            <xsl:if test="normalize-space(.)!=''">
                <xsl:element name="edm:preview">
                    <xsl:value-of>https://repo.library.upenn.edu/thumbs/</xsl:value-of><xsl:value-of select="$lowerID"/><xsl:value-of>.jpg</xsl:value-of>
                </xsl:element>
            </xsl:if>
        -->
        <!-- isPartOf -->
        <xsl:template name="isPartOf">
            <xsl:element name="dcterms:isPartOf"><xsl:value-of>Celebration of Women Writers</xsl:value-of></xsl:element>
        </xsl:template>
</xsl:stylesheet>
