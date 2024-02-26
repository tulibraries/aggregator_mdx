<?xml version="1.0" encoding="UTF-8"?>
<!-- Funcake name: 'PAB' -->
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

    <!-- Include base crosswalk -->

    <xsl:include href="oai_base_crosswalk.xsl"/>
    
    <!-- Call identifier templates -->
    
    <xsl:template match="dc:identifier">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="isShownAt"/>
            <xsl:call-template name="identifier"/>
        </xsl:if>
    </xsl:template>
    
    <!-- Call preview template -->
    
    <xsl:template match="dcterms:hasVersion" priority="1">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="preview"/>
        </xsl:if>
    </xsl:template>
    
    <!-- Call iiifManifest template -->
    
    <xsl:template match="dcterms:hasFormat" priority="1">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="iiifManifest"/>
        </xsl:if>
    </xsl:template>
    
    <!-- Call collection name template -->   
    
    <xsl:template match="dcterms:isPartOf" priority="1">
        <xsl:call-template name="isPartOf"/>
    </xsl:template>
    
    <!-- Map medium to format-->   
    
    <xsl:template match="dcterms:medium" priority="1">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dcterms:format">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- Map source to dataProvider -->
    
    <xsl:template match="dc:source" priority="1">
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="edm:dataProvider">
                <xsl:value-of select="normalize-space(.)"/>
        </xsl:element>
        </xsl:if>
    </xsl:template>  
    
    <!-- Call template to remove HTML from dc:relation -->
    
    <xsl:template match="dc:relation" priority="1">
        <xsl:call-template name="relation"/>
    </xsl:template>
    
    <!-- Call template to remove HTML from dc:rights -->
    
    <xsl:template match="dc:rights" priority="1">
        <xsl:call-template name="rights"/>
    </xsl:template>
            
    <!-- templates -->
    
    <!-- isPartOf -->
    <xsl:template name="isPartOf">
        <xsl:element name="dcterms:isPartOf">
            <xsl:value-of select="normalize-space(.)"/>
        </xsl:element>
    </xsl:template>
    
    <!-- identifier -->
    <xsl:template name="identifier">
        <xsl:variable name="objID" select='substring-after(.,"ho_display.cfm/")'/>
        <xsl:variable name="baseURL" select='substring-before(.,"app/")'/>
        
        <xsl:if test="$baseURL = $oaiUrlInt/padig:url">
            <xsl:element name="dcterms:identifier">
                <xsl:value-of>padig:</xsl:value-of><xsl:value-of select="$oaiUrlInt/padig:url[. = $baseURL]/@code"/><xsl:value-of>-</xsl:value-of><xsl:value-of select="$objID"/>
            </xsl:element>
            
            <!-- intermediateProvider -->
            
            <xsl:element name="dpla:intermediateProvider">
                <xsl:value-of select="$oaiUrlInt/padig:url[. = $baseURL]/@string"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- isShownAt -->
    <xsl:template name="isShownAt">
        <xsl:element name="edm:isShownAt">
            <xsl:value-of select="normalize-space(.)"/>
        </xsl:element>
    </xsl:template>
    
    <!-- preview -->
    <xsl:template name="preview">
        <xsl:variable name="partialURL" select='substring-after(.,"iiif.cfm/")'/>
        <xsl:variable name="objID" select='substring-before($partialURL,"/full")'/>
        <xsl:element name="edm:preview">
            <xsl:text>https://www.philadelphiabuildings.org/pab/iiif.cfm/</xsl:text><xsl:value-of select="$objID"/><xsl:text>/full/300,/0/default.jpg</xsl:text>
        </xsl:element>
    </xsl:template>
    
    <!-- iiifManifest -->
    <xsl:template name="iiifManifest">
        <xsl:element name="dcterms:isReferencedBy">
            <xsl:value-of select="normalize-space(.)"/>
        </xsl:element>
    </xsl:template>
    
    <!-- relation -->  
    <xsl:template name="relation">
            <xsl:choose>
                <xsl:when test="contains(.,'&lt;a href')">
                    <xsl:variable name="string1" select="normalize-space(substring-after(.,'&quot;&gt;'))" />
                    <xsl:variable name="linkValue" select="normalize-space(substring-before($string1,'&lt;/a&gt;'))"/>
                    <xsl:variable name="string2" select="normalize-space(substring-after(.,'&lt;a href=&quot;'))"/>
                    <xsl:variable name="linkURL" select="normalize-space(substring-before($string2,'&quot;&gt;'))"/>
                    <xsl:element name="dcterms:relation">
                        <xsl:value-of select="$linkValue"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="$linkURL"/>
                    </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="normalize-space(.) != ''">
                        <xsl:element name="dcterms:relation">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>      
    </xsl:template>
    
    <xsl:template name="rights">
        <xsl:variable name="rights" select="replace(replace(replace(normalize-space(.),'&amp;amp;','&amp;'),'&lt;p&gt;',''),'&lt;/p&gt;','')"/>
        <xsl:choose>
            <xsl:when test="contains(.,'&lt;a href=&quot;https://philaathenaeum.org')">
                <xsl:variable name="string1" select="normalize-space(substring-before(.,'&lt;a href=&quot;'))"/>
                <xsl:variable name="string2" select="normalize-space(substring-after(.,'&lt;a href=&quot;'))"/>
                <xsl:variable name="string3" select="normalize-space(substring-after($string2,'&quot;&gt;'))"/>
                <xsl:variable name="string4" select="normalize-space(substring-before($string3,'&lt;/a&gt;'))"/>
                <xsl:element name="dcterms:rights">
                    <xsl:value-of select="$string1"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="$string4"/>
                </xsl:element>
            </xsl:when>
            <xsl:when
                test="starts-with($rights, 'http://rightsstatements.org/vocab/') or starts-with($rights, 'http://creativecommons.org/') or starts-with($rights, 'https://creativecommons.org/')">
                <xsl:if test="normalize-space($rights)!=''">
                    <xsl:element name="edm:rights">
                        <xsl:value-of select="normalize-space($rights)"/>
                    </xsl:element>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="normalize-space(.) != ''">
                    <xsl:element name="dcterms:rights">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>

    
