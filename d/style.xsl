<?xml version="1.0" encoding="UTF-8"?>

<!-- New document created with EditiX at Sun Nov 22 13:10:00 UTC 2015 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:curlip="http://github.com/Curlip/XMLWebCatalog">
	<xsl:output method="html"/>

	<xsl:function name="curlip:navalue">
		<xsl:param name="path"></xsl:param>
		<xsl:choose>
			<xsl:when test="$path">
				<xsl:value-of select="$path"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>N/A</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	
	<xsl:template match="/item">
	<html>
		<head>
			<link rel="stylesheet" type="text/css" href="style.css"   />

			<script src="../jquery-1.11.3.min.js"></script>
			<script src="skin.js"></script>
		</head>
		<body > 
			<div id="header" ><h1 ><xsl:value-of select="@ref"/>: <xsl:value-of select="name" /></h1></div>
			
			<table id="info">
				<tr ref="{@ref}" name="{name}"> 
					<td>
						<h3 class="desc head">Description</h3>
						<p class="desc item"><xsl:value-of select="data/desc"/></p>
					</td>
					<td>
						<h4 class="model head">Type</h4>
						<p class="model item"><xsl:value-of select="curlip:navalue(data/model)"/> - <xsl:value-of select="curlip:navalue(data/brand)"/></p>
					</td>
					<td>
						<h4 class="loc head">Location</h4>
						<p class="loc item"><xsl:value-of select="curlip:navalue(data/loc)"/></p>
						<h4 class="quant head">Quantity</h4>
						<p class="quant item"><xsl:value-of select="curlip:navalue(data/quant)"/></p>
						<h4 class="web head">Website</h4>
						<p class="web item"><xsl:value-of select="curlip:navalue(data/web)"/></p>
						<h4 class="price head">Price</h4>
						<p class="price item"><xsl:value-of select="curlip:navalue(data/price)"/></p>
					</td>
				</tr>
			</table>
		</body>
	</html>
	</xsl:template>
</xsl:stylesheet>


