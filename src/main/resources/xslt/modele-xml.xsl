<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" indent="yes" />

	<xsl:template match="/">
		<auteurs>
			<!-- en elimine les doublon en utilisons l'exprission Xpath //message[not(auteur 
				= preceding-sibling::message/auteur)] 'en séléctionner les noeuds qui n'ont 
				pas de précédent' -->
			<xsl:for-each
				select="//message[not(auteur = preceding-sibling::message/auteur)]">
				<auteur>
					<!-- creation d'un variable pour l'affichage et pour faire de test -->
					<xsl:variable name="nomCourant">
						<xsl:value-of select="auteur" />
					</xsl:variable>
					<nom>
						<xsl:value-of select="$nomCourant" />
					</nom>
					<!-- boucle pour affiché les message d'un auteur -->
					<xsl:for-each select="//message[auteur=$nomCourant]">
						<message>
							<contenu><xsl:value-of select="contenu" /></contenu>
							<date><xsl:value-of select="date" /></date>
						</message>
					</xsl:for-each>
				</auteur>
			</xsl:for-each>
		</auteurs>
	</xsl:template>

</xsl:stylesheet>