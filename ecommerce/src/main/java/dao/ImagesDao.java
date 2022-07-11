package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.ImagesM;
import model.ProduitsM;

public class ImagesDao implements IDao<ImagesM> {
	
	// Connection to Database
	
		Connection connect = DatabaseConnection.getConnection();
		
	// Create

	@Override
	public boolean create(ImagesM image) {
		try {
			PreparedStatement req = connect.prepareStatement("INSERT INTO images (id_produit,url)"
					+ "VALUES (?,?)");
			
			req.setInt(1, image.getId_produit().getId_produit());
			req.setString(2, image.getUrl());
			
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
	public ArrayList<ImagesM> read() {
ArrayList<ImagesM> listeImage = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM images");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				ImagesM image = new ImagesM(
						rs.getInt("id_image"),
						new ProduitsM(rs.getInt("id_produit")),
						rs.getString("url")
								
						);
				listeImage.add(image);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeImage;
	}
	
	// Update

	@Override
	public boolean update(ImagesM image, int id) {
		try {
			PreparedStatement req = connect.prepareStatement("UPDATE images SET id_produit=?, "
					+ "url=? WHERE id_image=?");
			
			req.setInt(1, image.getId_produit().getId_produit());
			req.setString(2, image.getUrl());
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
			PreparedStatement req = connect.prepareStatement("DELETE FROM images WHERE "
					+ "id_image = ?");
			
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
