package model;

public class Adresses_livraisonM {

	private int id_adresse_livraison;
	private UtilisateursM utilisateur;
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

	public Adresses_livraisonM(int id_adresse_livraison, UtilisateursM utilisateur, String adresse, int code_postal,
			String ville, String pays) {
		this.id_adresse_livraison = id_adresse_livraison;
		this.utilisateur = utilisateur;
		this.adresse = adresse;
		this.code_postal = code_postal;
		this.ville = ville;
		this.pays = pays;
	}

	public int getId_adresse_livraison() {
		return id_adresse_livraison;
	}

	public void setId_adresse_livraison(int id_adresse_livraison) {
		this.id_adresse_livraison = id_adresse_livraison;
	}

	public UtilisateursM getUtilisateur() {
		return utilisateur;
	}

	public void setUtilisateur(UtilisateursM utilisateur) {
		this.utilisateur = utilisateur;
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
		return "id_adresse_livraison " + id_adresse_livraison + " " + utilisateur
				+ " " + adresse + " " + code_postal + " " + ville + " " + pays;
	}

	
	
}
