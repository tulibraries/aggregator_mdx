<?xml version="1.0" encoding="UTF-8"?>
<!--Funcake name: 'Remove duplicate fields'
    Use: Run after 'DPLAH to Funnel Cake crosswalk' transform-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" xmlns:dcterms="http://purl.org/dc/terms/">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="@*|node()">
        <xsl:if test="not(node()) or not(deep-equal(., preceding-sibling::node()[1]))">
            <xsl:copy>
                <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
