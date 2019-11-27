<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:dcterms="http://purl.org/dc/terms/"
  xmlns:dpla="http://dp.la/about/map/"
  xmlns:edm="http://www.europeana.eu/schemas/edm/"
  xmlns:oclcdc="http://worldcat.org/xmlschemas/oclcdc-1.0/"
  xmlns:padig="http://padigitial.org/ns/"
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

    <xsl:include href="/home/combine/data/combine/transformations/lookup.xsl"/>
    <xsl:include href="/home/combine/data/combine/transformations/filter.xsl"/>

    <!-- drop nodes we don't care about (header values, records marked deleted, specific relation fields) -->
    <xsl:template match="text() | @*"/>

    <!-- base record. Matches each OAI feed record that is mapped. Filters out records with dc:identifier values contained in remediation_filter.xsl -->
    <xsl:template match="//record">
        <oai_dc:dc xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dpla="http://dp.la/about/map/" xmlns:edm="http://www.europeana.eu/schemas/edm/" xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" xmlns:oai_qdc="http://worldcat.org/xmlschemas/qdc-1.0/" xmlns:oclc="http://purl.org/oclc/terms/" xmlns:oclcdc="http://worldcat.org/xmlschemas/oclcdc-1.0/" xmlns:oclcterms="http://purl.org/oclc/terms/" xmlns:schema="http://schema.org">

            <!-- will match specific templates that relevant for dplah. -->
            <xsl:apply-templates/>

            <!-- add templates you have to call - e.g. named templates; matched templates with mode -->
            <xsl:call-template name="static-rights-statement"/>
            <xsl:call-template name="intprovider"/>
            <xsl:call-template name="hub"/>
        </oai_dc:dc>
    </xsl:template>

    <!-- FREE LIBRARY-SPECIFIC IDENTITY TEMPLATES -->

    <!-- Collection Name -->
    <xsl:template match="Collection_Name">
        <xsl:if test="normalize-space(lower-case(.))">
          <xsl:element name="dcterms:isPartOf">
              <xsl:value-of select="normalize-space(.)"/>
          </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- Creator -->
    <xsl:template match="Creator">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dcterms:creator">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- Date -->
    <xsl:template match="Creation_Date">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dcterms:date">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- Description -->
    <xsl:template match="Description">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dcterms:description">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- Identifier -->
    <xsl:template match="Item_No">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dcterms:identifier">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- Language -->
    <xsl:template match="Language">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dcterms:language">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- Subject -->
    <xsl:template match="Subject">
        <xsl:call-template name="subj_template">
            <xsl:with-param name="stringz" select="."/>
            <xsl:with-param name="delimiter" select="'|'"/>
        </xsl:call-template>
    </xsl:template>

    <!-- Title -->
    <xsl:template match="Title">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dcterms:title">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- Thumbnail URL -->
    <xsl:template match="Thumbnail">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="edm:preview">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- Trackback URL -->
    <xsl:template match="Identifier">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="edm:isShownAt">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- Type -->
    <xsl:template match="Type">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:choose>
                <xsl:when test="matches(lowercase(.), '(^text.*$)', 'i')">
                    <dcterms:type>Text</dcterms:type>
                </xsl:when>
                <xsl:when test="matches(lowercase(.), '(^image.*$)', 'i')">
                    <dcterms:type>Image</dcterms:type>
                </xsl:when>
                <xsl:when test="matches(lowercase(.), '^(movingimage.*$|moving\simage.*$)', 'i')">
                    <dcterms:type>Moving Image</dcterms:type>
                </xsl:when>
                <xsl:when test="matches(lowercase(.), '^(sound.*$)', 'i')">
                    <dcterms:type>Sound</dcterms:type>
                </xsl:when>
                <xsl:when test="matches(lowercase(.), '^(physicalobject.*$|physical\sobject.*$)', 'i')">
                    <dcterms:type>Physical Object</dcterms:type>
                </xsl:when>
                <xsl:when test="matches(lowercase(.), '^(interactiveresource.*$|interactive\sresource.*$)', 'i')">
                    <dcterms:type>Interactive Resource</dcterms:type>
                </xsl:when>
                <xsl:when test="matches(lowercase(.), '^(stillimage.*$|still\simage.*$)', 'i')">
                    <dcterms:type>Still Image</dcterms:type>
                </xsl:when>
                <!-- Format -->
                <xsl:otherwise>
                    <dcterms:format>
                        <xsl:value-of select="normalize-space(.)"/>
                    </dcterms:format>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <!-- HISTORIC-PITTSBURGH-SPECIFIC NAMED TEMPLATES -->

    <!-- Intermediate provider -->
    <xsl:template name="intprovider">
        <xsl:element name="dpla:intermediateProvider">
            <xsl:value-of>Free Library of Philadelphia</xsl:value-of>
        </xsl:element>
    </xsl:template>

    <!-- Hub -->
    <xsl:template name="hub">
        <xsl:element name="edm:provider">
            <xsl:value-of>PA Digital</xsl:value-of>
        </xsl:element>
    </xsl:template>

    <!-- Rights -->
    <xsl:template name="static-rights-statement">
      <xsl:element name="dcterms:rights">
        <xsl:value-of>High-resolution images from the Free Library of Philadelphia's collections are available for publication and other uses, within copyright and licensing restrictions. Please take note of the Item No which you will need to fill out the Reproduction Services form.</xsl:value-of>
      </xsl:element>
    </xsl:template>

    <!-- Subject -->
    <xsl:template name="subj_template">
        <xsl:param name="stringz"/>
        <xsl:param name="delimiter"/>

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($stringz, $delimiter)">
                <xsl:variable name="newstem" select="substring-after($stringz, $delimiter)"/>
                <dcterms:subject>
                    <xsl:value-of select="substring-before($stringz, $delimiter)"/>
                </dcterms:subject>

                <!--Need to do recursion-->
                <xsl:call-template name="subj_template">
                    <xsl:with-param name="stringz" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="';'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <dcterms:subject>
                    <xsl:value-of select="normalize-space($stringz)"/>
                </dcterms:subject>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Type -->
    <xsl:template name="type_template">
        <xsl:param name="stringz"/>
        <xsl:param name="delimiter"/>

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($stringz, $delimiter)">
                <xsl:variable name="newstem" select="substring-after($stringz, $delimiter)"/>
                <dcterms:type>
                    <xsl:value-of select="substring-before($stringz, $delimiter)"/>
                </dcterms:type>

                <!--Need to do recursion-->
                <xsl:call-template name="type_template">
                    <xsl:with-param name="stringz" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="'; '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <dcterms:type>
                    <xsl:value-of select="normalize-space($stringz)"/>
                </dcterms:type>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Language -->
    <xsl:template name="lang_template">
        <xsl:param name="stringz"/>
        <xsl:param name="delimiter"/>

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($stringz, $delimiter)">
                <xsl:variable name="newstem" select="substring-after($stringz, $delimiter)"/>
                <dcterms:language>
                    <xsl:value-of select="substring-before($stringz, $delimiter)"/>
                </dcterms:language>

                <!--Need to do recursion-->
                <xsl:call-template name="lang_template">
                    <xsl:with-param name="stringz" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="'; '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <dcterms:language>
                    <xsl:value-of select="normalize-space($stringz)"/>
                </dcterms:language>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
