<?xml version="1.0" encoding="UTF-8"?>
<!--Funcake name: 'Temple ContentDM'
    Use: Imported by Temple ContentDM Collection-level Transforms for Shared Templates.-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:dpla="http://dp.la/about/map/"
    xmlns:edm="http://www.europeana.eu/schemas/edm/"
    xmlns:nhdl="http://github.com/cmharlow/nhdl-mdx/"
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

     <!-- Use includes here if you need to separate out templates for either use specific to a dataset or use generic enough for multiple providers (like remediation.xslt). -->
    <!-- For using this XSLT in Combine, you need to replace the following with an actionable HTTP link to the remediation XSLT, or load both XSLT into Combine then rename this to the filepath & name assigned to remediation.xslt within Combine. -->
    <xsl:include href="remediations/lookup.xsl"/>

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

     <xsl:template match="dcterms:alternative">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:alternative">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Creator -->
    <xsl:template match="dc:creator">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:creator">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Source; will need to fix this after dplah migration -->
    <xsl:template match="dc:source[position() > 1]">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:source">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Publisher -->
    <xsl:template match="dc:publisher">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:publisher">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Description -->
    <xsl:template match="dc:description">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:description">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Place -->
    <xsl:template match="dc:coverage">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:spatial">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Place -->
    <xsl:template match="dcterms:spatial">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:spatial">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Temporal coverage -->
    <xsl:template match="dcterms:temporal">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:temporal">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Extent -->
    <xsl:template match="dcterms:extent">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:extent">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Date -->
    <xsl:template match="dc:date">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:date">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Subject -->
    <xsl:template match="dc:subject">
        <xsl:call-template name="subj_template">
            <xsl:with-param name="string" select="."/>
            <xsl:with-param name="delimiter" select="';'"/>
        </xsl:call-template>
    </xsl:template>

     <!-- Language -->
    <xsl:template match="dc:language">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:language">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Language (Remediated) -->
    <!--
    <xsl:template match="dc:language">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:variable name="langterm" select="normalize-space(lower-case(.))"/>
            <xsl:if test="$langterm = $lexvoLang/nhdl:language">
                <xsl:element name="dcterms:language">
                    <xsl:value-of select="$lexvoLang/nhdl:language[. = $langterm]/@string"/>
                </xsl:element>
            </xsl:if>
        </xsl:if>
    </xsl:template>
     -->

     <!-- Relation -->
    <xsl:template match="dc:relation[position() > 1]">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:relation">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Relation -->
    <xsl:template match="dc:isPartOf">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:relation">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Replaced by -->
    <xsl:template match="dcterms:isReplacedBy">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:isReplacedBy">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Replaces -->
    <xsl:template match="dcterms:replaces">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:replaces">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Rights -->
    <xsl:template match="dc:rights">
        <xsl:choose>
            <!-- Rights URI -->
            <xsl:when
                test="starts-with(., 'http://rightsstatements.org/vocab/') or starts-with(., 'http://creativecommons.org/licenses/')">
                <xsl:if test="normalize-space(.)!=''">
                    <xsl:element name="edm:rights">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:if>
            </xsl:when>
            <!-- Rights -->
            <xsl:otherwise>
                <xsl:if test="normalize-space(.)!=''">
                    <xsl:element name="dcterms:rights">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

     <!-- Rights holder -->
    <xsl:template match="dcterms:rightsholder">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:rightsholder">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Identifier -->
    <xsl:template match="dc:identifier[1]">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:identifier">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- URL -->
    <xsl:template match="dc:identifier[2]">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="edm:isShownAt">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Preview -->
    <xsl:template match="dc:identifier[position() = last() and position() > 2]">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="edm:preview">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Collection -->
    <xsl:template match="dc:relation[position() = 1]">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:isPartOf">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Intermediate provider -->
    <xsl:template match="dc:source">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dpla:intermediateProvider">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- NAMED TEMPLATES -->

     <!-- Contributing institution (Hard-coded 'Temple University') -->
    <xsl:template name="dataProvider">
        <xsl:element name="edm:dataProvider">
            <xsl:value-of><xsl:text>Temple University</xsl:text></xsl:value-of>
        </xsl:element>
    </xsl:template>

     <!-- Hub -->
    <xsl:template name="hub">
        <xsl:element name="edm:provider">
            <xsl:value-of>PA Digital</xsl:value-of>
        </xsl:element>
    </xsl:template>

     <!-- Subject -->
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

     <!-- Type -->
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

     <!-- Language -->
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
