<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:edm="http://www.europeana.eu/schemas/edm/"
    xmlns:padig="https://github.com/tulibraries/aggregator_mdx"
    xmlns:oclcdc="http://worldcat.org/xmlschemas/oclcdc-1.0/"
    xmlns:oclcterms="http://purl.org/oclc/terms/"
    xmlns:oai="http://www.openarchives.org/OAI/2.0/"
    xmlns:oai_dc='http://www.openarchives.org/OAI/2.0/oai_dc/'
    xmlns:oclc="http://purl.org/oclc/terms/"
    xmlns:oai_qdc="http://worldcat.org/xmlschemas/qdc-1.0/"
    xmlns:svcs="http://rdfs.org/sioc/services"
    version="2.0">
    <xsl:output omit-xml-declaration="no" method="xml" encoding="UTF-8" indent="yes"/>

    <!-- For using this XSLT in Combine, you need to replace the following with an actionable HTTP link to the remediation XSLT, or load both XSLT into Combine then rename this to the filepath & name assigned to remediation.xslt within Combine. -->
    <!-- <xsl:include href="remediation_lookup.xsl"/>
    <xsl:include href="remediation_filter.xsl"/> -->

    <xsl:template name="hub">
        <xsl:element name="edm:provider">
            <xsl:value-of>PA Digital</xsl:value-of>
        </xsl:element>
    </xsl:template>

    <xsl:template name="subj_template">
        <xsl:param name="string"/>
        <xsl:param name="delimiter"/>

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($string, $delimiter)">
                <xsl:variable name="newstem" select="substring-after($string, $delimiter)"/>
                <dcterms:subject>
                    <xsl:value-of select="substring-before($string, $delimiter)"/>
                </dcterms:subject>

                <!--Need to do recursion-->
                <xsl:call-template name="subj_template">
                    <xsl:with-param name="string" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="';'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <dcterms:subject>
                    <xsl:value-of select="$string"/>
                </dcterms:subject>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="type_template">
        <xsl:param name="string"/>
        <xsl:param name="delimiter"/>

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($string, $delimiter)">
                <xsl:variable name="newstem" select="substring-after($string, $delimiter)"/>
                <dcterms:type>
                    <xsl:value-of select="substring-before($string, $delimiter)"/>
                </dcterms:type>

                <!--Need to do recursion-->
                <xsl:call-template name="type_template">
                    <xsl:with-param name="string" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="'; '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <dcterms:type>
                    <xsl:value-of select="$string"/>
                </dcterms:type>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="lang_template">
        <xsl:param name="string"/>
        <xsl:param name="delimiter"/>

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($string, $delimiter)">
                <xsl:variable name="newstem" select="substring-after($string, $delimiter)"/>
                <dcterms:language>
                    <xsl:value-of select="substring-before($string, $delimiter)"/>
                </dcterms:language>

                <!--Need to do recursion-->
                <xsl:call-template name="lang_template">
                    <xsl:with-param name="string" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="'; '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <dcterms:language>
                    <xsl:value-of select="$string"/>
                </dcterms:language>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
