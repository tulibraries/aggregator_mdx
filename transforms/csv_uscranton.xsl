<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:dcterms="http://purl.org/dc/terms/"
  xmlns:dpla="http://dp.la/about/map/"
  xmlns:edm="http://www.europeana.eu/schemas/edm/"
  xmlns:oclcdc="http://worldcat.org/xmlschemas/oclcdc-1.0/"
  xmlns:padig="http://padigital.org/ns/"
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

    <xsl:include href="csv_generic_semic.xsl"/>

    <xsl:template match="Item_No" priority="1">
        
        <xsl:call-template name="dataprovider"/>
            
        <xsl:if test="normalize-space(.) != ''">
                <xsl:element name="dcterms:identifier">
                    <xsl:value-of select="normalize-space(.)"/>
                </xsl:element>
            </xsl:if>
    </xsl:template>


    <!-- NAMED TEMPLATES -->

    <!-- Contributing Institution -->
    <xsl:template name="dataprovider">
        <xsl:element name="edm:dataProvider">
            <xsl:value-of>University of Scranton</xsl:value-of>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
