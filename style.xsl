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
					<th colspan="4"  >Name</th>
					<th colspan="4"  >Description</th>
					<th>Brand</th>
					<th>Quantity</th>
					<th>Location</th>
					<th colspan="1">ID</th>
					<th colspan="1"></th>
				</tr>
				<xsl:for-each select="catalog/item">
					<tr> 
						<td colspan="4"  ><xsl:value-of select="name" /></td>
						<td colspan="4"  ><xsl:copy-of select="concat(substring(data/desc, 1, 30), '...')"/></td>
						<td><xsl:value-of select="data/brand" /></td>
						<td><xsl:value-of select="data/quant" /></td>
						<td><xsl:value-of select="data/loc" /></td>
						<td colspan="1"  ><xsl:value-of select="@ref" /></td>
						<td colspan="1" style="text-align: right;" ><a href="d/{@ref}.xml" >&#x21B7;</a></td>
					</tr>
				</xsl:for-each>
			</table>
		</body>
	</html>
	</xsl:template>
</xsl:stylesheet>


