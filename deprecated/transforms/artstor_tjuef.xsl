<?xml version="1.0" encoding="UTF-8"?>
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
    
    <xsl:include href="remediations/lookup.xsl"/>
    
    <xsl:template match="text() | @*"/>
    
    <xsl:template match="//oai:record">
    
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
        <xsl:call-template name="dataProvider"/>
        <xsl:call-template name="hub"/>
    </oai_dc:dc>
    </xsl:template>
    
    <!-- isPartOf -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='source']">
        <xsl:variable name="norm_string" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
        <xsl:if test="normalize-space($norm_string)!=''">
            <xsl:element name="dcterms:isPartOf">
                <xsl:value-of select="normalize-space($norm_string)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- isShownAt -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='identifier']">
        <xsl:variable name="isShownAt" select="substring-after(.,'ADLImageViewer:')"/>
        <xsl:variable name="itemID" select="substring-after($isShownAt,'/ssid/')"/>
        
        <xsl:if test="substring-before(.,$isShownAt)='ADLImageViewer:'">
            <xsl:element name="edm:isShownAt">
                <xsl:value-of select="normalize-space($isShownAt)"/>
            </xsl:element>
            
            <xsl:element name="dcterms:identifier">
                <xsl:value-of select="'padig:TJUEF-'"/><xsl:value-of select="normalize-space($itemID)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
        
    
    <!-- Title -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='title'][1]">
    <xsl:variable name="norm_string" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
        <xsl:if test="normalize-space($norm_string)!=''">
            <xsl:element name="dcterms:title">
                <xsl:value-of select="normalize-space($norm_string)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- Alternative titles -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='title'][position()>1]">
        <xsl:variable name="norm_string" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
        <xsl:if test="normalize-space($norm_string)!=''">
            <xsl:element name="dcterms:alternative">
                <xsl:value-of select="normalize-space($norm_string)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://purl.org/dc/terms/' and local-name()='alternative']">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="delimiter_template">
                <xsl:with-param name="strings" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <!-- Type and Format -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='type']">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="type_template">
                <xsl:with-param name="strings" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    
    <!-- File format -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='format']">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="fform_template">
                <xsl:with-param name="strings" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <!-- Creator -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='creator']">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="crea_template">
                <xsl:with-param name="strings" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <!-- Contributor -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='contributor']">
        <xsl:if test="normalize-space(.)!='' and normalize-space()!='Jefferson - East Falls'">
            <xsl:call-template name="cont_template">
                <xsl:with-param name="strings" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <!-- Source
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='source']">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="sour_template">
                <xsl:with-param name="strings" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    -->
    
    <!-- Publisher -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='publisher']">
        <xsl:variable name="norm_string" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
        <xsl:if test="normalize-space($norm_string)!=''">
            <xsl:element name="dcterms:publisher">
                <xsl:value-of select="normalize-space($norm_string)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- Description -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='description']">
        <xsl:variable name="norm_string" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
        <xsl:if test="normalize-space($norm_string)!='' and not(ends-with(normalize-space($norm_string),'thumbnail.jpg'))">
            <xsl:element name="dcterms:description">
                <xsl:value-of select="$norm_string"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- Place -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://purl.org/dc/terms/' and local-name()='spatial']">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="delimiter_template">
                <xsl:with-param name="strings" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='coverage']">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="spatial_template">
                <xsl:with-param name="strings" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <!-- Temporal coverage -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://purl.org/dc/terms/' and local-name()='temporal']">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="delimiter_template">
                <xsl:with-param name="strings" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <!-- Extent -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://purl.org/dc/terms/' and local-name()='extent']">
        <xsl:variable name="norm_string" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
        <xsl:if test="normalize-space($norm_string)!=''">
            <xsl:element name="dcterms:extent">
                <xsl:value-of select="normalize-space($norm_string)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- Date -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='date']">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="date_template">
                <xsl:with-param name="strings" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <!-- Subject -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='subject']">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="subj_template">
                <xsl:with-param name="strings" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <!-- Language -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='language']">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="lang_template">
                <xsl:with-param name="strings" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <!-- Relation -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='relation']">
        <xsl:variable name="norm_string" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
        <xsl:if test="normalize-space($norm_string)!=''">
            <xsl:element name="dcterms:relation">
                <xsl:value-of select="normalize-space($norm_string)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- Replaced by -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://purl.org/dc/terms/' and local-name()='isReplacedBy']">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="delimiter_template">
                <xsl:with-param name="strings" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <!-- Replaces -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://purl.org/dc/terms/' and local-name()='replaces']">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="delimiter_template">
                 <xsl:with-param name="strings" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <!-- Rights and Rights URI -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='rights']">
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
    
    <!-- Rights holder -->
    <xsl:template match="//*[namespace-uri()='http://www.openarchives.org/OAI/2.0/oai_dc/' and local-name()='dc']/*[namespace-uri()='http://purl.org/dc/terms/' and local-name()='rightsHolder']">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="delimiter_template">
                <xsl:with-param name="strings" select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
<!-- TEMPLATES -->
    
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

    <!-- Coverage template -->
    <xsl:template name="spatial_template">
        <xsl:param name="strings"/>
        <xsl:param name="delimiter"/>
        
        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($strings, $delimiter)">
                <xsl:variable name="newstem" select="normalize-space(substring-after($strings, $delimiter))"/>
                <xsl:variable name="firststem" select="normalize-space(substring-before($strings, $delimiter))"/>
                <xsl:if test="normalize-space($firststem)!=''">
                    <xsl:element name="dcterms:spatial">
                        <xsl:value-of select="normalize-space($firststem)" />
                    </xsl:element>
                </xsl:if>
                <!--Need to do recursion-->
                <xsl:call-template name="spatial_template">
                    <xsl:with-param name="strings" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="';'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="normalize-space($strings)!=''">
                    <xsl:element name="dcterms:spatial">
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
                <xsl:choose>
                    <xsl:when test="(normalize-space($firststem)!='') and (lower-case(normalize-space($firststem)) = $fFormatList/padig:fformat)">
                        <xsl:element name="schema:fileFormat">
                            <xsl:value-of select="$fFormatList/padig:fformat[. = lower-case($firststem)]/@string"/>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="normalize-space($firststem)!=''">
                            <xsl:element name="schema:fileFormat">
                                <xsl:value-of select="normalize-space($firststem)"/>
                            </xsl:element>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                
                <!--Need to do recursion-->
                <xsl:call-template name="fform_template">
                    <xsl:with-param name="strings" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="';'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="normalize-space($strings)!=''">
                    <xsl:choose>
                        <xsl:when test="(normalize-space($strings)!='') and (lower-case(normalize-space($strings)) = $fFormatList/padig:fformat)">
                            <xsl:element name="schema:fileFormat">
                                <xsl:value-of select="$fFormatList/padig:fformat[. = lower-case($strings)]/@string"/>
                            </xsl:element>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="normalize-space($strings)!=''">
                                <xsl:element name="schema:fileFormat">
                                    <xsl:value-of select="normalize-space($strings)"/>
                                </xsl:element>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
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
                    <xsl:when test="(normalize-space($firststem)!='') and (lower-case(normalize-space($firststem)) = $dplahLang/padig:language)">
                        <xsl:element name="dcterms:language">
                            <xsl:value-of select="$dplahLang/padig:language[. = lower-case($firststem)]/@string"/>
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
                        <xsl:when test="(normalize-space($strings)!='') and (lower-case(normalize-space($strings)) = $dplahLang/padig:language)">
                            <xsl:element name="dcterms:language">
                                <xsl:value-of select="$dplahLang/padig:language[. = lower-case($strings)]/@string"/>
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
                                <xsl:value-of select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
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
                                        <xsl:value-of select="replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&amp;quot;','&quot;')"/>
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
    
    <!-- dataProvider -->
    <xsl:template name="dataProvider">
        <xsl:element name="edm:dataProvider">
            <xsl:value-of>Jefferson - East Falls</xsl:value-of>
        </xsl:element>
    </xsl:template>
    
    <!-- Hub -->
    <xsl:template name="hub">
        <xsl:element name="edm:provider">
            <xsl:value-of>PA Digital</xsl:value-of>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>