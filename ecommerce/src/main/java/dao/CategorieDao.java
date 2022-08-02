package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.CategorieM;

public class CategorieDao implements IDao<CategorieM> {

	// Connection to Database
	
		Connection connect = DatabaseConnection.getConnection();
		
	// Create
	
	@Override
	public boolean create(CategorieM categorie) {
		try {
			PreparedStatement req = connect.prepareStatement("INSERT INTO categories (titre)"
					+ "VALUES (?)");
			
			req.setString(1, categorie.getTitre());
			
			
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
	public ArrayList<CategorieM> read() {
ArrayList<CategorieM> listeCategorie = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM categories");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				CategorieM categorie = new CategorieM(
						rs.getInt("id_categorie"),
						rs.getString("titre"),
						rs.getString("video")
						);
				listeCategorie.add(categorie);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCategorie;
	}
	
	// Update

	@Override
	public boolean update(CategorieM categorie, int id) {
		try {
			PreparedStatement req = connect.prepareStatement("UPDATE categories SET titre=? "
					+" WHERE id_categorie=?");
			
			
			req.setString(1, categorie.getTitre());
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
			PreparedStatement req = connect.prepareStatement("DELETE FROM categories WHERE "
					+ "id_categorie = ?");
			
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
	public CategorieM findById(int id) {
		CategorieM categorie = null;
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM categories"
					+ " WHERE id_categorie = ? ");
			
			req.setInt(1, id);
			
			ResultSet rs = req.executeQuery();
			
			if(rs.next()) {
				categorie = new CategorieM(
						rs.getInt("id_categorie"),
						rs.getString("titre"),
						rs.getString("video")
						);
						
					
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return categorie;
	}

}
