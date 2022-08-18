package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.CommentairesM;
import model.ProduitsM;
import model.UtilisateursM;

public class CommentairesDao implements IDao<CommentairesM>{

	// Connection to Database
	
		Connection connect = DatabaseConnection.getConnection();
		
	// Create
	
	@Override
	public boolean create(CommentairesM commentaire) {
		try {
			PreparedStatement req = connect.prepareStatement("INSERT INTO commentaires (commentaire, note, id_produit, id_utilisateur)"
					+ "VALUES (?,?,?,?)");
			
			req.setString(1, commentaire.getCommentaire());
			req.setInt(2, commentaire.getNote());
			req.setInt(3, commentaire.getId_produit().getId_produit());
			req.setInt(4, commentaire.getId_utilisateur().getId_utilisateur());
			
			req.executeUpdate();
			
			return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	// Read

	@Override
	public ArrayList<CommentairesM> read() {
ArrayList<CommentairesM> listeCommentaire = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM commentaires");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				CommentairesM commentaire = new CommentairesM(
						rs.getInt("id_commentaire"),
						rs.getString("commentaire"),
						rs.getInt("note"),
						new ProduitsM(rs.getInt("id_produit")),
						new UtilisateursM(rs.getInt("id_utilisateur"))
						
						);
				listeCommentaire.add(commentaire);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCommentaire;
	}
	
	// Update

	@Override
	public boolean update(CommentairesM commentaire, int id) {
		try {
			PreparedStatement req = connect.prepareStatement("UPDATE commentaires SET commentaire=?, "
					+ "note=?,id_produit=?,id_utilisateur=? WHERE id_commentaire=?");
			
			req.setString(1, commentaire.getCommentaire());
			req.setInt(2, commentaire.getNote());
			req.setInt(3, commentaire.getId_produit().getId_produit());
			req.setInt(4, commentaire.getId_utilisateur().getId_utilisateur());
			req.setInt(5, id);
			
			req.executeUpdate();
			
			return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	// Delete

	@Override
	public boolean delete(int id) {
		try {
			PreparedStatement req = connect.prepareStatement("DELETE FROM commentaires WHERE "
					+ "id_commentaire = ?");
			
			req.setInt(1,id);
			
			req.executeUpdate();
			
			return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	// Find by Id

	@Override
	public CommentairesM findById(int id) {
		CommentairesM commentaire = null;
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM commentaires"
					+ " WHERE id_commentaire = ? ");
			
			req.setInt(1, id);
			
			ResultSet rs = req.executeQuery();
			
			if(rs.next()) {
				commentaire = new CommentairesM(
						rs.getInt("id_commentaire"),
						rs.getString("commentaire"),
						rs.getInt("note"),
						new ProduitsM(rs.getInt("id_produit")),
						new UtilisateursM(rs.getInt("id_utilisateur"))					
						);
	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return commentaire;
	}

	public ArrayList<CommentairesM> readById(int id) {
		ArrayList<CommentairesM> listeCommentaire = new ArrayList<>();
		ProduitsDao pDao = new ProduitsDao();
		UtilisateursDao uDao = new UtilisateursDao();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM commentaires WHERE id_produit = ?");
			req.setInt(1, id);
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				CommentairesM commentaire = new CommentairesM(
						rs.getInt("id_commentaire"),
						rs.getString("commentaire"),
						rs.getInt("note"),
						pDao.findById(rs.getInt("id_produit")),
						uDao.findById(rs.getInt("id_utilisateur"))
						
						);
				listeCommentaire.add(commentaire);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCommentaire;
	}
	
	public ArrayList<CommentairesM> readByUserId(int id) {
		ArrayList<CommentairesM> listeCommentaire = new ArrayList<>();
		ProduitsDao pDao = new ProduitsDao();
		UtilisateursDao uDao = new UtilisateursDao();
				
			try {
				PreparedStatement req = connect.prepareStatement("SELECT * FROM commentaires WHERE id_utilisateur = ?");
				req.setInt(1, id);
				ResultSet rs = req.executeQuery();
				
				while (rs.next()) {
					CommentairesM commentaire = new CommentairesM(
							rs.getInt("id_commentaire"),
							rs.getString("commentaire"),
							rs.getInt("note"),
							pDao.findById(rs.getInt("id_produit")),
							uDao.findById(rs.getInt("id_utilisateur"))
							
							);
					listeCommentaire.add(commentaire);
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return listeCommentaire;
	}

	
}
