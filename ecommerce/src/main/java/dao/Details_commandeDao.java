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

	public  ArrayList<Details_commandeM>  findByIdCommande(int id) {
	ArrayList<Details_commandeM> listeDetail = new ArrayList<>();
	CommandesDao cDao = new CommandesDao();
	ProduitsDao pDao = new ProduitsDao();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM details_commande WHERE id_commande = ?");
			req.setInt(1, id);
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				Details_commandeM detail = new Details_commandeM(
						rs.getInt("id_details_commande"),
						cDao.findById(rs.getInt("id_commande")),
						pDao.findById(rs.getInt("id_produit")),
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
	
	// Produit Phare
	public Details_commandeM productBestSeller() {
		Details_commandeM detail = null;
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT id_details_commande, id_commande, details_commande.id_produit, produits.titre, "
					+ "produits.image, quantite, MAX(quantite), produits.prix, details_commande.prix FROM `details_commande` INNER JOIN produits on produits.id_produit = details_commande.id_produit");
			
			ResultSet rs = req.executeQuery();
			
			if(rs.next()) {
				 detail = new Details_commandeM(
						rs.getInt("id_details_commande"),
						new CommandesM(rs.getInt("id_commande")),
						new ProduitsM(rs.getInt("id_produit"), rs.getString("titre"), rs.getFloat("prix"), rs.getString("image")),
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

	// Total by Categorie
	public ArrayList<Integer> totalCaByCat() {
		ArrayList<Integer> listTotalByCat = new ArrayList<>();
		int  totalCaByCat = 0;
		try {
			PreparedStatement req = connect.prepareStatement("SELECT AVG(commandes.total) FROM details_commande"
					+ " INNER JOIN produits on produits.id_produit = details_commande.id_produit INNER JOIN sous_categories "
					+ "on sous_categories.id_sous_categorie = produits.id_sous_categorie INNER JOIN categories "
					+ "on categories.id_categorie = sous_categories.id_categorie INNER JOIN commandes "
					+ "on commandes.id_commande = details_commande.id_commande Group BY categories.id_categorie");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				totalCaByCat =rs.getInt(1);	
				listTotalByCat.add(totalCaByCat);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listTotalByCat;
	}
	
}
