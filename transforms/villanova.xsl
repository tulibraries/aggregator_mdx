<?xml version="1.0" encoding="UTF-8"?>
<!-- Funcake name: 'Villanova' -->
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
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
    xmlns:oclc="http://purl.org/oclc/terms/"
    xmlns:oai_qdc="http://worldcat.org/xmlschemas/qdc-1.0/"
    xmlns:schema="http://schema.org"
    xmlns:svcs="http://rdfs.org/sioc/services"
    version="2.0">
    <xsl:output omit-xml-declaration="no" method="xml" encoding="UTF-8" indent="yes"/>

    <xsl:include href="remediations/lookup.xsl"/>

    <!-- drop nodes we don't care about, namely, header values -->
    <xsl:template match="text() | @*"/>

    <!-- drop records where the OAI header is marked as 'deleted' -->
    <xsl:template match="//oai:record[oai:header[@status='deleted']]/*"/>

    <!-- base record. Matches each OAI feed record that is mapped. Filters out records with dc:identifier values contained in remediation_filter.xsl -->
    <xsl:template match="//oai_dc:dc[not(dc:relation[string()= 'pdcp_noharvest'])]">
        <oai_dc:dc
            xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
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

            <!-- will match specific templates that relevant for dplah. -->
            <xsl:apply-templates />

            <!-- add templates you have to call - e.g. named templates; matched templates with mode -->
            <xsl:call-template name="collectionName"/>
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

    <!-- Type and Format -->
    <xsl:template match="dc:type">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="type_template">
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

    <!-- Publisher -->
    <xsl:template match="dc:publisher">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:publisher">
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

    <!--Create dcterms: identifier, $baseURL, and $objID -->
    <xsl:template match="dc:identifier">
        <xsl:variable name="objID" select='substring-after(.,"https://digital.library.villanova.edu/Item/")'/>
        <xsl:variable name="baseURL" select='substring-before(.,"Item/")'/>

        <!-- Contributing Institution -->
        <xsl:if test="normalize-space(.)!=''">
            <xsl:if test="$baseURL = $oaiUrl/padig:url">
                <xsl:element name="edm:dataProvider">
                    <xsl:value-of select="$oaiUrl/padig:url[. = $baseURL]/@string"/>
                </xsl:element>
            </xsl:if>

        <!-- Identifier -->
            <xsl:element name="dcterms:identifier">
                <xsl:value-of select="$objID"/>
            </xsl:element>

        <!-- URL -->
            <xsl:element name="edm:isShownAt">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>

        <!-- Preview -->
            <xsl:element name="edm:preview">
                <xsl:text>https://digital.library.villanova.edu/files/</xsl:text><xsl:value-of select="$objID"/><xsl:text>/THUMBNAIL</xsl:text>
            </xsl:element>

        <!-- IIIF Manifest -->
            <xsl:element name="dcterms:isReferencedBy">
                <xsl:value-of select="normalize-space(.)"/><xsl:text>/Manifest</xsl:text>
            </xsl:element>
        </xsl:if>
    </xsl:template>


<!-- Templates -->

    <!-- Collection name -->
    <xsl:template name="collectionName">
        <xsl:element name="dcterms:isPartOf">
            <xsl:value-of><xsl:text>Villanova University Digital Collections</xsl:text></xsl:value-of>
        </xsl:element>
    </xsl:template>

     <!-- Hub -->
    <xsl:template name="hub">
        <xsl:element name="edm:provider">
            <xsl:value-of>PA Digital</xsl:value-of>
        </xsl:element>
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

</xsl:stylesheet>
