package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.UtilisateursM;

public class UtilisateursDao implements IDao<UtilisateursM> {
	
	// Connection to Database
	
		Connection connect = DatabaseConnection.getConnection();
		
	// Create

	@Override
	public boolean create(UtilisateursM utilisateur) {
		try {
			PreparedStatement req = connect.prepareStatement("INSERT INTO utilisateurs (nom, prenom, date_inscription, email, mot_de_passe)"
					+ "VALUES (?,?,now(),?,?)");
			
			req.setString(1, utilisateur.getNom());
			req.setString(2, utilisateur.getPrenom());
			req.setString(3, utilisateur.getEmail());
			req.setString(4, utilisateur.getMot_de_passe());
			
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

}
