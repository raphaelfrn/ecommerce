package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Entrees_en_stockM;
import model.FournisseursM;
import model.ProduitsM;

public class Entrees_en_stockDao implements IDao<Entrees_en_stockM>{
	
	// Connection to Database
	
		Connection connect = DatabaseConnection.getConnection();
		
	// Create

	@Override
	public boolean create(Entrees_en_stockM entree) {
		try {
			PreparedStatement req = connect.prepareStatement("INSERT INTO entrees_en_stock (id_fournisseur, id_produit, dateE)"
					+ "VALUES (?,?,now()");
			
			req.setInt(1, entree.getId_fournisseur().getId_fournisseur());
			req.setInt(2, entree.getId_produit().getId_produit());
			
			
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
	public ArrayList<Entrees_en_stockM> read() {
ArrayList<Entrees_en_stockM> listeEntree = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM entrees_en_stock");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				Entrees_en_stockM entree = new Entrees_en_stockM(
						rs.getInt("id_entrees_en_stock"),
						new FournisseursM(rs.getInt("id_fournisseur")),
						new ProduitsM(rs.getInt("id_produit")),
						rs.getDate("dateE")
								
						);
				listeEntree.add(entree);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeEntree;
	}
	
	// Update

	@Override
	public boolean update(Entrees_en_stockM entree, int id) {
		try {
			PreparedStatement req = connect.prepareStatement("UPDATE entrees_en_stock SET id_fournisseur=?, "
					+ "id_produit=?,dateE=? WHERE id_entrees_en_stock=?");
			
			req.setInt(1, entree.getId_fournisseur().getId_fournisseur());
			req.setInt(2, entree.getId_produit().getId_produit());
			req.setDate(3, entree.getDateE());
			req.setInt(4, id);
			
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
			PreparedStatement req = connect.prepareStatement("DELETE FROM entrees_en_stock WHERE "
					+ "id_entrees_en_stock = ?");
			
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
