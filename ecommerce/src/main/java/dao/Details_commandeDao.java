package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.CommandesM;
import model.Details_commandeM;
import model.ProduitsM;

public class Details_commandeDao implements IDao<Details_commandeM> {
	
	// Connection to Database
	
		Connection connect = DatabaseConnection.getConnection();
		
	// Create

	@Override
	public boolean create(Details_commandeM detail) {
		try {
			PreparedStatement req = connect.prepareStatement("INSERT INTO details_commande (id_commande, id_produit, quantite, prix)"
					+ "VALUES (?,?,?,?)");
			
			req.setInt(1, detail.getId_commande().getId_commande());
			req.setInt(2, detail.getId_produit().getId_produit());
			req.setInt(3, detail.getQuantite());
			req.setFloat(4, detail.getPrix());
			
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
	public ArrayList<Details_commandeM> read() {
ArrayList<Details_commandeM> listeDetail = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM details_commande");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				Details_commandeM detail = new Details_commandeM(
						rs.getInt("id_details_commande"),
						new CommandesM(rs.getInt("id_commande")),
						new ProduitsM(rs.getInt("id_produit")),
						rs.getInt("quantite"),
						rs.getFloat("prix")			
						);
				listeDetail.add(detail);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeDetail;
	}
	
	// Update

	@Override
	public boolean update(Details_commandeM detail, int id) {
		try {
			PreparedStatement req = connect.prepareStatement("UPDATE details_commande SET id_commande=?, "
					+ "id_produit=?,quantite=?,prix=? WHERE id_details_commande=?");
			
			req.setInt(1, detail.getId_commande().getId_commande());
			req.setInt(2, detail.getId_produit().getId_produit());
			req.setInt(3, detail.getQuantite());
			req.setFloat(4, detail.getPrix());
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
			PreparedStatement req = connect.prepareStatement("DELETE FROM details_commande WHERE "
					+ "id_details_commande = ?");
			
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
	public Details_commandeM findById(int id) {
		Details_commandeM detail = null;
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM details_commande"
					+ " WHERE id_details_commande = ? ");
			
			req.setInt(1, id);
			
			ResultSet rs = req.executeQuery();
			
			if(rs.next()) {
				detail = new Details_commandeM(
						rs.getInt("id_details_commande"),
						new CommandesM(rs.getInt("id_commande")),
						new ProduitsM(rs.getInt("id_produit")),
						rs.getInt("quantite"),
						rs.getFloat("prix")		
						);		
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return detail;
	}

}
