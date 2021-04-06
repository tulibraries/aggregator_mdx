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

    <!-- Use includes here if you need to separate out templates for either use specific to a dataset or use generic enough for multiple providers (like remediation.xslt). -->

    <!-- For using this XSLT in Combine, you need to replace the following with an actionable HTTP link to the remediation XSLT, or load both XSLT into Combine then rename this to the filepath & name assigned to remediation.xslt within Combine. -->

    <xsl:include href="csv_generic_pipe.xsl"/>


    <xsl:template match="Item_No" priority="1">
            <!-- add templates you have to call - e.g. named templates; matched templates with mode -->
            <xsl:call-template name="static-rights-statement"/>
            <xsl:call-template name="dataprovider"/>
        
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dcterms:identifier">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="Country">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dcterms:spatial">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>


    <!-- NAMED TEMPLATES -->

    <!-- Contributing Institution -->
    <xsl:template name="dataprovider">
        <xsl:element name="edm:dataProvider">
            <xsl:value-of>Free Library of Philadelphia</xsl:value-of>
        </xsl:element>
    </xsl:template>
    
    <!-- Rights -->
    <xsl:template name="static-rights-statement">
        <xsl:element name="dcterms:rights">
            <xsl:value-of>High-resolution images from the Free Library of Philadelphia&apos;s collections are available for publication and other uses, within copyright and licensing restrictions. Please take note of the Item No which you will need to fill out the Reproduction Services form.</xsl:value-of>
        </xsl:element>       
    </xsl:template>
</xsl:stylesheet>