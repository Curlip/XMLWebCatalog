<?xml version="1.0" encoding="UTF-8"?>

<!-- New document created with EditiX at Sun Nov 22 13:10:00 UTC 2015 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>
	
	<xsl:template match="/item">
	<html>
		<head>
			<link rel="stylesheet" type="text/css" href="skin.css"   />
			
			<script src="jquery-1.11.3.min.js"></script>
			<script src="skin.js"></script>
		</head>
		<body > 
			<div id="header" ><h1 ><xsl:value-of select="@ref"/>: <xsl:value-of select="name" /></h1></div>
			
			<table id="info">
				<tr style="text-align: center;" > 
					<td>
						<h3>Description</h3>
						<xsl:value-of select="data/desc"/>
					</td>
					<td>
						<h3>Model</h3>
						<p><xsl:value-of select="data/brand" /> - <xsl:value-of select="data/model" /></p>
					</td>
					<td>
						<h4>Location</h4>
						<xsl:choose>
							<xsl:when test="data/loc">
								<xsl:value-of select="data/loc"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>N/A</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						<h4>Quantity</h4>
						<xsl:choose>
							<xsl:when test="data/quant">
								<xsl:value-of select="data/quant"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>N/A</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						<h4>Website</h4>
						<xsl:choose>
							<xsl:when test="data/web">
								<a href="{data/web}" ><xsl:value-of select="data/web"/></a>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>N/A</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						<h4>Price</h4>
						<xsl:choose>
							<xsl:when test="data/price">
								<xsl:value-of select="data/price"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>N/A</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</body>
	</html>
	</xsl:template>
</xsl:stylesheet>


