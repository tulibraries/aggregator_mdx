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

    <xsl:include href="remediations/lookup.xsl"/>
    <!--
        <xsl:include href="remediations/filter.xsl"/>
    -->

    <!-- drop nodes we don't care about, namely, header values -->
    <xsl:template match="text() | @*"/>

    <!-- drop records where the OAI header is marked as 'deleted' - removed since this is built into airflow harvest
    <xsl:template match="//record[header[@status='deleted']]/*"/> -->

    <!-- base record. Matches each OAI feed record that is mapped. -->
    <xsl:template match="//oai_qdc:qualifieddc">
        <oai_dc:dc xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
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

            <xsl:apply-templates />

            <!-- add templates you have to call - e.g. named templates; matched templates with mode -->
            <xsl:call-template name="hub"/>
        </oai_dc:dc>
    </xsl:template>

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
            <xsl:element name="dcterms:alternative">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template match="dcterms:alternative">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="delimiter_template">
                <xsl:with-param name="strings" select="normalize-space(.)"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- Type and Format -->
    <xsl:template match="dc:type">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="type_template">
                <xsl:with-param name="strings" select="normalize-space(.)"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="dcterms:medium">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="type_template">
                <xsl:with-param name="strings" select="normalize-space(.)"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>


    <!-- File format -->
    <xsl:template match="dc:format">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="fform_template">
                <xsl:with-param name="strings" select="normalize-space(.)"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

     <!-- Creator -->
    <xsl:template match="dc:creator">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="crea_template">
                <xsl:with-param name="strings" select="normalize-space(.)"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- Contributor -->
    <xsl:template match="dc:contributor">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="cont_template">
                <xsl:with-param name="strings" select="normalize-space(.)"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

     <!-- Source -->
    <xsl:template match="dc:source">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="sour_template">
                <xsl:with-param name="strings" select="normalize-space(.)"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
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
    <xsl:template match="dcterms:spatial">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="delimiter_template">
                <xsl:with-param name="strings" select="normalize-space(.)"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

     <!-- Temporal coverage -->
    <xsl:template match="dcterms:temporal">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="delimiter_template">
                <xsl:with-param name="strings" select="normalize-space(.)"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
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
            <xsl:call-template name="date_template">
                <xsl:with-param name="strings" select="normalize-space(.)"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="dcterms:created">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="date_template">
                <xsl:with-param name="strings" select="normalize-space(.)"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

     <!-- Subject -->
    <xsl:template match="dc:subject">
        <xsl:if test="normalize-space(.)!=''">
        <xsl:call-template name="subj_template">
            <xsl:with-param name="strings" select="normalize-space(.)"/>
            <xsl:with-param name="delimiter" select="';'"/>
        </xsl:call-template>
        </xsl:if>
    </xsl:template>

     <!-- Language -->
    <xsl:template match="dc:language">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="lang_template">
                <xsl:with-param name="strings" select="normalize-space(.)"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

     <!-- Relation -->
    <xsl:template match="dc:relation">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="rela_template">
                <xsl:with-param name="strings" select="normalize-space(.)"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

     <!-- isPartOf -->
    <xsl:template match="dcterms:isPartOf">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="delimiter_template">
                <xsl:with-param name="strings" select="normalize-space(.)"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

     <!-- Replaced by -->
    <xsl:template match="dcterms:isReplacedBy">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="delimiter_template">
                <xsl:with-param name="strings" select="normalize-space(.)"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

     <!-- Replaces -->
    <xsl:template match="dcterms:replaces">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="delimiter_template">
                <xsl:with-param name="strings" select="normalize-space(.)"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

     <!-- Rights and Rights URI -->
    <xsl:template match="dc:rights">
        <xsl:if test="normalize-space(.)!=''">
        <xsl:choose>
            <!-- Rights URI -->
            <xsl:when
                test="starts-with(., 'http://rightsstatements.org/vocab/') or starts-with(., 'http://creativecommons.org/') or starts-with(., 'https://creativecommons.org/')">
                <xsl:if test="normalize-space(.)!=''">
                    <xsl:element name="edm:rights">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:if>
            </xsl:when>
            <!-- Rights text -->
            <xsl:otherwise>
                <xsl:if test="normalize-space(.)!=''">
                    <xsl:element name="dcterms:rights">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="dcterms:accessRights">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:rights">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Rights holder -->
    <xsl:template match="dcterms:rightsHolder">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="delimiter_template">
                <xsl:with-param name="strings" select="normalize-space(.)"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

     <!-- Identifier -->
    <xsl:template match="dc:identifier[position() != last()]">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:identifier">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- Create $baseURL and $objID -->
    <xsl:template match="dc:identifier[position() = last()]">

        <xsl:variable name="objID" select='substring-after(.,"/cdm/ref/")'/>
        <xsl:variable name="baseURL" select='substring-before(.,"cdm/ref/")'/>
        <xsl:variable name="itemID" select='substring-after(.,"/id/")'/>
        <xsl:variable name="colID" select='substring-before(substring-after(.,"collection/"), "/id")'/>

        <!-- Contributing Institution -->
        <xsl:if test="normalize-space(.)!=''">
            <xsl:if test="$baseURL = $oaiUrl/padig:url">
                <xsl:element name="edm:dataProvider">
                    <xsl:value-of select="$oaiUrl/padig:url[. = $baseURL]/@string"/>
                </xsl:element>
            </xsl:if>

        <!-- URL -->
            <xsl:element name="edm:isShownAt">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>

        <!-- Thumbnail -->
            <xsl:element name="edm:preview">
                <xsl:value-of select="$baseURL"/> <xsl:text>utils/getthumbnail/</xsl:text><xsl:value-of select="$objID"/>
            </xsl:element>

        <!-- IIIF Base URL -->
            <xsl:element name="svcs:hasService">
                <xsl:value-of select="$baseURL"/> <xsl:text>digital/iiif/</xsl:text><xsl:value-of select="$colID"/><xsl:text>/</xsl:text><xsl:value-of select="$itemID"/>
            </xsl:element>

        <!-- IIIF manifest -->
            <xsl:element name="dcterms:isReferencedBy">
                <xsl:value-of select="$baseURL"/> <xsl:text>iiif/info/</xsl:text><xsl:value-of select="$colID"/><xsl:text>/</xsl:text><xsl:value-of select="$itemID"/><xsl:text>/manifest.json</xsl:text>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- NAMED TEMPLATES -->

     <!-- Hub -->
    <xsl:template name="hub">
        <xsl:element name="edm:provider">
            <xsl:value-of>PA Digital</xsl:value-of>
        </xsl:element>
    </xsl:template>

     <!-- Subject template -->
    <xsl:template name="subj_template">
        <xsl:param name="strings"/>
        <xsl:param name="delimiter"/>

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($strings, $delimiter)">
                <xsl:variable name="newstem" select="normalize-space(substring-after($strings, $delimiter))"/>
                <xsl:variable name="firststem" select="normalize-space(substring-before($strings, $delimiter))"/>
                <xsl:if test="normalize-space($firststem)!=''">
                <dcterms:subject>
                    <xsl:value-of select="normalize-space($firststem)"/>
                </dcterms:subject>
                </xsl:if>

                <!--Need to do recursion-->
                <xsl:call-template name="subj_template">
                    <xsl:with-param name="strings" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="';'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="normalize-space($strings)!=''">
                    <dcterms:subject>
                    <xsl:value-of select="normalize-space($strings)"/>
                    </dcterms:subject>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

<!-- dcterms template -->
    <xsl:template name="delimiter_template">
        <xsl:param name="strings"/>
        <xsl:param name="delimiter"/>

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($strings, $delimiter)">
                <xsl:variable name="newstem" select="normalize-space(substring-after($strings, $delimiter))"/>
                <xsl:variable name="firststem" select="normalize-space(substring-before($strings, $delimiter))"/>
                <xsl:if test="normalize-space($firststem)!=''">
                <xsl:element name="{name()}">
                    <xsl:value-of select="normalize-space($firststem)" />
                </xsl:element>
                </xsl:if>
                <!--Need to do recursion-->
                <xsl:call-template name="delimiter_template">
                    <xsl:with-param name="strings" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="';'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="normalize-space($strings)!=''">
                  <xsl:element name="{name()}">
                    <xsl:value-of select="normalize-space($strings)"/>
                  </xsl:element>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Creator template -->
    <xsl:template name="crea_template">
        <xsl:param name="strings"/>
        <xsl:param name="delimiter"/>

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($strings, $delimiter)">
                <xsl:variable name="newstem" select="normalize-space(substring-after($strings, $delimiter))"/>
                <xsl:variable name="firststem" select="normalize-space(substring-before($strings, $delimiter))"/>
                <xsl:if test="normalize-space($firststem)!=''">
                    <xsl:element name="dcterms:creator">
                        <xsl:value-of select="normalize-space($firststem)" />
                    </xsl:element>
                </xsl:if>
                <!--Need to do recursion-->
                <xsl:call-template name="crea_template">
                    <xsl:with-param name="strings" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="';'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="normalize-space($strings)!=''">
                    <xsl:element name="dcterms:creator">
                        <xsl:value-of select="normalize-space($strings)"/>
                    </xsl:element>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Contributor template -->
    <xsl:template name="cont_template">
        <xsl:param name="strings"/>
        <xsl:param name="delimiter"/>

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($strings, $delimiter)">
                <xsl:variable name="newstem" select="normalize-space(substring-after($strings, $delimiter))"/>
                <xsl:variable name="firststem" select="normalize-space(substring-before($strings, $delimiter))"/>
                <xsl:if test="normalize-space($firststem)!=''">
                    <xsl:element name="dcterms:contributor">
                        <xsl:value-of select="normalize-space($firststem)" />
                    </xsl:element>
                </xsl:if>
                <!--Need to do recursion-->
                <xsl:call-template name="cont_template">
                    <xsl:with-param name="strings" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="';'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="normalize-space($strings)!=''">
                    <xsl:element name="dcterms:contributor">
                        <xsl:value-of select="normalize-space($strings)"/>
                    </xsl:element>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- File format template -->
    <xsl:template name="fform_template">
        <xsl:param name="strings"/>
        <xsl:param name="delimiter"/>

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($strings, $delimiter)">
                <xsl:variable name="newstem" select="normalize-space(substring-after($strings, $delimiter))"/>
                <xsl:variable name="firststem" select="normalize-space(substring-before($strings, $delimiter))"/>
                <xsl:if test="normalize-space($firststem)!=''">
                    <xsl:element name="schema:fileFormat">
                        <xsl:value-of select="normalize-space($firststem)" />
                    </xsl:element>
                </xsl:if>
                <!--Need to do recursion-->
                <xsl:call-template name="fform_template">
                    <xsl:with-param name="strings" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="';'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="normalize-space($strings)!=''">
                    <xsl:element name="schema:fileFormat">
                        <xsl:value-of select="normalize-space($strings)"/>
                    </xsl:element>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Source template -->
    <xsl:template name="sour_template">
        <xsl:param name="strings"/>
        <xsl:param name="delimiter"/>

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($strings, $delimiter)">
                <xsl:variable name="newstem" select="normalize-space(substring-after($strings, $delimiter))"/>
                <xsl:variable name="firststem" select="normalize-space(substring-before($strings, $delimiter))"/>
                <xsl:if test="normalize-space($firststem)!=''">
                    <xsl:element name="dcterms:source">
                        <xsl:value-of select="normalize-space($firststem)" />
                    </xsl:element>
                </xsl:if>
                <!--Need to do recursion-->
                <xsl:call-template name="sour_template">
                    <xsl:with-param name="strings" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="';'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="normalize-space($strings)!=''">
                    <xsl:element name="dcterms:source">
                        <xsl:value-of select="normalize-space($strings)"/>
                    </xsl:element>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Publisher template -->
    <xsl:template name="publ_template">
        <xsl:param name="strings"/>
        <xsl:param name="delimiter"/>

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($strings, $delimiter)">
                <xsl:variable name="newstem" select="normalize-space(substring-after($strings, $delimiter))"/>
                <xsl:variable name="firststem" select="normalize-space(substring-before($strings, $delimiter))"/>
                <xsl:if test="normalize-space($firststem)!=''">
                    <xsl:element name="dcterms:publisher">
                        <xsl:value-of select="normalize-space($firststem)" />
                    </xsl:element>
                </xsl:if>
                <!--Need to do recursion-->
                <xsl:call-template name="publ_template">
                    <xsl:with-param name="strings" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="';'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="normalize-space($strings)!=''">
                    <xsl:element name="dcterms:publisher">
                        <xsl:value-of select="normalize-space($strings)"/>
                    </xsl:element>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Date template -->
    <xsl:template name="date_template">
        <xsl:param name="strings"/>
        <xsl:param name="delimiter"/>

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($strings, $delimiter)">
                <xsl:variable name="newstem" select="normalize-space(substring-after($strings, $delimiter))"/>
                <xsl:variable name="firststem" select="normalize-space(substring-before($strings, $delimiter))"/>
                <xsl:if test="normalize-space($firststem)!=''">
                    <xsl:element name="dcterms:date">
                        <xsl:value-of select="normalize-space($firststem)" />
                    </xsl:element>
                </xsl:if>
                <!--Need to do recursion-->
                <xsl:call-template name="date_template">
                    <xsl:with-param name="strings" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="';'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="normalize-space($strings)!=''">
                    <xsl:element name="dcterms:date">
                        <xsl:value-of select="normalize-space($strings)"/>
                    </xsl:element>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Language template -->
    <xsl:template name="lang_template">
        <xsl:param name="strings"/>
        <xsl:param name="delimiter"/>

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($strings, $delimiter)">
                <xsl:variable name="newstem" select="normalize-space(substring-after($strings, $delimiter))"/>
                <xsl:variable name="firststem" select="normalize-space(substring-before($strings, $delimiter))"/>
                <xsl:choose>
                    <xsl:when test="(normalize-space($firststem)!='') and (normalize-space($firststem) = $dplahLang/padig:language)">
                        <xsl:element name="dcterms:language">
                            <xsl:value-of select="$dplahLang/padig:language[. = $firststem]/@string"/>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="normalize-space($firststem)!=''">
                            <xsl:element name="dcterms:language">
                                <xsl:value-of select="normalize-space($firststem)"/>
                            </xsl:element>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>

                <!--Need to do recursion-->
                <xsl:call-template name="lang_template">
                    <xsl:with-param name="strings" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="';'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="normalize-space($strings)!=''">
                    <xsl:choose>
                        <xsl:when test="(normalize-space($strings)!='') and (normalize-space($strings) = $dplahLang/padig:language)">
                            <xsl:element name="dcterms:language">
                                <xsl:value-of select="$dplahLang/padig:language[. = $strings]/@string"/>
                            </xsl:element>
                        </xsl:when>
                            <xsl:otherwise>
                                <xsl:if test="normalize-space($strings)!=''">
                                    <xsl:element name="dcterms:language">
                                        <xsl:value-of select="normalize-space($strings)"/>
                                    </xsl:element>
                                </xsl:if>
                            </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Relation template -->
    <xsl:template name="rela_template">
        <xsl:param name="strings"/>
        <xsl:param name="delimiter"/>

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($strings, $delimiter)">
                <xsl:variable name="newstem" select="normalize-space(substring-after($strings, $delimiter))"/>
                <xsl:variable name="firststem" select="normalize-space(substring-before($strings, $delimiter))"/>
                <xsl:if test="normalize-space($firststem)!=''">
                    <xsl:element name="dcterms:relation">
                        <xsl:value-of select="normalize-space($firststem)" />
                    </xsl:element>
                </xsl:if>
                <!--Need to do recursion-->
                <xsl:call-template name="rela_template">
                    <xsl:with-param name="strings" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="';'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="normalize-space($strings)!=''">
                    <xsl:element name="dcterms:relation">
                        <xsl:value-of select="normalize-space($strings)"/>
                    </xsl:element>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Rights template; this didn't work, but keeping it here -->
    <xsl:template name="rights_template">
        <xsl:param name="strings"/>
        <xsl:param name="delimiter"/>

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($strings, $delimiter)">
                <xsl:variable name="newstem" select="normalize-space(substring-after($strings, $delimiter))"/>
                <xsl:variable name="firststem" select="normalize-space(substring-before($strings, $delimiter))"/>
                <xsl:choose>
                    <xsl:when test="starts-with(., 'http://rightsstatements.org/vocab/') or starts-with(., 'http://creativecommons.org/') or starts-with(., 'https://creativecommons.org/')">
                        <xsl:if test="normalize-space(.)!=''">
                            <xsl:element name="edm:rights">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                        </xsl:if>
                    </xsl:when>
                    <!-- Rights text -->
                    <xsl:otherwise>
                        <xsl:if test="normalize-space(.)!=''">
                            <xsl:element name="dcterms:rights">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>

                <!--Need to do recursion-->
                <xsl:call-template name="rights_template">
                    <xsl:with-param name="strings" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="';'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="contains($strings, $delimiter)">
                        <xsl:variable name="newstem" select="normalize-space(substring-after($strings, $delimiter))"/>
                        <xsl:variable name="firststem" select="normalize-space(substring-before($strings, $delimiter))"/>
                        <xsl:choose>
                            <xsl:when test="starts-with(., 'http://rightsstatements.org/vocab/') or starts-with(., 'http://creativecommons.org/') or starts-with(., 'https://creativecommons.org/')">
                                <xsl:if test="normalize-space(.)!=''">
                                    <xsl:element name="edm:rights">
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </xsl:element>
                                </xsl:if>
                            </xsl:when>
                            <!-- Rights text -->
                            <xsl:otherwise>
                                <xsl:if test="normalize-space(.)!=''">
                                    <xsl:element name="dcterms:rights">
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </xsl:element>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Type template -->
    <xsl:template name="type_template">
        <xsl:param name="strings"/>
        <xsl:param name="delimiter"/>

            <xsl:choose>
                <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
                <xsl:when test="contains($strings, $delimiter)">
                    <xsl:variable name="newstem" select="normalize-space(substring-after($strings, $delimiter))"/>
                    <xsl:variable name="firststem" select="normalize-space(substring-before($strings, $delimiter))"/>
                    <xsl:choose>
                        <xsl:when test="matches($firststem, '(^text.*$)', 'i')">
                            <dcterms:type>Text</dcterms:type>
                        </xsl:when>
                        <xsl:when test="matches($firststem, '(^image.*$)', 'i')">
                            <dcterms:type>Image</dcterms:type>
                        </xsl:when>
                        <xsl:when test="matches($firststem, '^(movingimage.*$|moving\simage.*$)', 'i')">
                            <dcterms:type>Moving Image</dcterms:type>
                        </xsl:when>
                        <xsl:when test="matches($firststem, '^(sound.*$)', 'i')">
                            <dcterms:type>Sound</dcterms:type>
                        </xsl:when>
                        <xsl:when test="matches($firststem, '^(physicalobject.*$|physical\sobject.*$)', 'i')">
                            <dcterms:type>Physical Object</dcterms:type>
                        </xsl:when>
                        <xsl:when
                            test="matches($firststem, '^(interactiveresource.*$|interactive\sresource.*$)', 'i')">
                            <dcterms:type>Interactive Resource</dcterms:type>
                        </xsl:when>
                        <xsl:when
                            test="matches($firststem, '^(stillimage.*$|still\simage.*$)', 'i')">
                            <dcterms:type>Still Image</dcterms:type>
                        </xsl:when>

                        <!-- Format -->
                        <xsl:otherwise>
                            <xsl:if test="normalize-space($firststem)!=''">
                            <dcterms:format>
                                <xsl:value-of select="normalize-space($firststem)"/>
                            </dcterms:format>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>

                    <!--Need to do recursion-->
                    <xsl:call-template name="type_template">
                        <xsl:with-param name="strings" select="$newstem"/>
                        <xsl:with-param name="delimiter" select="';'"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="matches($strings, '(^text.*$)', 'i')">
                            <dcterms:type>Text</dcterms:type>
                        </xsl:when>
                        <xsl:when test="matches($strings, '(^image.*$)', 'i')">
                            <dcterms:type>Image</dcterms:type>
                        </xsl:when>
                        <xsl:when test="matches($strings, '^(movingimage.*$|moving\simage.*$)', 'i')">
                            <dcterms:type>Moving Image</dcterms:type>
                        </xsl:when>
                        <xsl:when test="matches($strings, '^(sound.*$)', 'i')">
                            <dcterms:type>Sound</dcterms:type>
                        </xsl:when>
                        <xsl:when test="matches($strings, '^(physicalobject.*$|physical\sobject.*$)', 'i')">
                            <dcterms:type>Physical Object</dcterms:type>
                        </xsl:when>
                        <xsl:when
                            test="matches($strings, '^(interactiveresource.*$|interactive\sresource.*$)', 'i')">
                            <dcterms:type>Interactive Resource</dcterms:type>
                        </xsl:when>
                        <xsl:when
                            test="matches($strings, '^(stillimage.*$|still\simage.*$)', 'i')">
                            <dcterms:type>Still Image</dcterms:type>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="normalize-space($strings)!=''">
                            <dcterms:format>
                                <xsl:value-of select="normalize-space($strings)"/>
                            </dcterms:format>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
