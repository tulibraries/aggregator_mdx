<?xml version="1.0" encoding="UTF-8"?>

<!-- Funcake name: 'Historic Pittsburgh transform' -->

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
    <xsl:include href="remediations/filter.xsl"/>
        
    <!-- drop nodes we don't care about, namely, header values -->
    <xsl:template match="text() | @*"/>
    
    <!-- drop records where the OAI header is marked as 'deleted' -->
    <xsl:template match="//oai:record[oai:header[@status='deleted']]/*"/>
    
    <!-- base record. Matches each OAI feed record that is mapped. Filters out records with dc:identifier values contained in remediation_filter.xsl -->
    <xsl:template match="//oai_dc:dc[not(dc:relation[string()= 'pdcp_noharvest'])]">
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
            
            <!-- will match specific templates that relevant for dplah. -->
            <xsl:apply-templates />
            
            <!-- add templates you have to call - e.g. named templates; matched templates with mode -->
			<xsl:call-template name="intprovider"/>
            <xsl:call-template name="hub"/>
        </oai_dc:dc>
    </xsl:template>
   
<!--   
    <xsl:template match="//setSpec">
        <xsl:if test="normalize-space(lower-case(.))">
            <xsl:variable name="setID" select="normalize-space(lower-case(.))"/>
            <xsl:if test="$setID = $setSpecList/padig:set">
                <xsl:element name="dcterms:isPartOf">
                    <xsl:value-of select="$setSpecList/padig:set[. = $setID]/@string"/>
                </xsl:element>
            </xsl:if>
        </xsl:if>
    </xsl:template>
-->

     <!-- Title -->
    <xsl:template match="dc:title">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:title">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template match="dc:contributor">
        <xsl:variable name="contributingInst" select='substring-before(.," (depositor)")'/>
        <xsl:if test="normalize-space(.)!=''">
        <xsl:choose>
            <xsl:when test="ends-with(., '(depositor)')">
                <xsl:element name="edm:dataProvider">
                        <xsl:value-of select="$contributingInst"/>
                    </xsl:element>
            </xsl:when>
            
            <!-- Rights -->
            <xsl:otherwise>
                <xsl:if test="normalize-space(.)!=''">
                    <xsl:element name="dcterms:contributor">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
        </xsl:if>
    </xsl:template>
    

     <!-- Alternative titles -->
     <xsl:template match="dcterms:alternative">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:alternative">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- Type -->
    <xsl:template match="dc:type">
        <xsl:if test="normalize-space(.)!=''">
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
                <xsl:when
                    test="matches(., '^(stillimage.*$|still\simage.*$)', 'i')">
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

     <!-- Creator -->
    <xsl:template match="dc:creator">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:creator">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

     <!-- Source; uncomment when not used by DPLAH crosswalk -->
    <xsl:template match="dc:source">
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

     <!-- Place (when oai_dc used) -->
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
            <xsl:with-param name="stringz" select="."/>
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

     <!-- Relation -->
    <xsl:template match="dc:relation">
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
    <xsl:template match="dc:identifier">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:identifier">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>


    <!-- Thumbnail URL -->
    <xsl:template match="dc:identifier.thumbnail">
        <xsl:variable name="ObjURL" select='substring-before(.,"/datastream/TN/view/")'/>
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="edm:isShownAt">
                <xsl:value-of select="$ObjURL"/>
            </xsl:element>
            <xsl:element name="edm:preview">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
	
	<!-- Intermediate provider -->
	<xsl:template name="intprovider">
		<xsl:element name="dpla:intermediateProvider">
            <xsl:value-of>Historic Pittsburgh</xsl:value-of>
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
