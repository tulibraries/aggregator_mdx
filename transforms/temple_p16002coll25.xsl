<?xml version="1.0" encoding="UTF-8"?>
<!--Funcake name: 'Temple ContentDM p16002coll25 to Funnel Cake crosswalk'
    Use: Run as first transformation-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:dpla="http://dp.la/about/map/"
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
    <!-- For using this XSLT in Combine, you need to replace the following with an actionable HTTP link to the remediation XSLT, or load both XSLT into Combine then rename this to the filepath & name assigned to remediation.xslt within Combine. -->
    <xsl:include href="remediations/filter.xsl"/>

    <!-- drop nodes we don't care about, namely, header values -->
    <xsl:template match="text() | @*"/>

    <!-- drop records where the OAI header is marked as 'deleted' -->
    <xsl:template match="//oai:record[oai:header[@status='deleted']]/*"/>

    <!-- base record. Matches each OAI feed record that is mapped. Filters out records with dc:identifier values contained in remediation_filter.xsl -->
    <xsl:template match="//oai_qdc:qualifieddc[not(dc:identifier[string() = $filterids])]">
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
	        <xsl:for-each select="dc:creator">
	            <dcterms:creator><xsl:value-of select="."/></dcterms:creator>
	        </xsl:for-each>
	        <xsl:for-each select="dc:title[1]">
	            <dcterms:title><xsl:value-of select="."/></dcterms:title>
	        </xsl:for-each>
	        <xsl:for-each select="dc:title[position()>1]">
	            <dcterms:alternative><xsl:value-of select="."/></dcterms:alternative>
	        </xsl:for-each>
	        <xsl:for-each select="dcterms:isPartOf">
	            <dcterms:relation><xsl:value-of select="."/></dcterms:relation>
	        </xsl:for-each>
	        <xsl:for-each select="dc:source[position()>1]">
	            <dcterms:source><xsl:value-of select="."/></dcterms:source>
	        </xsl:for-each>
	        <xsl:for-each select="dc:publisher">
	            <dcterms:publisher><xsl:value-of select="."/></dcterms:publisher>
	        </xsl:for-each>
	        <xsl:for-each select="dc:date">
	            <dcterms:date><xsl:value-of select="."/></dcterms:date>
	        </xsl:for-each>
	        <xsl:for-each select="dc:subject">
	            <xsl:call-template name="subj_template">
	                <xsl:with-param name="string" select="." />
	                <xsl:with-param name="delimiter" select="';'" />
	            </xsl:call-template>
	        </xsl:for-each>
	        <xsl:for-each select="dc:language">
	            <dcterms:language><xsl:value-of select="."/></dcterms:language>
	        </xsl:for-each>
	        <xsl:for-each select="dc:type">
	            <xsl:call-template name="type_template">
	                <xsl:with-param name="string" select="." />
	                <xsl:with-param name="delimiter" select="';'" />
	            </xsl:call-template>
	        </xsl:for-each>
	        <xsl:for-each select="dc:format">
	            <dcterms:format><xsl:value-of select="."/></dcterms:format>
	        </xsl:for-each>
	        <xsl:for-each select="dc:rights">
	            <dcterms:rights><xsl:value-of select="."/></dcterms:rights>
	        </xsl:for-each>
	        <edm:dataProvider><xsl:text>Temple University</xsl:text></edm:dataProvider>
	    </oai_dc:dc>
    </xsl:template>

    <xsl:template name="subj_template">
        <xsl:param name="string" />
        <xsl:param name="delimiter" />

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($string, $delimiter)!=0">
                <xsl:variable name="newstem" select="substring-after($string, $delimiter)" />
                <dcterms:subject>
                    <xsl:value-of select="substring-before($string, $delimiter)" />
                </dcterms:subject>

                <!--Need to do recursion-->
                <xsl:call-template name="subj_template">
                    <xsl:with-param name="string" select="$newstem" />
                    <xsl:with-param name="delimiter" select="';'" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <dcterms:subject>
                    <xsl:value-of select="$string" />
                </dcterms:subject>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="type_template">
        <xsl:param name="string" />
        <xsl:param name="delimiter" />

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($string, $delimiter)!=0">
                <xsl:variable name="newstem" select="substring-after($string, $delimiter)" />
                <dcterms:type>
                    <xsl:value-of select="substring-before($string, $delimiter)" />
                </dcterms:type>

                <!--Need to do recursion-->
                <xsl:call-template name="type_template">
                    <xsl:with-param name="string" select="$newstem" />
                    <xsl:with-param name="delimiter" select="'; '" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <dcterms:type>
                    <xsl:value-of select="$string" />
                </dcterms:type>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="lang_template">
        <xsl:param name="string" />
        <xsl:param name="delimiter" />

        <xsl:choose>
            <!-- IF A PAREN, STOP AT AN OPENING semicolon -->
            <xsl:when test="contains($string, $delimiter)!=0">
                <xsl:variable name="newstem" select="substring-after($string, $delimiter)" />
                <dcterms:language>
                    <xsl:value-of select="substring-before($string, $delimiter)" />
                </dcterms:language>

                <!--Need to do recursion-->
                <xsl:call-template name="lang_template">
                    <xsl:with-param name="string" select="$newstem" />
                    <xsl:with-param name="delimiter" select="'; '" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <dcterms:language>
                    <xsl:value-of select="$string" />
                </dcterms:language>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
