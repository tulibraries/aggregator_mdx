<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:dpla="http://dpla"
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
    
    <!-- For using this XSLT in Combine, you need to replace the following with an actionable HTTP link to the remediation XSLT, or load both XSLT into Combine then rename this to the filepath & name assigned to remediation.xslt within Combine. -->
    <!-- <xsl:include href="remediation_lookup.xsl"/> -->
    
    <!-- Title -->
    <xsl:template match="dc:title">
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
        <dcterms:alternative>
            <xsl:value-of select="normalize-space(.)"/>
        </dcterms:alternative>
    </xsl:template>
 
    <!-- Creator -->
    <xsl:template match="dc:creator">
        <dcterms:creator>
            <xsl:value-of select="."/>
        </dcterms:creator>
    </xsl:template>
    
    <!-- Contributor -->
    <xsl:template match="dc:contributor[position() != last()]">
        <dcterms:contributor>
            <xsl:value-of select="."/>
        </dcterms:contributor>
    </xsl:template>
    
    <!-- Source; will need to fix this after dplah migration -->
    <xsl:template match="dc:source[position() > 1]">
        <dcterms:source>
            <xsl:value-of select="."/>
        </dcterms:source>
    </xsl:template>
    
    <!-- Publisher -->
    <xsl:template match="dc:publisher">
        <dcterms:publisher>
            <xsl:value-of select="."/>
        </dcterms:publisher>
    </xsl:template>
    
    <!-- Description -->
    <xsl:template match="dc:description">
        <dcterms:description>
            <xsl:value-of select="."/>
        </dcterms:description>
    </xsl:template>
    
    <!-- Place -->
    <xsl:template match="dc:coverage">
        <dcterms:spatial>
            <xsl:value-of select="."/>
        </dcterms:spatial>
    </xsl:template>
    <!-- Place -->
    
    <xsl:template match="dcterms:spatial">
        <dcterms:spatial>
            <xsl:value-of select="."/>
        </dcterms:spatial>
    </xsl:template>
    
    <!-- Temporal coverage -->
    <xsl:template match="dcterms:temporal">
        <dcterms:temporal>
            <xsl:value-of select="."/>
        </dcterms:temporal>
    </xsl:template>
    
    <!-- Extent -->
    <xsl:template match="dcterms:extent">
        <dcterms:extent>
            <xsl:value-of select="."/>
        </dcterms:extent>
    </xsl:template>
    
    <!-- Date -->
    <xsl:template match="dc:date">
        <dcterms:date>
            <xsl:value-of select="."/>
        </dcterms:date>
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
        <dcterms:language>
            <xsl:value-of select="."/>
        </dcterms:language>
    </xsl:template>
    
    <!-- Type -->
    <xsl:template match="dc:type">
        <xsl:choose>
            <xsl:when test="matches(., '(^text.*$)', 'i')">
                <dcterms:type>Text</dcterms:type>
            </xsl:when>
            <xsl:when test="matches(., '(^image.*$)', 'i')">
                <dcterms:type>Image</dcterms:type>
            </xsl:when>
            <xsl:when test="matches(., '^(movingimage.*$|moving\simage.*$)', 'i')">
                <dcterms:type>Moving Image</dcterms:type>
            </xsl:when>
            <xsl:when test="matches(., '^(sound.*$)', 'i')">
                <dcterms:type>Sound</dcterms:type>
            </xsl:when>
            <xsl:when test="matches(., '^(physicalobject.*$|physical\sobject.*$)', 'i')">
                <dcterms:type>Physical Object</dcterms:type>
            </xsl:when>
            <xsl:when
                test="matches(., '^(interactiveresource.*$|interactive\sresource.*$)', 'i')">
                <dcterms:type>Interactive Resource</dcterms:type>
            </xsl:when>
            <!-- Format -->
            <xsl:otherwise>
                <dcterms:format>
                    <xsl:value-of select="."/>
                </dcterms:format>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Relation -->
    <xsl:template match="dc:relation[position() > 1]">
        <dcterms:relation>
            <xsl:value-of select="."/>
        </dcterms:relation>
    </xsl:template>
    
    <!-- Replaced by -->
    <xsl:template match="dcterms:isReplacedBy">
        <dcterms:isReplacedBy>
            <xsl:value-of select="."/>
        </dcterms:isReplacedBy>
    </xsl:template>
    
    <!-- Replaces -->
    <xsl:template match="dcterms:replaces">
        <dcterms:replaces>
            <xsl:value-of select="."/>
        </dcterms:replaces>
    </xsl:template>
    <xsl:template match="dc:rights">
        <xsl:choose>
            <!-- Rights URI -->
            <xsl:when
                test="starts-with(., 'http://rightsstatements.org/vocab/') or starts-with(., 'http://creativecommons.org/licenses/')">
                <edm:rights>
                    <xsl:value-of select="."/>
                </edm:rights>
            </xsl:when>
            <!-- Rights -->
            <xsl:otherwise>
                <dcterms:rights>
                    <xsl:value-of select="."/>
                </dcterms:rights>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Rights holder -->
    <xsl:template match="dcterms:rightsholder">
        <dcterms:rightsholder>
            <xsl:value-of select="."/>
        </dcterms:rightsholder>
    </xsl:template>
    
    <!-- File format -->
    <xsl:template match="dc:format">
        <schema:fileFormat>
            <xsl:value-of select="."/>
        </schema:fileFormat>
    </xsl:template>
    
    <!-- Identifier -->
    <xsl:template match="dc:identifier[1]">
        <dcterms:identifier>
            <xsl:value-of select="."/>
        </dcterms:identifier>
    </xsl:template>
    
    <!-- URL -->
    <xsl:template match="dc:identifier[2]">
        <edm:isShownAt>
            <xsl:value-of select="."/>
        </edm:isShownAt>
    </xsl:template>
    
    <!-- Preview -->
    <xsl:template match="dc:identifier[position() = last() and position() > 2]">
        <edm:preview>
            <xsl:value-of select="."/>
        </edm:preview>
    </xsl:template>
    
    <!-- Collection -->
    <xsl:template match="dc:relation[position() = 1]">
        <dcterms:isPartOf>
            <xsl:value-of select="."/>
        </dcterms:isPartOf>
    </xsl:template>
    
    <!-- Contributing institution -->
    <xsl:template match="dc:contributor[position() = last()]">
        <edm:dataProvider>
            <xsl:value-of select="."/>
        </edm:dataProvider>
    </xsl:template>
    
    <!-- Intermediate provider -->
    <xsl:template match="dc:source">
        <xsl:if test=". != ''">
            <dpla:intermediateProvider>
                <xsl:value-of select="."/>
            </dpla:intermediateProvider>
        </xsl:if>
    </xsl:template>
    
    <!-- Hub -->
    <xsl:template name="hub">
        <xsl:element name="edm:provider">
            <xsl:value-of>PA Digital</xsl:value-of>
        </xsl:element>
    </xsl:template>

    <!-- NAMED TEMPLATES -->
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
