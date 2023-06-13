<?xml version="1.0" encoding="UTF-8"?>
<!-- Use: Penn State Qualified Dublin Core from CONTENTdm -->
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

    <xsl:include href="oai_base_crosswalk.xsl"/>
    <xsl:include href="cdm_generic_templates.xsl"/>

    <!-- Create collection name -->
    
    <xsl:template match="oai:header/oai:setSpec">
            <xsl:call-template name="isPartOf"/>
    </xsl:template>

    <!-- Identifier templates, with Penn State content warning logic for preview -->

    <xsl:template match="dc:identifier[position() = last()]">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="dataProvider"/>
            <xsl:call-template name="identifier"/>
            <xsl:call-template name="isShownAt"/>
            <xsl:if test="not(../dcterms:audience[text() = 'true'])">
                <xsl:call-template name="preview"/>
                <xsl:call-template name="iiifBase"/>
                <xsl:call-template name="iiifManifest"/>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
    <!-- medium to type -->
    <xsl:template match="dcterms:medium">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="type_template">
                <xsl:with-param name="strings" select="normalize-space(.)"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

     <!-- additional date mapping -->
    <xsl:template match="dcterms:created">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="date_template">
                <xsl:with-param name="strings" select="normalize-space(.)"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

     <!-- additional rights mapping -->
    <xsl:template match="dcterms:accessRights">
        <xsl:variable name="rights" select="replace(replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&lt;p&gt;',''),'&lt;/p&gt;','')"/>
        <xsl:if test="normalize-space($rights)!=''">
            <xsl:choose>
                <!-- Rights URI -->
                <xsl:when
                    test="starts-with($rights, 'http://rightsstatements.org/vocab/') or starts-with($rights, 'http://creativecommons.org/') or starts-with($rights, 'https://creativecommons.org/')">
                    <xsl:if test="normalize-space($rights)!=''">
                        <xsl:element name="edm:rights">
                            <xsl:value-of select="normalize-space($rights)"/>
                        </xsl:element>
                    </xsl:if>
                </xsl:when>
                <!-- Rights text -->
                <xsl:otherwise>
                    <xsl:if test="normalize-space($rights)!=''">
                        <xsl:element name="dcterms:rights">
                            <xsl:value-of select="normalize-space($rights)"/>
                        </xsl:element>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <!-- Penn State content warning description -->
    <xsl:template match="dcterms:audience">
        <xsl:if test=". = 'true'">
            <xsl:element name="dcterms:description">
                <xsl:value-of>The following item contains content that may be offensive or upsetting.</xsl:value-of>
            </xsl:element>
        </xsl:if>
    </xsl:template>
      
</xsl:stylesheet>
