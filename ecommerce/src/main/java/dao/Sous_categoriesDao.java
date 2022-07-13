package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.CategorieM;
import model.Sous_categoriesM;

public class Sous_categoriesDao implements IDao<Sous_categoriesM> {
	
	// Connection to Database
	
		Connection connect = DatabaseConnection.getConnection();
		
	// Create

	@Override
	public boolean create(Sous_categoriesM sousCat) {
		try {
			PreparedStatement req = connect.prepareStatement("INSERT INTO sous_categories (titre, id_categorie)"
					+ "VALUES (?,?)");
			
			req.setString(1, sousCat.getTitre());
			req.setInt(2, sousCat.getId_categorie().getId_categorie());

			
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
	public ArrayList<Sous_categoriesM> read() {
ArrayList<Sous_categoriesM> listeSousCat = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM sous_categories");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				Sous_categoriesM sousCat = new Sous_categoriesM(
						rs.getInt("id_sous_categorie"),
						rs.getString("titre"),
						new CategorieM(rs.getInt("id_categorie"))
						
								
						);
				listeSousCat.add(sousCat);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeSousCat;
	}

	// Update
	
	@Override
	public boolean update(Sous_categoriesM sousCat, int id) {
		try {
			PreparedStatement req = connect.prepareStatement("UPDATE sous_categories SET titre=?, "
					+ "id_categorie=? WHERE id_sous_categorie=?");
			
			req.setString(1, sousCat.getTitre());
			req.setInt(2, sousCat.getId_categorie().getId_categorie());
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
			PreparedStatement req = connect.prepareStatement("DELETE FROM sous_categories WHERE "
					+ "id_sous_categorie = ?");
			
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
	public Sous_categoriesM findById(int id) {
		Sous_categoriesM sousCat = null;
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM sous_categories"
					+ " WHERE id_sous_categorie = ? ");
			
			req.setInt(1, id);
			
			ResultSet rs = req.executeQuery();
			
			if(rs.next()) {
				sousCat = new Sous_categoriesM(
						rs.getInt("id_sous_categorie"),
						rs.getString("titre"),
						new CategorieM(rs.getInt("id_categorie"))
						
									
						);
						
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sousCat;
	}

}
