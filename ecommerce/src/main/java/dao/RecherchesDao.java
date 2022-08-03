package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.RecherchesM;
import model.UtilisateursM;

public class RecherchesDao implements IDao<RecherchesM>{
	
	// Connection to Database
	
		Connection connect = DatabaseConnection.getConnection();
		
	// Create

	@Override
	public boolean create(RecherchesM recherche) {
		try {
			PreparedStatement req = connect.prepareStatement("INSERT INTO recherches (id_utilisateur, mot_cle, dateR)"
					+ "VALUES (?,?,now())");
			
			req.setInt(1, recherche.getId_utilisateur().getId_utilisateur());
			req.setString(2, recherche.getMot_cle());
	
			
			req.executeUpdate();
			System.out.println("créer");
			return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("pas créer");
		return false;
	}

	// Read
	
	@Override
	public ArrayList<RecherchesM> read() {
ArrayList<RecherchesM> listeRecherche = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM recherches");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				RecherchesM recherche = new RecherchesM(
						rs.getInt("id_recherche"),
						new UtilisateursM(rs.getInt("id_utilisateur")),
						rs.getString("mot_cle"),
						rs.getDate("datE")
								
						);
				listeRecherche.add(recherche);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeRecherche;
	}
	
	// Update

	@Override
	public boolean update(RecherchesM recherche, int id) {
		try {
			PreparedStatement req = connect.prepareStatement("UPDATE recherches SET id_utilisateur=?, "
					+ "mot_cle=?, dateR=? WHERE id_recherche=?");
			
			req.setInt(1, recherche.getId_utilisateur().getId_utilisateur());
			req.setString(2, recherche.getMot_cle());
			req.setDate(3, recherche.getDateR());
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
			PreparedStatement req = connect.prepareStatement("DELETE FROM recherches WHERE "
					+ "id_recherche = ?");
			
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
	public RecherchesM findById(int id) {
		RecherchesM recherche = null;
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM recherches"
					+ " WHERE id_recherche = ? ");
			
			req.setInt(1, id);
			
			ResultSet rs = req.executeQuery();
			
			if(rs.next()) {
				recherche = new RecherchesM(
						rs.getInt("id_recherche"),
						new UtilisateursM(rs.getInt("id_utilisateur")),
						rs.getString("mot_cle"),
						rs.getDate("datE")
						);
						
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return recherche;
	}

}
