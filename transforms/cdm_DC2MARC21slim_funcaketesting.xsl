<?xml version="1.0" encoding="UTF-8"?>
<!--Funcake name: 'ContentDM funcaketesting'
    Use: Run as first transformation-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:dpla="http://dp.la/about/map/"
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
    <!-- For using this XSLT in Combine, you need to replace the following with an actionable HTTP link to the remediation XSLT, or load both XSLT into Combine then rename this to the filepath & name assigned to remediation.xslt within Combine. -->
    <xsl:include href="temple.xsl"/>
    <xsl:include href="remediation_filter.xsl"/>
    
    <!-- drop nodes we don't care about, namely, header values -->
    <xsl:template match="text() | @*"/>
    
    <!-- drop records that are marked DELETED -->
    <xsl:template match="//oai:record/oai:header[@status = 'deleted']" />

    <!-- base record. Matches each OAI feed record that is mapped. Filters out records with dc:identifier values contained in remediation_filter.xsl -->
    <xsl:template match="//oai_qdc:qualifieddc[not(dc:identifier[string() = $filterids])]">
        <record xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
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
            
            <!-- will match specific templates that relevant for ContentDM DCMARC21slim Testing Collection(s). -->
            <xsl:apply-templates />
            
            <!-- add templates you have to call - e.g. named templates; matched templates with mode -->
            <dcterms:isPartOf>Temple ContentDM Test Collection</dcterms:isPartOf>
            <xsl:call-template name="dataProvider"/>
            <xsl:call-template name="hub"/>
	    </record>
    </xsl:template>
    
    <!-- CONTENTDM-DC2MARC21SLIM-SPECIFIC TEMPLATES -->
    
    <!-- Type -->
    <xsl:template match="dc:type">
        <xsl:call-template name="type_template">
            <xsl:with-param name="string" select="." />
            <xsl:with-param name="delimiter" select="';'" />
        </xsl:call-template>
    </xsl:template>
    
    <!-- File format -->
    <xsl:template match="dc:format">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:format">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
