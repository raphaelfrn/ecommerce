package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.FavorisM;
import model.ProduitsM;
import model.UtilisateursM;

public class FavorisDao implements IDao<FavorisM> {
	
	// Connection to Database
	
		Connection connect = DatabaseConnection.getConnection();
		
	// Create

	@Override
	public boolean create(FavorisM favori) {
		try {
			PreparedStatement req = connect.prepareStatement("INSERT INTO favoris (id_produit, id_utilisateur)"
					+ "VALUES (?,?)");
			
			req.setInt(1, favori.getId_produit().getId_produit());
			req.setInt(2, favori.getId_utilisateur().getId_utilisateur());
	
			
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
	public ArrayList<FavorisM> read() {
ArrayList<FavorisM> listeFavori = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM favoris");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				FavorisM favori = new FavorisM(
						rs.getInt("id_favoris"),
						new ProduitsM(rs.getInt("id_produit")),
						new UtilisateursM(rs.getInt("id_utilisateur"))
						
								
						);
				listeFavori.add(favori);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeFavori;
	}
	
	// Update

	@Override
	public boolean update(FavorisM favori, int id) {
		try {
			PreparedStatement req = connect.prepareStatement("UPDATE favoris SET id_produit=?, "
					+ "id_utilisateur=? WHERE id_favoris=?");
			
			req.setInt(1, favori.getId_produit().getId_produit());
			req.setInt(2, favori.getId_utilisateur().getId_utilisateur());
			req.setInt(3, id);
			
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
			PreparedStatement req = connect.prepareStatement("DELETE FROM favoris WHERE "
					+ "id_favoris = ?");
			
			req.setInt(1,id);
			req.executeUpdate();
			
			System.out.println("deleted from favoris");
			return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			
		}
		
		return false;
	}
	
	
	// Find by Id

	@Override
	public FavorisM findById(int id) {
		FavorisM favori = null;
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM favoris"
					+ " WHERE id_favoris = ? ");
			
			req.setInt(1, id);
			
			ResultSet rs = req.executeQuery();
			
			if(rs.next()) {
				favori = new FavorisM(
						rs.getInt("id_favoris"),
						new ProduitsM(rs.getInt("id_produit")),
						new UtilisateursM(rs.getInt("id_utilisateur"))
						);		
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return favori;
	}
	
	public ArrayList<FavorisM> findFavByUser(int id) {
ArrayList<FavorisM> listeFavori = new ArrayList<>();
ProduitsDao pDao = new ProduitsDao();
UtilisateursDao uDao = new UtilisateursDao();

		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM favoris INNER JOIN produits ON produits.id_produit = favoris.id_produit INNER JOIN utilisateurs ON utilisateurs.id_utilisateur = favoris.id_utilisateur WHERE favoris.id_utilisateur=?");	

			req.setInt(1, id);
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				FavorisM favori = new FavorisM(
						rs.getInt("id_favoris"),
						pDao.findById(rs.getInt("id_produit")),
						uDao.findById(rs.getInt("id_utilisateur"))
						
								
						);
				listeFavori.add(favori);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeFavori;
	}

}
