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
    
    <!-- Use includes here if you need to separate out templates for either use specific to a dataset or use generic enough for multiple providers (like remediation.xslt). -->
    
    <xsl:include href="oai_base_crosswalk.xsl"/>
    
    <!-- Create collection name -->
    
    <xsl:template match="oai:header/oai:setSpec">
        <xsl:call-template name="isPartOf"/>
    </xsl:template>
    
    <xsl:template match="dcterms:isPartOf" priority="1">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="delimiter_template">
                <xsl:with-param name="strings" select="replace(normalize-space(.),'&amp;amp;','&amp;')"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="dc:identifier[position() = last()]">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="dataProvider"/>
            <xsl:call-template name="identifier"/>
            <xsl:call-template name="isShownAt"/>
            <xsl:call-template name="preview"/>
            <xsl:call-template name="iiifBase"/>
            <xsl:call-template name="iiifManifest"/>
        </xsl:if>
    </xsl:template> 
    
    <!-- Supplemental Type and Format -->
    <xsl:template match="dc:type" priority="1">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="supplemental_type_template">
                <xsl:with-param name="strings" select="replace(normalize-space(.),'&amp;amp;','&amp;')"/>
                <xsl:with-param name="delimiter" select="';'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <!-- templates -->
    
    <!-- isPartOf -->
    <xsl:template name="isPartOf">
        
        <xsl:variable name="setID" select="normalize-space(lower-case(.))"/>
        <xsl:if test="$setID = $setSpecList/padig:set">
            <xsl:element name="dcterms:isPartOf">
                <xsl:value-of select="$setSpecList/padig:set[. = $setID]/@string"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- dataProvider -->
    <xsl:template name="dataProvider">
        <xsl:variable name="baseURL" select='substring-before(.,"cdm/ref/")'/>
        <xsl:if test="$baseURL = $oaiUrl/padig:url">
            <xsl:element name="edm:dataProvider">
                <xsl:value-of select="$oaiUrl/padig:url[. = $baseURL]/@string"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- identifier -->
    <xsl:template name="identifier">
        <xsl:variable name="itemID" select='substring-after(.,"/id/")'/>
        <xsl:variable name="colID" select='substring-before(substring-after(.,"collection/"), "/id")'/>
        <xsl:variable name="baseURL" select='substring-before(.,"cdm/ref/")'/>
        
        <xsl:element name="dcterms:identifier">
            <xsl:value-of>padig:</xsl:value-of><xsl:value-of select="$oaiUrl/padig:url[. = $baseURL]/@code"/><xsl:value-of>-</xsl:value-of><xsl:value-of select="$colID"/><xsl:value-of>-</xsl:value-of><xsl:value-of select="$itemID"/>
        </xsl:element>
    </xsl:template>
    
    <!-- isShownAt -->
    <xsl:template name="isShownAt">
        <xsl:element name="edm:isShownAt">
            <xsl:value-of select="normalize-space(.)"/>
        </xsl:element>
    </xsl:template>
    
    <!-- preview -->
    <xsl:template name="preview">
        <xsl:variable name="baseURL" select='substring-before(.,"cdm/ref/")'/>
        <xsl:variable name="objID" select='substring-after(.,"/cdm/ref/")'/>
        
        <xsl:element name="edm:preview">
            <xsl:value-of select="$baseURL"/> <xsl:text>utils/getthumbnail/</xsl:text><xsl:value-of select="$objID"/>
        </xsl:element>
    </xsl:template>
    
    <!-- iiifBase -->
    <xsl:template name="iiifBase">
        <xsl:variable name="baseURL" select='substring-before(.,"cdm/ref/")'/>
        <xsl:variable name="itemID" select='substring-after(.,"/id/")'/>
        <xsl:variable name="colID" select='substring-before(substring-after(.,"collection/"), "/id")'/>
        
        <xsl:element name="svcs:hasService">
            <xsl:value-of select="$baseURL"/> <xsl:text>digital/iiif/</xsl:text><xsl:value-of select="$colID"/><xsl:text>/</xsl:text><xsl:value-of select="$itemID"/>
        </xsl:element>
    </xsl:template>
    
    <!-- iiifManifest -->
    <xsl:template name="iiifManifest">
        <xsl:variable name="baseURL" select='substring-before(.,"cdm/ref/")'/>
        <xsl:variable name="itemID" select='substring-after(.,"/id/")'/>
        <xsl:variable name="colID" select='substring-before(substring-after(.,"collection/"), "/id")'/>
        
        <xsl:element name="dcterms:isReferencedBy">
            <xsl:value-of select="$baseURL"/> <xsl:text>iiif/info/</xsl:text><xsl:value-of select="$colID"/><xsl:text>/</xsl:text><xsl:value-of select="$itemID"/><xsl:text>/manifest.json</xsl:text>
        </xsl:element>
    </xsl:template>  
    
    <!-- Supplemental Type Template for Temple -->
    
    <xsl:template name="supplemental_type_template">
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
                    <!-- Temple customization starts here -->
                    <xsl:when test="matches($firststem, '(^administrativerecord.*$|administrative\srecord.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($firststem, '(^book.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($firststem, '(^clipping.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($firststem, '(^coursecatalog.*$|course\scatalog.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($firststem, '(^correspondence.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($firststem, '(^ephemera.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($firststem, '(^financialrecord.*$|financial\srecord)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($firststem, '(^graphicart.*$|graphic\sart.*$)', 'i')">
                        <dcterms:type>Image</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($firststem, '(^manuscript.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($firststem, '(^map.*$)', 'i')">
                        <dcterms:type>Image</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($firststem, '(^object.*$)', 'i')">
                        <dcterms:type>Physical Object</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($firststem, '(^pamphlet.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($firststem, '(^periodical.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($firststem, '(^photograph.*$)', 'i')">
                        <dcterms:type>Still Image</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($firststem, '(^poster.*$)', 'i')">
                        <dcterms:type>Still Image</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($firststem, '(^publication.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($firststem, '(^report.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($firststem, '(^sheetmusic.*$|sheet\smusic.*$)', 'i')">
                        <dcterms:type>Image</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($firststem, '(^slide.*$)', 'i')">
                        <dcterms:type>Still Image</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when> 
                    <xsl:when test="matches($firststem, '(^transcript.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($firststem, '(^video.*$)', 'i')">
                        <dcterms:type>Moving Image</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($firststem, '(^yearbook.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($firststem)"/></dcterms:format>
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
                <xsl:call-template name="supplemental_type_template">
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
                    <!-- Temple customization starts here -->
                    <xsl:when test="matches($strings, '(^administrativerecord.*$|administrative\srecord.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^book.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^clipping.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^coursecatalog.*$|course\scatalog.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^correspondence.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^ephemera.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^financialrecord.*$|financial\srecord)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^graphicart.*$|graphic\sart.*$)', 'i')">
                        <dcterms:type>Image</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^manuscript.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^map.*$)', 'i')">
                        <dcterms:type>Image</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^object.*$)', 'i')">
                        <dcterms:type>Physical Object</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^pamphlet.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^periodical.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^photograph.*$)', 'i')">
                        <dcterms:type>Still Image</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^poster.*$)', 'i')">
                        <dcterms:type>Still Image</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^publication.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^report.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^sheetmusic.*$|sheet\smusic.*$)', 'i')">
                        <dcterms:type>Image</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^slide.*$)', 'i')">
                        <dcterms:type>Still Image</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^transcript.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^video.*$)', 'i')">
                        <dcterms:type>Moving Image</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <xsl:when test="matches($strings, '(^yearbook.*$)', 'i')">
                        <dcterms:type>Text</dcterms:type>
                        <dcterms:format><xsl:value-of select="normalize-space($strings)"/></dcterms:format>
                    </xsl:when>
                    <!-- Format -->
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
