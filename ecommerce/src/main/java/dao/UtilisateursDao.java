package dao;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

import model.UtilisateursM;

public class UtilisateursDao implements IDao<UtilisateursM> {
	
	// Connection to Database
		Connection connect = DatabaseConnection.getConnection();
		
		
	// Cryptage mot de passe	
		public static String encode(String value) throws NoSuchAlgorithmException {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			byte[] hash = md.digest(value.getBytes(StandardCharsets.UTF_8)); String encoded = Base64.getEncoder().encodeToString(hash);
			return encoded;
		}
		
		
	// Create

	@Override
	public boolean create(UtilisateursM user) {
		try {
			PreparedStatement req = connect.prepareStatement("INSERT INTO utilisateurs (nom, prenom, email, telephone, mot_de_passe, date_inscription) VALUE (?, ?, ?, ?, ?, now())");
			req.setString(1, user.getNom());
			req.setString(2, user.getPrenom());
			req.setString(3, user.getEmail());
			req.setString(4, user.getTelephone());
			req.setString(5, encode(user.getMot_de_passe()));
			req.executeUpdate();
		
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return false;
	}
	// Read
	
	@Override
	public ArrayList<UtilisateursM> read() {
		ArrayList<UtilisateursM> listeUtilisateur = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM utilisateurs");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				UtilisateursM utilisateur = new UtilisateursM(
						rs.getInt("id_utilisateur"),
						rs.getString("nom"),
						rs.getString("prenom"),
						rs.getDate("date_inscription"),
						rs.getString("email"),
						rs.getString("mot_de_passe")
								
						);
				listeUtilisateur.add(utilisateur);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeUtilisateur;
	}

	// Update
	
	@Override
	public boolean update(UtilisateursM utilisateur, int id) {
		try {
			PreparedStatement req = connect.prepareStatement("UPDATE utilisateurs SET nom=?, "
					+ "prenom=?, date_inscription=?, email=?, mot_de_passe=? WHERE id_utilisateur=?");
			
			req.setString(1, utilisateur.getNom());
			req.setString(2, utilisateur.getPrenom());
			req.setDate(3, utilisateur.getDate_inscription());
			req.setString(4, utilisateur.getEmail());
			req.setString(5, utilisateur.getMot_de_passe());
			req.setInt(6, id);
			
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
			PreparedStatement req = connect.prepareStatement("DELETE FROM utilisateurs WHERE "
					+ "id_utilisateur = ?");
			
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
	public UtilisateursM findById(int id) {
		UtilisateursM utilisateur = null;
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM utilisateurs"
					+ " WHERE id_utilisateur = ? ");
			
			req.setInt(1, id);
			
			ResultSet rs = req.executeQuery();
			
			if(rs.next()) {
				utilisateur = new UtilisateursM(
						rs.getInt("id_utilisateur"),
						rs.getString("nom"),
						rs.getString("prenom"),
						rs.getDate("date_inscription"),
						rs.getString("email"),
						rs.getString("mot_de_passe")		
						);
						
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return utilisateur;
	}
	
	public UtilisateursM findByMail(String email) {
		UtilisateursM utilisateur = null;
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM utilisateurs"
					+ " WHERE email = ? ");
			
			req.setString(1, email);
			
			ResultSet rs = req.executeQuery();
			
			if(rs.next()) {
				utilisateur = new UtilisateursM(
						rs.getInt("id_utilisateur"),
						rs.getString("nom"),
						rs.getString("prenom"),
						rs.getDate("date_inscription"),
						rs.getString("email"),
						rs.getString("mot_de_passe")		
						);
						
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return utilisateur;
	}
	
	public boolean verifMail(String email) {
		UtilisateursM utilisateur = null;
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM utilisateurs"
					+ " WHERE email = ? ");
			
			req.setString(1, email);
			
			ResultSet rs = req.executeQuery();
			
			if(rs.next()) {
				utilisateur = new UtilisateursM(
						rs.getInt("id_utilisateur"),
						rs.getString("nom"),
						rs.getString("prenom"),
						rs.getDate("date_inscription"),
						rs.getString("email"),
						rs.getString("mot_de_passe")	
						);
				return true;	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
