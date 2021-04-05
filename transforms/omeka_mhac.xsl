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
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
    xmlns:oclc="http://purl.org/oclc/terms/"
    xmlns:oai_qdc="http://worldcat.org/xmlschemas/qdc-1.0/"
    xmlns:schema="http://schema.org"
    xmlns:svcs="http://rdfs.org/sioc/services"
    version="2.0">
    <xsl:output omit-xml-declaration="no" method="xml" encoding="UTF-8" indent="yes"/>

    <xsl:include href="oai_base_crosswalk.xsl"/>


    <!-- take isPartOf from setSpec rather than dcterms:isPartOf -->
    <xsl:template match="oai:header/oai:setSpec">
        <xsl:call-template name="isPartOf"/>
    </xsl:template>
    
    <xsl:template match="dcterms:isPartOf" priority="1">
        <xsl:value-of select="null"/>
    </xsl:template>

    <!--Create dcterms: identifier, $baseURL, and $objID -->
    <xsl:template match="dc:identifier[last()]">
        <xsl:if test="normalize-space(.)!=''">
           <xsl:call-template name="dataProvider"/>
           <xsl:call-template name="identifier"/>
           <xsl:call-template name="isShownAt"/>
        </xsl:if>
    </xsl:template>
    
    <!-- rights text -->
    <xsl:template match="dc:rights" priority="1">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="rightsText"/>
        </xsl:if>
    </xsl:template>
    
    <!-- preview -->
    <xsl:template match="dcterms:hasFormat">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:call-template name="preview"/>
        </xsl:if>
    </xsl:template>
    
    
    <!-- templates -->
    
    <!-- isPartOf -->
    <xsl:template name="isPartOf">
        <xsl:variable name="setID" select="normalize-space(lower-case(.))"/>
        <xsl:if test="normalize-space(lower-case(.))">
            <xsl:if test="$setID = $mhacSetSpecList/padig:set">
                <xsl:element name="dcterms:isPartOf">
                    <xsl:value-of select="$mhacSetSpecList/padig:set[. = $setID]/@string"/>
                </xsl:element>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
    <!-- dataProvider -->
    <xsl:template name="dataProvider">
        <xsl:variable name="baseURL" select="normalize-space(substring-before(.,'items/'))"/>
        <xsl:if test="$baseURL = $oaiUrl/padig:url">
            <xsl:element name="edm:dataProvider">
                <xsl:value-of select="$oaiUrl/padig:url[. = $baseURL]/@string"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- identifier -->
    <xsl:template name="identifier">
        <xsl:variable name="objID" select="replace(substring-after(.,'https://www.mediahistoricarchives.org/items/show/'),'[^a-zA-Z0-9-:]','_')"/>
        <xsl:variable name="baseURL" select="normalize-space(substring-before(.,'items/'))"/>
        <xsl:element name="dcterms:identifier">
            <xsl:value-of>padig:</xsl:value-of><xsl:value-of select="$oaiUrl/padig:url[. = $baseURL]/@code"/><xsl:value-of>-</xsl:value-of><xsl:value-of select="replace($objID,'[^a-zA-Z0-9]','_')"/>
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
        <xsl:element name="edm:preview">
            <xsl:value-of select="normalize-space(.)"/>
        </xsl:element>
    </xsl:template>
    
    <!-- rights text -->
    <xsl:template name="rightsText">
        <xsl:variable name="rights" select='normalize-space(.)'/>
        
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
                <xsl:when test="starts-with($rights,'https://www.mediahistoricarchives.org/rightsandrepro')">
                    <xsl:element name="dcterms:rights">
                        <xsl:value-of select="'Permission to reproduce material from Media Historic Archives Commission (MHAC) collections must be granted in writing and is at the discretion of MHAC. All permission is granted on a per-use basis. Images may not be altered (aside from cropping) without special permission. The user of supplied reproductions assumes all responsibilities for citing sources properly, and using images in conformity with existing copyright laws, and may be required to supply MHAC with a copy of any publication or project in which the images appear. MHAC reserves the right to refuse to allow reproduction of any item in its collections. Reproductions of some items in the MHAC collection are available. Please contact us at mediahistoricarchives@gmail.com for prices and availability.'"/>
                    </xsl:element>
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
</xsl:stylesheet>
