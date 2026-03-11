<?xml version='1.0' encoding='utf-8'?>
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
    <xsl:strip-space elements="*"/>
        
    <xsl:include href="oai_base_crosswalk.xsl"/>


    <!-- contributor -->
    <xsl:template match="dc:contributor" priority="1">
        <xsl:call-template name="contributor">
            <xsl:with-param name="strings" select="normalize-space(.)"/>
            <xsl:with-param name="delimiter" select="';'"/>
        </xsl:call-template>
    </xsl:template>
    
    <!-- identifier -->
    <xsl:template match="oai:header/oai:identifier">
        <xsl:call-template name="identifier"/>
    </xsl:template>
    
    <!-- collection name -->    
    <xsl:template match="oai:header/oai:setSpec">
        <xsl:call-template name="isPartOf"/>
    </xsl:template>
    
    <!-- unmap format -->
    <xsl:template match="dc:format" priority="1">
        <xsl:value-of select="null"/>
    </xsl:template>
    
    
    <!-- templates -->

    <!-- contributor -->
    <xsl:template name="contributor">
        <xsl:param name="strings"/>
        <xsl:param name="delimiter"/>
        
        <xsl:choose>
            <xsl:when test="contains($strings, $delimiter)">
                <xsl:variable name="newstem" select="normalize-space(substring-after($strings, $delimiter))"/>
                <xsl:variable name="firststem" select="normalize-space(substring-before($strings, $delimiter))"/>
                
                <xsl:choose>
                    <xsl:when test="normalize-space($firststem)!='' and ends-with($firststem, ' (Provider)')">
                        
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="normalize-space($firststem)!=''">
                            <xsl:element name="dcterms:contributor">
                                <xsl:value-of select="normalize-space($firststem)"/>
                            </xsl:element>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                
                <xsl:call-template name="contributor">
                    <xsl:with-param name="strings" select="$newstem"/>
                    <xsl:with-param name="delimiter" select="';'"/>
                </xsl:call-template>
                
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="normalize-space($strings)!='' and ends-with($strings, ' (Provider)')">
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="normalize-space($strings)!=''">
                            <xsl:element name="dcterms:contributor">
                                <xsl:value-of select="normalize-space($strings)"/>
                            </xsl:element>
                        </xsl:if>            
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- isPartOf -->
    <xsl:template name="isPartOf">
        <xsl:if test="normalize-space(lower-case(.))">
            <xsl:variable name="setID" select="normalize-space(lower-case(.))"/>
            <xsl:if test="$setID = $psaSetSpecList/padig:set">
                <xsl:element name="dcterms:isPartOf">
                    <xsl:value-of select="$psaSetSpecList/padig:set[. = $setID]/@string"/>
                </xsl:element>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
    <!-- identifier, dataProvider, isShownAt -->
    <xsl:template name="identifier">
        <xsl:variable name="oaiID" select="substring-after(.,'oai:')"/>
        <xsl:if test="normalize-space(.) != ''">
            <xsl:element name="dcterms:identifier">
                <xsl:value-of>padig:PSA-</xsl:value-of><xsl:value-of select="$oaiID"/>
            </xsl:element>
            <xsl:element name="edm:dataProvider">Pennsylvania State Archives</xsl:element>
            <xsl:element name="edm:isShownAt">
                <xsl:value-of>https://oa-psa.libnova.com/view/</xsl:value-of><xsl:value-of select="$oaiID"/></xsl:element>
            <xsl:element name="dcterms:isReferencedBy">
                <xsl:value-of>https://oa-psa.libnova.com/iiif/manifest/</xsl:value-of><xsl:value-of select="$oaiID"/>
            </xsl:element>
        </xsl:if>
        
    </xsl:template>
</xsl:stylesheet>
