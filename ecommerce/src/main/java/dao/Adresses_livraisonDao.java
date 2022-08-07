package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Adresses_livraisonM;
import model.UtilisateursM;

public class Adresses_livraisonDao implements IDao<Adresses_livraisonM> {
	
	// Connection to Database
	
		Connection connect = DatabaseConnection.getConnection();
		
	// Create

	@Override
	public boolean create(Adresses_livraisonM adresse) {
		try {
			PreparedStatement req = connect.prepareStatement("INSERT INTO adresses_livraison (id_utilisateur, adresse, code_postal, ville, pays)"
					+ "VALUES (?,?,?,?,?)");
			
			req.setInt(1, adresse.getUtilisateur().getId_utilisateur());
			req.setString(2, adresse.getAdresse());
			req.setInt(3, adresse.getCode_postal());
			req.setString(4, adresse.getVille());
			req.setString(5, adresse.getPays());
			
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
	public ArrayList<Adresses_livraisonM> read() {
		ArrayList<Adresses_livraisonM> listeAdresses = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM adresses_livraison");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				Adresses_livraisonM adresseM = new Adresses_livraisonM(
						rs.getInt("id_adresse_livraison"),
						new UtilisateursM(rs.getInt("id_utilisateur")),
						rs.getString("adresse"),
						rs.getInt("code_postal"),
						rs.getString("ville"),
						rs.getString("pays")
						);
				listeAdresses.add(adresseM);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeAdresses;
	}

	// Update
	
	@Override
	public boolean update(Adresses_livraisonM adresse, int id) {
		try {
			PreparedStatement req = connect.prepareStatement("UPDATE adresses_livraison SET id_utilisateur=?, "
					+ "adresse=?,code_postal=?,ville=?,pays=? WHERE id_adresse_livraison=?");
			
			req.setInt(1, adresse.getUtilisateur().getId_utilisateur());
			req.setString(2, adresse.getAdresse());
			req.setInt(3, adresse.getCode_postal());
			req.setString(4, adresse.getVille());
			req.setString(5, adresse.getPays());
			
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
			PreparedStatement req = connect.prepareStatement("DELETE FROM adresses_livraison WHERE "
					+ "id_adresse_livraison = ?");
			
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
	public Adresses_livraisonM findById(int id) {
		Adresses_livraisonM adresse = null;
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM adresses_livraison"
					+ " WHERE id_adresse_livraison = ? ");
			
			req.setInt(1, id);
			
			ResultSet rs = req.executeQuery();
			
			if(rs.next()) {
				adresse = new Adresses_livraisonM(
						rs.getInt("id_adresse_livraison"),
						new UtilisateursM(rs.getInt("id_utilisateur")),
						rs.getString("adresse"),
						rs.getInt("code_postal"),
						rs.getString("ville"),
						rs.getString("pays")
						);	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return adresse;
	}
	
	public boolean verifAddress(int id) {
		Adresses_livraisonM adresse = null;
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM adresses_livraison"
					+ " WHERE id_utilisateur = ? ");
			
			req.setInt(1, id);
			
			ResultSet rs = req.executeQuery();
			
			if(rs.next()) {
				adresse = new Adresses_livraisonM(
						rs.getInt("id_adresse_livraison"),
						new UtilisateursM(rs.getInt("id_utilisateur")),
						rs.getString("adresse"),
						rs.getInt("code_postal"),
						rs.getString("ville"),
						rs.getString("pays")
						);
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public ArrayList<Adresses_livraisonM> addressUser(int idUser) {
		ArrayList<Adresses_livraisonM> listeAdressesUser = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM adresses_livraison WHERE id_utilisateur = ?");
			req.setInt(1, idUser);
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				Adresses_livraisonM adresseM = new Adresses_livraisonM(
						rs.getInt("id_adresse_livraison"),
						new UtilisateursM(rs.getInt("id_utilisateur")),
						rs.getString("adresse"),
						rs.getInt("code_postal"),
						rs.getString("ville"),
						rs.getString("pays")
						);
				listeAdressesUser.add(adresseM);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeAdressesUser;
	}
	
	
	
	public Adresses_livraisonM findMainAddress(int id) {
		Adresses_livraisonM adresse = null;
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM adresses_livraison"
					+ " WHERE id_utilisateur = ?   ");
			
			req.setInt(1, id);
			
			ResultSet rs = req.executeQuery();
			
			if(rs.next()) {
				adresse = new Adresses_livraisonM(
						rs.getInt("id_adresse_livraison"),
						new UtilisateursM(rs.getInt("id_utilisateur")),
						rs.getString("adresse"),
						rs.getInt("code_postal"),
						rs.getString("ville"),
						rs.getString("pays")
					
						);	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return adresse;
	}
}
