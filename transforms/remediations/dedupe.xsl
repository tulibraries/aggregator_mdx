<?xml version="1.0" encoding="UTF-8"?>
<!--Funcake name: 'Remove duplicate fields'
    Use: Run after any crosswalk transform-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="@*|node()">
        <xsl:if test="not(node()) or not(deep-equal(., preceding-sibling::node()[1]))">
            <xsl:copy>
                <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
