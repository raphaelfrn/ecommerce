package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.AdministrateursM;

public class AdministrateursDao implements IDao<AdministrateursM> {

	
	// Connection to Database
	
	Connection connect = DatabaseConnection.getConnection();
	
	
	
	// Create
	
	
	@Override
	public boolean create(AdministrateursM administrateur) {
		try {
			PreparedStatement req = connect.prepareStatement("INSERT INTO administrateurs (nom, email, mot_de_passe, privileges)"
					+ "VALUES (?,?,?,?)");
			
			req.setString(1, administrateur.getNom());
			req.setString(2, administrateur.getEmail());
			req.setString(3, administrateur.getMot_de_passe());
			req.setString(4, administrateur.getPrivileges());
			
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
	public ArrayList<AdministrateursM> read() {
		ArrayList<AdministrateursM> listeAdministrateur = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM administrateurs");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				AdministrateursM adminM = new AdministrateursM(rs.getInt("id_administrateurs"),rs.getString("nom"),
						rs.getString("email"),rs.getString("mot_de_passe"),rs.getString("privileges"));
				listeAdministrateur.add(adminM);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeAdministrateur;
	}
	
	
	// Update

	@Override
	public boolean update(AdministrateursM administrateur, int id) {
		try {
			PreparedStatement req = connect.prepareStatement("UPDATE administrateurs SET nom=?, "
					+ "email=?,mot_de_passe=?,privileges=? WHERE id_administrateurs=?");
			
			req.setString(1, administrateur.getNom());
			req.setString(2, administrateur.getEmail());
			req.setString(3, administrateur.getMot_de_passe());
			req.setString(4, administrateur.getPrivileges());
			
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
			PreparedStatement req = connect.prepareStatement("DELETE FROM administrateurs WHERE "
					+ "id_administrateurs = ?");
			
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
