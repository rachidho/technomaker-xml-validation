<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" indent="yes" />

	<xsl:template match="/">
		<auteurs>

			<xsl:for-each
				select="//message[not(auteur = preceding-sibling::message/auteur)]">
				<auteur>
					<xsl:variable name="nomCourant">
						<xsl:value-of select="auteur" />
					</xsl:variable>
					<nom>
						<xsl:value-of select="$nomCourant" />
					</nom>
					<xsl:for-each select="//message[auteur=$nomCourant]">
						<message>
							<xsl:value-of select="contenu" />
						</message>
					</xsl:for-each>
				</auteur>
			</xsl:for-each>
		</auteurs>
	</xsl:template>

</xsl:stylesheet>