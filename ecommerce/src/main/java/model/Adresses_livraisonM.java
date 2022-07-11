package model;

public class Adresses_livraisonM {

	private int id_adresse_livraison;
	private UtilisateursM id_utilisateur;
	private String adresse;
	private int code_postal;
	private String ville;
	private String pays;
	
	
	// Constructors
	
	public Adresses_livraisonM() {
	}
	
	public Adresses_livraisonM(int id_adresse_livraison) {
		this.id_adresse_livraison = id_adresse_livraison;
	}

	public Adresses_livraisonM(int id_adresse_livraison, UtilisateursM id_utilisateur, String adresse, int code_postal,
			String ville, String pays) {
		this.id_adresse_livraison = id_adresse_livraison;
		this.id_utilisateur = id_utilisateur;
		this.adresse = adresse;
		this.code_postal = code_postal;
		this.ville = ville;
		this.pays = pays;
	}
	
	// Getters and Setters

	public int getId_adresse_livraison() {
		return id_adresse_livraison;
	}

	public void setId_adresse_livraison(int id_adresse_livraison) {
		this.id_adresse_livraison = id_adresse_livraison;
	}

	public UtilisateursM getId_utilisateur() {
		return id_utilisateur;
	}

	public void setId_utilisateur(UtilisateursM id_utilisateur) {
		this.id_utilisateur = id_utilisateur;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public int getCode_postal() {
		return code_postal;
	}

	public void setCode_postal(int code_postal) {
		this.code_postal = code_postal;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public String getPays() {
		return pays;
	}

	public void setPays(String pays) {
		this.pays = pays;
	}

	@Override
	public String toString() {
		return "Adresses_livraisonM [id_adresse_livraison=" + id_adresse_livraison + ", id_utilisateur="
				+ id_utilisateur + ", adresse=" + adresse + ", code_postal=" + code_postal + ", ville=" + ville
				+ ", pays=" + pays + "]";
	}
	
}
