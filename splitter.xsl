<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
>

	<xsl:output method="xml" indent="yes"/>
	
	<xsl:template match="/">
		<xsl:for-each select="catalog/item">
			<xsl:result-document  method="xml" href="d/{@ref}.xml">
				<xsl:text disable-output-escaping="yes">&#10;&lt;?xml-stylesheet type=&quot;text/xsl&quot; href=&quot;style.xsl&quot;?&gt;&#10;</xsl:text>
				<xsl:copy-of select="."/>
			</xsl:result-document>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>
