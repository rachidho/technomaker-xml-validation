<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<html>
			<body>
				<!-- Continuez ici... -->
				
				<h4> information : </h4>
				<xsl:apply-templates select="messages/informationsMessages" />
				<xsl:apply-templates select="messages/message" />
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="informationsMessages">
	
		<table>
			<tr bgcolor='red'><td> nombreMessages </td><td> <xsl:value-of select="nombreMessages"></xsl:value-of> </td></tr>
			<tr bgcolor='red'><td> datePremierMessage </td><td> <xsl:value-of select="datePremierMessage"></xsl:value-of> </td></tr>
		</table>
	
	</xsl:template>
	
	<xsl:template match="message">
	
		<table style='margin:5px'>
			<tr><td  bgcolor='yellow'> Nom : </td><td><xsl:value-of select="auteur"></xsl:value-of></td></tr>
			<tr><td  bgcolor='yellow'> Date : </td><td><xsl:value-of select="date"></xsl:value-of></td></tr>
			<tr bgcolor='yellow'><td colspan='2'> Message : </td></tr>
			<tr><td colspan='2'><xsl:value-of select="contenu"></xsl:value-of></td></tr>
		</table>
		
	</xsl:template>

</xsl:stylesheet>