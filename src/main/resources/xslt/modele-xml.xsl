<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" indent="yes" />

	<xsl:template match="/">
		<!-- Continuez ici... -->
		<auteurs>
			<xsl:apply-templates select="messages/message" />
		</auteurs>
	</xsl:template>

	<xsl:template match="message">
		<auteur>
			<nom><xsl:value-of select="auteur"></xsl:value-of></nom>
			<message> <xsl:value-of select="contenu" /></message>
		</auteur>
	</xsl:template>

</xsl:stylesheet>