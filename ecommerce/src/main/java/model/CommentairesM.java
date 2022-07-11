package model;

public class CommentairesM {

	private int id_commentaire;
	private String commentaire;
	private int note;
	private ProduitsM id_produit;
	private UtilisateursM id_utilisateur;
	
	// Constructors
	
	public CommentairesM() {
	}

	public CommentairesM(int id_commentaire, String commentaire, int note, ProduitsM id_produit,
			UtilisateursM id_utilisateur) {
		this.id_commentaire = id_commentaire;
		this.commentaire = commentaire;
		this.note = note;
		this.id_produit = id_produit;
		this.id_utilisateur = id_utilisateur;
	}
	
	// Getters and Setters

	public int getId_commentaire() {
		return id_commentaire;
	}


	public void setId_commentaire(int id_commentaire) {
		this.id_commentaire = id_commentaire;
	}


	public String getCommentaire() {
		return commentaire;
	}


	public void setCommentaire(String commentaire) {
		this.commentaire = commentaire;
	}


	public int getNote() {
		return note;
	}


	public void setNote(int note) {
		this.note = note;
	}


	public ProduitsM getId_produit() {
		return id_produit;
	}


	public void setId_produit(ProduitsM id_produit) {
		this.id_produit = id_produit;
	}


	public UtilisateursM getId_utilisateur() {
		return id_utilisateur;
	}


	public void setId_utilisateur(UtilisateursM id_utilisateur) {
		this.id_utilisateur = id_utilisateur;
	}


	@Override
	public String toString() {
		return "CommentairesM [id_commentaire=" + id_commentaire + ", commentaire=" + commentaire + ", note=" + note
				+ ", id_produit=" + id_produit + ", id_utilisateur=" + id_utilisateur + "]";
	}
	
	
	
}
