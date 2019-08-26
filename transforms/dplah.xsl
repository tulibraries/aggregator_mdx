<?xml version="1.0" encoding="UTF-8"?>
<!--Funcake name: 'DPLAH to Funnel Cake crosswalk'
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
    <xsl:include href="remediations/filter.xsl"/>

     <!-- drop nodes we don't care about, namely, header values -->
    <xsl:template match="text() | @*"/>

     <!-- drop records where the OAI header is marked as 'deleted' -->
    <xsl:template match="//oai:record[oai:header[@status='deleted']]/*"/>

     <!-- base record. Matches each OAI feed record that is mapped. Filters out records with dc:identifier values contained in remediation_filter.xsl -->
    <xsl:template match="//oai_dc:dc[not(dc:identifier[string() = $filterids])]">
        <oai_dc:dc>
            <!-- Title -->
            <xsl:for-each select="dc:title[1]">
                <dcterms:title><xsl:value-of select="."/></dcterms:title>
            </xsl:for-each>
            <!-- Alternative title -->
            <xsl:for-each select="dc:title[position()>1]">
                <dcterms:alternative><xsl:value-of select="."/></dcterms:alternative>
            </xsl:for-each>
            <xsl:for-each select="dcterms:alternative">
                <dcterms:alternative><xsl:value-of select="."/></dcterms:alternative>
            </xsl:for-each>
            <!-- Creator -->
            <xsl:for-each select="dc:creator">
                <dcterms:creator><xsl:value-of select="."/></dcterms:creator>
            </xsl:for-each>
            <!-- Contributor -->
            <xsl:for-each select="dc:contributor[position()!=last()]">
                <dcterms:contributor><xsl:value-of select="."/></dcterms:contributor>
            </xsl:for-each>
            <!-- Source; will need to fix this after dplah migration -->
            <xsl:for-each select="dc:source[position()>1]">
                <dcterms:source><xsl:value-of select="."/></dcterms:source>
            </xsl:for-each>
            <!-- Publisher -->
            <xsl:for-each select="dc:publisher">
                <dcterms:publisher><xsl:value-of select="."/></dcterms:publisher>
            </xsl:for-each>
            <!-- Description -->
            <xsl:for-each select="dc:description">
                <dcterms:description><xsl:value-of select="."/></dcterms:description>
            </xsl:for-each>
            <!-- Place -->
            <xsl:for-each select="dc:coverage">
                <dcterms:spatial><xsl:value-of select="."/></dcterms:spatial>
            </xsl:for-each>
            <!-- Place -->
            <xsl:for-each select="dcterms:spatial">
                <dcterms:spatial><xsl:value-of select="."/></dcterms:spatial>
            </xsl:for-each>
            <!-- Temporal coverage -->
            <xsl:for-each select="dcterms:temporal">
                <dcterms:temporal><xsl:value-of select="."/></dcterms:temporal>
            </xsl:for-each>
            <!-- Extent -->
            <xsl:for-each select="dcterms:extent">
                <dcterms:extent><xsl:value-of select="."/></dcterms:extent>
            </xsl:for-each>
            <!-- Date -->
            <xsl:for-each select="dc:date">
                <dcterms:date><xsl:value-of select="."/></dcterms:date>
            </xsl:for-each>
            <!-- Subject -->
            <xsl:for-each select="dc:subject">
                <xsl:call-template name="subj_template">
                    <xsl:with-param name="string" select="." />
                    <xsl:with-param name="delimiter" select="';'" />
                </xsl:call-template>
            </xsl:for-each>
            <!-- Language -->
            <xsl:for-each select="dc:language">
                <dcterms:language><xsl:value-of select="."/></dcterms:language>
            </xsl:for-each>
            <!-- Type -->

            <xsl:for-each select="dc:type">
<xsl:choose>

    <xsl:when test="matches(.,'(^text.*$)','i')"><dcterms:type>Text</dcterms:type></xsl:when>
    <xsl:when test="matches(.,'(^image.*$)','i')"><dcterms:type>Image</dcterms:type></xsl:when>
    <xsl:when test="matches(.,'^(movingimage.*$|moving\simage.*$)','i')"><dcterms:type>Moving Image</dcterms:type></xsl:when>
    <xsl:when test="matches(.,'^(sound.*$)','i')"><dcterms:type>Sound</dcterms:type></xsl:when>
    <xsl:when test="matches(.,'^(physicalobject.*$|physical\sobject.*$)','i')"><dcterms:type>Physical Object</dcterms:type></xsl:when>
    <xsl:when test="matches(.,'^(interactiveresource.*$|interactive\sresource.*$)','i')"><dcterms:type>Interactive Resource</dcterms:type></xsl:when>
    <!-- Format -->
    <xsl:otherwise>
        <dcterms:format><xsl:value-of select="."/></dcterms:format>
    </xsl:otherwise>
    </xsl:choose>
            </xsl:for-each>
            <!-- Relation -->
            <xsl:for-each select="dc:relation[position()>1]">
                <dcterms:relation><xsl:value-of select="."/></dcterms:relation>
            </xsl:for-each>
            <!-- Replaced by -->
            <xsl:for-each select="dcterms:isReplacedBy">
                <dcterms:isReplacedBy><xsl:value-of select="."/></dcterms:isReplacedBy>
            </xsl:for-each>
            <!-- Replaces -->
            <xsl:for-each select="dcterms:replaces">
                <dcterms:replaces><xsl:value-of select="."/></dcterms:replaces>
            </xsl:for-each>
        <xsl:for-each select="dc:rights">
            <xsl:choose>
                <!-- Rights URI -->
                <xsl:when test="starts-with(.,'http://rightsstatements.org/vocab/') or starts-with(.,'http://creativecommons.org/licenses/')">
                <edm:rights><xsl:value-of select="."/></edm:rights>
            </xsl:when>
                <!-- Rights -->
                <xsl:otherwise>
                <dcterms:rights><xsl:value-of select="."/></dcterms:rights>               </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
            <!-- Rights holder -->
            <xsl:for-each select="dcterms:rightsholder">
                <dcterms:rightsholder><xsl:value-of select="."/></dcterms:rightsholder>
            </xsl:for-each>
            <!-- File format -->
            <xsl:for-each select="dc:format">
                <schema:fileFormat><xsl:value-of select="."/></schema:fileFormat>
            </xsl:for-each>
            <!-- Identifier -->
            <xsl:for-each select="dc:identifier[1]">
                <dcterms:identifier><xsl:value-of select="."/></dcterms:identifier>
            </xsl:for-each>
            <!-- URL -->
            <xsl:for-each select="dc:identifier[2]">
                <edm:isShownAt><xsl:value-of select="."/></edm:isShownAt>
            </xsl:for-each>
            <!-- Preview -->
            <xsl:for-each select="dc:identifier[position()=last() and position()>2]">
                <edm:preview><xsl:value-of select="."/></edm:preview>
            </xsl:for-each>
            <!-- Collection -->
            <xsl:for-each select="dc:relation[position()=1]">
                <dcterms:isPartOf><xsl:value-of select="."/></dcterms:isPartOf>
            </xsl:for-each>
            <!-- Contributing institution -->
            <xsl:for-each select="dc:contributor[position()=last()]">
                <edm:dataProvider><xsl:value-of select="."/></edm:dataProvider>
            </xsl:for-each>
            <!-- Intermediate provider -->
            <xsl:for-each select="dc:source">
                <xsl:if test=". != ''">
                <dpla:intermediateProvider><xsl:value-of select="."/></dpla:intermediateProvider>
                </xsl:if>
            </xsl:for-each>
            <!-- Provider -->
            <edm:provider>PA Digital</edm:provider>
        </oai_dc:dc>
    </xsl:template>

    <xsl:template name="subj_template">
        <xsl:param name="string" />
        <xsl:param name="delimiter" />

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($string, $delimiter)">
                <xsl:variable name="newstem" select="substring-after($string, $delimiter)" />
                <dcterms:subject>
                    <xsl:value-of select="substring-before($string, $delimiter)" />
                </dcterms:subject>

                <!--Need to do recursion-->
                <xsl:call-template name="subj_template">
                    <xsl:with-param name="string" select="$newstem" />
                    <xsl:with-param name="delimiter" select="';'" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <dcterms:subject>
                    <xsl:value-of select="$string" />
                </dcterms:subject>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="type_template">
        <xsl:param name="string" />
        <xsl:param name="delimiter" />

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($string, $delimiter)">
                <xsl:variable name="newstem" select="substring-after($string, $delimiter)" />
                <dcterms:type>
                    <xsl:value-of select="substring-before($string, $delimiter)" />
                </dcterms:type>

                <!--Need to do recursion-->
                <xsl:call-template name="type_template">
                    <xsl:with-param name="string" select="$newstem" />
                    <xsl:with-param name="delimiter" select="'; '" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <dcterms:type>
                    <xsl:value-of select="$string" />
                </dcterms:type>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="lang_template">
        <xsl:param name="string" />
        <xsl:param name="delimiter" />

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($string, $delimiter)">
                <xsl:variable name="newstem" select="substring-after($string, $delimiter)" />
                <dcterms:language>
                    <xsl:value-of select="substring-before($string, $delimiter)" />
                </dcterms:language>

                <!--Need to do recursion-->
                <xsl:call-template name="lang_template">
                    <xsl:with-param name="string" select="$newstem" />
                    <xsl:with-param name="delimiter" select="'; '" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <dcterms:language>
                    <xsl:value-of select="$string" />
                </dcterms:language>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
