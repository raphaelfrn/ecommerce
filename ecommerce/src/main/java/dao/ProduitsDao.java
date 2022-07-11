package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.ProduitsM;
import model.Sous_categoriesM;

public class ProduitsDao implements IDao<ProduitsM>{
	
	// Connection to Database
	
		Connection connect = DatabaseConnection.getConnection();
		
	// Create

	@Override
	public boolean create(ProduitsM produit) {
		try {
			PreparedStatement req = connect.prepareStatement("INSERT INTO produits (titre, description, prix, image, id_sous_categorie, stock, stock_minimum)"
					+ "VALUES (?,?,?,?,?,?,?)");
			
			req.setString(1, produit.getTitre());
			req.setString(2, produit.getDescription());
			req.setFloat(3, produit.getPrix());
			req.setString(4, produit.getImage());
			req.setInt(5, produit.getId_sous_categorie().getId_sous_categorie());
			req.setInt(6, produit.getStock());
			req.setInt(7, produit.getStock_minimum());
			
			
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
	public ArrayList<ProduitsM> read() {
ArrayList<ProduitsM> listeProduit = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM produits");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				ProduitsM produit = new ProduitsM(
						rs.getInt("id_produit"),
						rs.getString("titre"),
						rs.getString("description"),
						rs.getFloat("prix"),
						rs.getString("image"),
						new Sous_categoriesM(rs.getInt("id_sous_categorie")),
						rs.getInt("stock"),
						rs.getInt("stock_minimum")
								
						);
				listeProduit.add(produit);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeProduit;
	}

	// Update
	
	@Override
	public boolean update(ProduitsM produit, int id) {
		try {
			PreparedStatement req = connect.prepareStatement("UPDATE produits SET titre=?, "
					+ "description=?, prix=?, image=?, id_sous_categorie=?, stock=?, stock_minimum=? WHERE id_produit=?");
			
			req.setString(1, produit.getTitre());
			req.setString(2, produit.getDescription());
			req.setFloat(3, produit.getPrix());
			req.setString(4, produit.getImage());
			req.setInt(5, produit.getId_sous_categorie().getId_sous_categorie());
			req.setInt(6, produit.getStock());
			req.setInt(7, produit.getStock_minimum());
			req.setInt(8, id);
			
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
			PreparedStatement req = connect.prepareStatement("DELETE FROM produits WHERE "
					+ "id_produit = ?");
			
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
