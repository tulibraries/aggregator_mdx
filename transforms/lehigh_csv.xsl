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

    <!-- Use includes here if you need to separate out templates for either use specific to a dataset or use generic enough for multiple providers (like remediation.xslt). -->

    <!-- For using this XSLT in Combine, you need to replace the following with an actionable HTTP link to the remediation XSLT, or load both XSLT into Combine then rename this to the filepath & name assigned to remediation.xslt within Combine. -->

    <xsl:include href="remediations/lookup.xsl"/>
    <xsl:include href="remediations/filter.xsl"/>

    <!-- drop nodes we don't care about (header values, records marked deleted, specific relation fields) -->
    <xsl:template match="text() | @*"/>

    <!-- base record. Matches each OAI feed record that is mapped. Filters out records with dc:identifier values contained in remediation_filter.xsl -->
    <xsl:template match="//record">
        <oai_dc:dc xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dpla="http://dp.la/about/map/" xmlns:edm="http://www.europeana.eu/schemas/edm/" xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" xmlns:oai_qdc="http://worldcat.org/xmlschemas/qdc-1.0/" xmlns:oclc="http://purl.org/oclc/terms/" xmlns:oclcdc="http://worldcat.org/xmlschemas/oclcdc-1.0/" xmlns:oclcterms="http://purl.org/oclc/terms/" xmlns:schema="http://schema.org">

            <!-- will match specific templates that relevant for dplah. -->
            <xsl:apply-templates/>

            <!-- add templates you have to call - e.g. named templates; matched templates with mode -->
            <xsl:call-template name="hub"/>
        </oai_dc:dc>
    </xsl:template>

    <!-- FREE LIBRARY-SPECIFIC IDENTITY TEMPLATES -->

    <!-- Collection Name -->
    <xsl:template match="Collection_Name">
        <xsl:if test="normalize-space(.)">
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
    
    <!-- Publisher -->
    <xsl:template match="Publisher">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dcterms:publisher">
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
    
    <!-- Rights URI -->
    <xsl:template match="Rights_URI">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="edm:rights">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- File Format -->
    <xsl:template match="Format">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="schema:fileFormat">
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
            <xsl:call-template name="lang_template">
                <xsl:with-param name="strings" select="normalize-space(.)"/>
                <xsl:with-param name="delimiter" select="'|'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- Subject -->
    <xsl:template match="Subject">
        <xsl:call-template name="subj_template">
            <xsl:with-param name="strings" select="."/>
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
    
    <!-- Contributing Institution -->
    <xsl:template match="Data_Provider">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="edm:dataProvider">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>


    <!-- Type -->
    <xsl:template match="Type">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:choose>
                <xsl:when test="matches(lower-case(.), '(^text.*$)', 'i')">
                    <dcterms:type>Text</dcterms:type>
                </xsl:when>
                <xsl:when test="matches(lower-case(.), '(^image.*$)', 'i')">
                    <dcterms:type>Image</dcterms:type>
                </xsl:when>
                <xsl:when test="matches(lower-case(.), '^(movingimage.*$|moving\simage.*$)', 'i')">
                    <dcterms:type>Moving Image</dcterms:type>
                </xsl:when>
                <xsl:when test="matches(lower-case(.), '^(sound.*$)', 'i')">
                    <dcterms:type>Sound</dcterms:type>
                </xsl:when>
                <xsl:when test="matches(lower-case(.), '^(physicalobject.*$|physical\sobject.*$)', 'i')">
                    <dcterms:type>Physical Object</dcterms:type>
                </xsl:when>
                <xsl:when test="matches(lower-case(.), '^(interactiveresource.*$|interactive\sresource.*$)', 'i')">
                    <dcterms:type>Interactive Resource</dcterms:type>
                </xsl:when>
                <xsl:when test="matches(lower-case(.), '^(stillimage.*$|still\simage.*$)', 'i')">
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

    <!-- NAMED TEMPLATES -->

    <!-- Hub -->
    <xsl:template name="hub">
        <xsl:element name="edm:provider">
            <xsl:value-of>PA Digital</xsl:value-of>
        </xsl:element>
    </xsl:template>

    <!-- Subject -->
    <xsl:template name="subj_template">
        <xsl:param name="strings"/>
        <xsl:param name="delimiter"/>

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($strings, $delimiter)">
                <xsl:variable name="newstem" select="substring-after($strings, $delimiter)"/>
                <dcterms:subject>
                    <xsl:value-of select="normalize-space(substring-before($strings, $delimiter))"/>
                </dcterms:subject>

                <!--Need to do recursion-->
                <xsl:call-template name="subj_template">
                    <xsl:with-param name="strings" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="'|'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <dcterms:subject>
                    <xsl:value-of select="normalize-space($strings)"/>
                </dcterms:subject>
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
                    <xsl:with-param name="delimiter" select="'|'"/>
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

    <!-- Type -->
    <xsl:template name="type_template">
        <xsl:param name="strings"/>
        <xsl:param name="delimiter"/>

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($strings, $delimiter)">
                <xsl:variable name="newstem" select="substring-after($strings, $delimiter)"/>
                <dcterms:type>
                    <xsl:value-of select="substring-before($strings, $delimiter)"/>
                </dcterms:type>

                <!--Need to do recursion-->
                <xsl:call-template name="type_template">
                    <xsl:with-param name="strings" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="'|'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <dcterms:type>
                    <xsl:value-of select="normalize-space($strings)"/>
                </dcterms:type>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
