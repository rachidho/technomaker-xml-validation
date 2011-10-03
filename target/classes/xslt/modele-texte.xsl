<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="text" indent="yes" />

	<xsl:template match="/">
				<xsl:apply-templates select="messages/message" />
	</xsl:template>
	
	<xsl:template match="message">
		message :<xsl:value-of select="contenu" />; auteur :<xsl:value-of select="auteur" />; date :<xsl:value-of select="date" />
		<xsl:text />
	</xsl:template>
	

</xsl:stylesheet>