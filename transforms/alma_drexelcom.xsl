<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dcterms="http://purl.org/dc/terms/"
	xmlns:mods="http://www.loc.gov/mods/v3" exclude-result-prefixes="mods"
	xmlns:padig="http://padigital.org/ns"
	xmlns:edm="http://www.europeana.eu/schemas/edm/"
	xmlns:oai_dc='http://www.openarchives.org/OAI/2.0/oai_dc/'
	version="2.0">
	<xsl:output omit-xml-declaration="no" method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:strip-space elements="*"/>

	<!-- PA Digital-ized version of LC's crosswalk: https://www.loc.gov/standards/mods/v3/MODS3-8_DC_XSLT2-0.xsl -->
	<xsl:include href="remediations/lookup.xsl"/>
	
	<xsl:template match="record | metadata">
		<xsl:apply-templates/>
	</xsl:template>
	
	<!-- skip elements that don't match-->
	<xsl:template match="*"/>
	
	<!-- make the record -->
	<xsl:template match="//record/metadata/mods:mods">
		<oai_dc:dc>
			<xsl:apply-templates/>
			<edm:provider>PA Digital</edm:provider>
		</oai_dc:dc>
	</xsl:template>
	
	<!-- put stuff in the record -->
	<!-- aggregation fields: isShownAt, preview, isPartOf, iiif manifest, identifier, dataProvider -->
	<xsl:template match="mods:location">
		
		<!-- grab mmsID and digital collection name from elsewhere -->
		<xsl:variable name="mmsID"    select="tokenize(ancestor::record/header/identifier, ':')[last()]"/>
		<xsl:variable name="isPartOf" select="../mods:relatedItem[@type='host' and @displayLabel!='']//mods:titleInfo/mods:title"/>
		
		<xsl:for-each select="mods:url[not(@access) and starts-with(., 'http')]">
			<xsl:variable name="baseURL"  select="substring-before(., 'discovery/')"/>
			<xsl:variable name="recordID"  select="tokenize(., '/')[last()]"/>
			
			<!-- Primo URL (replaces incoming Alma URL) -->
			<edm:isShownAt>
				<xsl:value-of select="concat('https://drexel.primo.exlibrisgroup.com/permalink/01DRXU_INST/ajqfok/alma', $mmsID)"/>
			</edm:isShownAt>
			
			<!-- thumbnail -->
			<edm:preview>
				<xsl:value-of select="concat('https://drexel.primo.exlibrisgroup.com/view/delivery/thumbnail/01DRXU_INST/', $mmsID)"/>
			</edm:preview>
			
			<!-- digital collection name -->
			<xsl:if test="normalize-space($isPartOf) != ''">
				<dcterms:isPartOf>
					<xsl:value-of select="$isPartOf"/>
				</dcterms:isPartOf>
			</xsl:if>
			
			<!-- IIIF manifest -->
			<dcterms:isReferencedBy>
				<xsl:value-of select="concat('https://drexel.alma.exlibrisgroup.com/view/iiif/presentation/01DRXU_INST/', $recordID, '/manifest')"/>
			</dcterms:isReferencedBy>
			
			<!-- PA Digital identifier -->
			<dcterms:identifier>
				<xsl:value-of select="concat('padig:', $oaiUrl/padig:url[. = $baseURL]/@code, '-', $mmsID)"/>
			</dcterms:identifier>
			
			<!-- contributing institution -->
			<edm:dataProvider>
				<xsl:value-of select="$oaiUrl/padig:url[. = $baseURL]/@string"/>
			</edm:dataProvider>
		</xsl:for-each>
	</xsl:template>
	
	<!-- mapped fields -->
	<xsl:template match="mods:titleInfo">
		<dcterms:title>
			<xsl:call-template name="titleString"/>
		</dcterms:title>
	</xsl:template>
	
	<xsl:template match="mods:name">
		<xsl:choose>
			<xsl:when test="mods:role/mods:roleTerm[@type='code']='cre' or
				mods:role/mods:roleTerm[@type='code']='aut' or
				lower-case(mods:role/mods:roleTerm[@type='text'])='creator' or
				lower-case(mods:role/mods:roleTerm[@type='text'])='author'">
				<dcterms:creator>
					<xsl:call-template name="name"/>
				</dcterms:creator>
			</xsl:when>
			<xsl:otherwise>
				<dcterms:contributor>
					<xsl:call-template name="name"/>
				</dcterms:contributor>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="mods:subject">
		<xsl:if test="mods:topic | mods:occupation | mods:name">
			<dcterms:subject>
				<xsl:for-each select="mods:topic | mods:occupation">
					<xsl:value-of select="."/>
					<xsl:if test="position() != last()">--</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="mods:name">
					<xsl:call-template name="name"/>
				</xsl:for-each>
			</dcterms:subject>
		</xsl:if>
		<xsl:for-each select="mods:genre">
			<dcterms:format>
				<xsl:value-of select="."/>
			</dcterms:format>
		</xsl:for-each>
		<xsl:for-each select="mods:titleInfo">
			<dcterms:subject>
				<xsl:call-template name="titleString"/>
			</dcterms:subject>
		</xsl:for-each>
		<xsl:for-each select="mods:geographic">
			<dcterms:spatial>
				<xsl:value-of select="."/>
			</dcterms:spatial>
		</xsl:for-each>
		<xsl:for-each select="mods:cartographics/*">
			<dcterms:spatial>
				<xsl:value-of select="."/>
			</dcterms:spatial>
		</xsl:for-each>
		<xsl:if test="mods:temporal">
			<dcterms:subject>
				<xsl:for-each select="mods:temporal">
					<xsl:value-of select="."/>
					<xsl:if test="position() != last()">-</xsl:if>
				</xsl:for-each>
			</dcterms:subject>
		</xsl:if>
	</xsl:template>

	<xsl:template match="mods:abstract">
		<dcterms:description>
			<xsl:value-of select="."/>
		</dcterms:description>
	</xsl:template>

	<xsl:template match="mods:originInfo">
		<!-- if dates with start and end exist in dates  -->
		<xsl:apply-templates select="*[@point='start']"/>
		<xsl:apply-templates select="*[not(@point)]"/>
		<xsl:for-each select="mods:publisher">
			<dcterms:publisher>
				<xsl:value-of select="."/>
			</dcterms:publisher>
		</xsl:for-each>
		<xsl:for-each select="mods:agent">
			<dcterms:publisher>
				<xsl:value-of select="."/>
			</dcterms:publisher>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="mods:dateCreated">
		<xsl:if test="normalize-space(.) != ''">
			<dcterms:date>
				<xsl:choose>
					<xsl:when test="@point='start'">
						<xsl:variable name="dateName" select="local-name(.)"/>
						<xsl:variable name="endDate" select="../*[local-name()=$dateName][@point='end']"/>
						<xsl:value-of select="."/>
						<xsl:if test="normalize-space($endDate) != ''">
							<xsl:text>-</xsl:text>
							<xsl:value-of select="$endDate"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="."/>
					</xsl:otherwise>
				</xsl:choose>
			</dcterms:date>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="mods:genre">
		<dcterms:format>
			<xsl:value-of select="."/>
		</dcterms:format>
	</xsl:template>

	<!-- DCMI type matching -->
	<xsl:template match="mods:typeOfResource">
		<xsl:if test="@collection='yes'">
			<dcterms:type>Collection</dcterms:type>
		</xsl:if>
		<xsl:if test=".='software' and ../mods:genre='database'">
			<dcterms:type>Dataset</dcterms:type>
		</xsl:if>
		<xsl:if test=".='software' and ../mods:genre='online system or service'">
			<dcterms:type>Service</dcterms:type>
		</xsl:if>
		<xsl:if test=".='software'">
			<dcterms:type>Software</dcterms:type>
		</xsl:if>
		<xsl:if test=".='cartographic material'">
			<dcterms:type>Image</dcterms:type>
		</xsl:if>
		<xsl:if test=".='multimedia'">
			<dcterms:type>InteractiveResource</dcterms:type>
		</xsl:if>
		<xsl:if test=".='moving image'">
			<dcterms:type>MovingImage</dcterms:type>
		</xsl:if>
		<xsl:if test=".='three dimensional object'">
			<dcterms:type>PhysicalObject</dcterms:type>
		</xsl:if>
		<xsl:if test="starts-with(.,'sound recording')">
			<dcterms:type>Sound</dcterms:type>
		</xsl:if>
		<xsl:if test=".='still image'">
			<dcterms:type>StillImage</dcterms:type>
		</xsl:if>
		<xsl:if test=".='text'">
			<dcterms:type>Text</dcterms:type>
		</xsl:if>
		<xsl:if test=".='notated music'">
			<dcterms:type>Text</dcterms:type>
		</xsl:if>
	</xsl:template>

	<xsl:template match="mods:physicalDescription">
		<xsl:for-each select="mods:extent">
			<dcterms:extent>
				<xsl:value-of select="."/>
			</dcterms:extent>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="mods:language">
		<dcterms:language>
			<xsl:value-of select="mods:languageTerm[@type='text']"/>
		</dcterms:language>
	</xsl:template>

	<!-- map related collection only to relation -->
	<xsl:template match="mods:relatedItem[@type='host' and not(normalize-space(@displayLabel))]">
		<dcterms:relation>
			<xsl:value-of select="mods:titleInfo/mods:title"/>
		</dcterms:relation>
	</xsl:template>

	<xsl:template match="mods:accessCondition">
		<dcterms:rights>
			<xsl:value-of select="."/>
		</dcterms:rights>
	</xsl:template>

	<!-- named templates -->
	
	<!-- build name strings -->
	<xsl:template name="name">
		<xsl:variable name="name">
			<xsl:for-each select="mods:namePart[not(@type)]">
				<xsl:value-of select="."/>
				<xsl:text> </xsl:text>
			</xsl:for-each>
			<xsl:value-of select="mods:namePart[@type='family']"/>
			<xsl:if test="mods:namePart[@type='given']">
				<xsl:text>, </xsl:text>
				<xsl:value-of select="mods:namePart[@type='given']"/>
			</xsl:if>
			<xsl:if test="mods:namePart[@type='date']">
				<xsl:text>, </xsl:text>
				<xsl:value-of select="mods:namePart[@type='date']"/>
			</xsl:if>
			<xsl:if test="mods:displayForm">
				<xsl:text> (</xsl:text>
				<xsl:value-of select="mods:displayForm"/>
				<xsl:text>) </xsl:text>
			</xsl:if>
		</xsl:variable>
		<xsl:value-of select="normalize-space($name)"/>
	</xsl:template>
	
	<!-- build title strings -->
	<xsl:template name="titleString">
		<xsl:value-of select="mods:nonSort"/>
		<xsl:if test="mods:nonSort">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:value-of select="mods:title"/>
		<xsl:if test="mods:subTitle">
			<xsl:text>: </xsl:text>
			<xsl:value-of select="mods:subTitle"/>
		</xsl:if>
		<xsl:if test="mods:partNumber">
			<xsl:text>. </xsl:text>
			<xsl:value-of select="mods:partNumber"/>
		</xsl:if>
		<xsl:if test="mods:partName">
			<xsl:text>. </xsl:text>
			<xsl:value-of select="mods:partName"/>
		</xsl:if>
	</xsl:template>	
</xsl:stylesheet>
