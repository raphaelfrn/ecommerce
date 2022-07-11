package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.FournisseursM;

public class FournisseursDao implements IDao<FournisseursM> {
	
	// Connection to Database
	
		Connection connect = DatabaseConnection.getConnection();
		
	
	// Create

	@Override
	public boolean create(FournisseursM fournisseur) {
		try {
			PreparedStatement req = connect.prepareStatement("INSERT INTO fournisseurs (nom)"
					+ "VALUES (?)");
			
			req.setString(1, fournisseur.getNom());
			
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
	public ArrayList<FournisseursM> read() {
ArrayList<FournisseursM> listeFournisseur = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM fournisseurs");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				FournisseursM fournisseur = new FournisseursM(
						rs.getInt("id_fournisseur"),
						rs.getString("nom")
								
						);
				listeFournisseur.add(fournisseur);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeFournisseur;
	}
	
	// Update

	@Override
	public boolean update(FournisseursM fournisseur, int id) {
		try {
			PreparedStatement req = connect.prepareStatement("UPDATE fournisseurs SET nom=?, "
					+ "id_utilisateur=? WHERE id_fournisseur=?");
			
			req.setString(1, fournisseur.getNom());
			req.setInt(2, id);
			
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
			PreparedStatement req = connect.prepareStatement("DELETE FROM fournisseurs WHERE "
					+ "id_fournisseur = ?");
			
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
