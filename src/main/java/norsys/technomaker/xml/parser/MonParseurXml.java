package norsys.technomaker.xml.parser;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

/**
 * Classe de parcours du fichier XML pour construire l'affichage HTML.
 */
public final class MonParseurXml {

	/**
	 * Constructeur.
	 */
	private MonParseurXml() {
	}

	/**
	 * Cree le corps de la page HTML de la page a partir du fichier XML qui
	 * 
	 * @param document
	 *            fichier XML a parser.
	 * @return String contenant le code HTML de la page avec les donnees du
	 *         fichier XML.
	 */
	public static String creerCorpsPageHtml(Document document) {

		StringBuilder builder = new StringBuilder();
		builder.append("<html>");
		builder.append("<body>");

		builder.append("<h1>Parseur XML</h1>");

		// creation de parseur
		File xmlFile = new File("src/main/resources/xml/donnees-messages.xml");
		SAXBuilder builderSAX = new SAXBuilder();
		try {

			Document doc = builderSAX.build(xmlFile);
			// On initialise un nouvel élément racine avec l'élément racine du
			// document.
			Element racine = document.getRootElement();

			// On crée une List contenant tous les elements de racine "messages"
			List<Element> listElement = racine.getChildren();

			/**
			 * parcourire la liste des messages
			 */
			for (Element element : listElement) {
				// On crée une List contenant tous les noeuds de chaque element
				List<Element> listElementChildren = element.getChildren();
				builder.append(" <table border='0' style='margin: 5 px'>");
				// parcourir la liste des elements d'un message
				for (Element elementChildren : listElementChildren) {
					if ("auteur".equals(elementChildren.getName())) {
						builder.append("<tr bgcolor='yellow'> <td> Nom : </td><td>"
								+ elementChildren.getValue() + "</td></tr>");
					}
					if ("date".equals(elementChildren.getName())) {
						builder.append("<tr bgcolor='yellow'> <td> Date : </td><td>"
								+ elementChildren.getValue() + "</td></tr>");
					}
					if ("contenu".equals(elementChildren.getName())) {
						builder.append("<tr><td colspan = '4'> Messages : </td></tr><tr><td colspan = '4'>"
								+ elementChildren.getValue() + "</td></tr>");
					}
					if ("nombreMessages".equals(elementChildren.getName())) {
						builder.append("<tr bgcolor='red'> <td> Nombre messages : </td><td bgcolor='red'>"
								+ elementChildren.getValue() + "</td></tr>");
					}
					if ("datePremierMessage".equals(elementChildren.getName())) {
						builder.append("<tr bgcolor='red'><td> Date Premier Message : </td><td bgcolor='red'>"
								+ elementChildren.getValue() + "</td></tr>");
					}
				}
				builder.append(" </table>  ");
			}

		} catch (JDOMException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		builder.append("</body>");
		builder.append("</html>");

		return builder.toString();
	}
}
