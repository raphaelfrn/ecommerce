package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.CoordonneesM;

public class CoordonneesDao implements IDao<CoordonneesM> {
	
	// Connection to Database
	
		Connection connect = DatabaseConnection.getConnection();
		
	// Create

	@Override
	public boolean create(CoordonneesM coordonnees) {
		try {
			PreparedStatement req = connect.prepareStatement("INSERT INTO coordonnees (nom, adresse, telephone, email,logo)"
					+ "VALUES (?,?,?,?,?)");
			
			req.setString(1, coordonnees.getNom());
			req.setString(2, coordonnees.getAdresse());
			req.setString(3, coordonnees.getTelephone());
			req.setString(4, coordonnees.getEmail());
			req.setString(5, coordonnees.getLogo());
			
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
	public ArrayList<CoordonneesM> read() {
ArrayList<CoordonneesM> listeCoord = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM coordonnees");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				CoordonneesM coord = new CoordonneesM(
						rs.getInt("id_coordonnees"),
						rs.getString("nom"),
						rs.getString("adresse"),
						rs.getString("telephone"),
						rs.getString("email"),
						rs.getString("logo")
						);
				listeCoord.add(coord);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCoord;
	}
	
	// Update

	@Override
	public boolean update(CoordonneesM coordonnees, int id) {
		try {
			PreparedStatement req = connect.prepareStatement("UPDATE coordonnees SET nom=?, "
					+ "adresse=?,telephone=?,email=?, logo=? WHERE id_coordonnees=?");
			

			req.setString(1, coordonnees.getNom());
			req.setString(2, coordonnees.getAdresse());
			req.setString(3, coordonnees.getTelephone());
			req.setString(4, coordonnees.getEmail());
			req.setString(5, coordonnees.getLogo());
			req.setInt(6, id);
			
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
			PreparedStatement req = connect.prepareStatement("DELETE FROM coordonnees WHERE "
					+ "id_coordonnees = ?");
			
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
	public CoordonneesM findById(int id) {
		CoordonneesM coord = null;
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM coordonnees"
					+ " WHERE id_coordonnees = ? ");
			
			req.setInt(1, id);
			
			ResultSet rs = req.executeQuery();
			
			if(rs.next()) {
				 coord = new CoordonneesM(
						rs.getInt("id_coordonnees"),
						rs.getString("nom"),
						rs.getString("adresse"),
						rs.getString("telephone"),
						rs.getString("email"),
						rs.getString("logo")				
						);		
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return coord;
	}

}
