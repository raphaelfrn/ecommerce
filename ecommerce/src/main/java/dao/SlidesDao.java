package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.SlidesM;

public class SlidesDao implements IDao<SlidesM> {
	
	// Connection to Database
	
		Connection connect = DatabaseConnection.getConnection();
		
	// Create	

	@Override
	public boolean create(SlidesM slide) {
		try {
			PreparedStatement req = connect.prepareStatement("INSERT INTO slides (titre, image, url)"
					+ "VALUES (?,?,?)");
			
			req.setString(1, slide.getTitre());
			req.setString(2, slide.getImage());
			req.setString(3, slide.getUrl());
			
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
	public ArrayList<SlidesM> read() {
ArrayList<SlidesM> listeSlide = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM slides");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				SlidesM slide = new SlidesM(
						rs.getInt("id_slides"),
						rs.getString("titre"),
						rs.getString("image"),
						rs.getString("url")
								
						);
				listeSlide.add(slide);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeSlide;
	}

	// Update
	
	@Override
	public boolean update(SlidesM slide, int id) {
		try {
			PreparedStatement req = connect.prepareStatement("UPDATE slides SET titre=?, "
					+ "image=?, url=? WHERE id_slides=?");
			
			req.setString(1, slide.getTitre());
			req.setString(2, slide.getImage());
			req.setString(3, slide.getUrl());
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
			PreparedStatement req = connect.prepareStatement("DELETE FROM slides WHERE "
					+ "id_slides = ?");
			
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
