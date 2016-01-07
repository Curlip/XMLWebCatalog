<?xml version="1.0" encoding="UTF-8"?>

<!-- New document created with EditiX at Sun Nov 22 13:10:00 UTC 2015 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>
	
	<xsl:template match="/">
	<html>
		<head>
			<link rel="stylesheet" type="text/css" href="skin.css"   />

			<script src="jquery-1.11.3.min.js"></script>
			<script src="skin.js"></script>
		</head>
		<body>
			<h1>Item List</h1>
			
			<table class="list">
				<tr style="padding: 5px;" >
					<th colspan="4" class="heading name">Name</th>
					<th colspan="4" class="heading desc">Description</th>
					<th class="heading brand">Brand</th>
					<th class="heading quant">Quantity</th>
					<th class="heading loc">Location</th>
					<th colspan="1" class="heading id">ID</th>
					<th colspan="1" class="heading link"></th>
				</tr>
				<xsl:for-each select="catalog/item">
					<tr> 
						<td class="item name" colspan="4"  ><xsl:value-of select="name" /></td>
						<td class="item desc" colspan="4"  ><xsl:copy-of select="concat(substring(data/desc, 1, 30), '...')"/></td>
						<td class="item brand"><xsl:value-of select="data/brand" /></td>
						<td class="item quant"><xsl:value-of select="data/quant" /></td>
						<td class="item loc"><xsl:value-of select="data/loc" /></td>
						<td class="item id" colspan="1"  ><xsl:value-of select="@ref" /></td>
						<td class="item link" colspan="1" style="text-align: right;" ><a href="d/{@ref}.xml" >&#x21B7;</a></td>
					</tr>
				</xsl:for-each>
			</table>
		</body>
	</html>
	</xsl:template>
</xsl:stylesheet>


