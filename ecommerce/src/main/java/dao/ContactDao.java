package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.ContactM;
import model.UtilisateursM;

public class ContactDao implements IDao<ContactM> {
	
	// Connection to Database
	
		Connection connect = DatabaseConnection.getConnection();
		
	// Create

	@Override
	public boolean create(ContactM contact) {
		try {
			PreparedStatement req = connect.prepareStatement("INSERT INTO contact (id_utilisateur, sujet, message, etat)"
					+ "VALUES (?,?,?,?)");
			
			req.setInt(1, contact.getId_utilisateur().getId_utilisateur());
			req.setString(2, contact.getSujet());
			req.setString(3, contact.getMessage());
			req.setInt(4, contact.getEtat());
			
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
	public ArrayList<ContactM> read() {
		ArrayList<ContactM> listeContact = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM contact");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				ContactM contact = new ContactM(
						rs.getInt("id_contact"),
						new UtilisateursM(rs.getInt("id_utilisateur")),
						rs.getString("sujet"),
						rs.getString("message"),
						rs.getInt("etat")					
						);
				listeContact.add(contact);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeContact;
	}
	
	// Update

	@Override
	public boolean update(ContactM contact, int id) {
		try {
			PreparedStatement req = connect.prepareStatement("UPDATE contact SET id_utilisateur=?, "
					+ "sujet=?,message=?,etat=? WHERE id_contact=?");
			
			req.setInt(1, contact.getId_utilisateur().getId_utilisateur());
			req.setString(2, contact.getSujet());
			req.setString(3, contact.getMessage());
			req.setInt(4, contact.getEtat());
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
			PreparedStatement req = connect.prepareStatement("DELETE FROM contact WHERE "
					+ "id_contact = ?");
			
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
	public ContactM findById(int id) {
		ContactM contact = null;
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM contact"
					+ " WHERE id_contact = ? ");
			
			req.setInt(1, id);
			
			ResultSet rs = req.executeQuery();
			
			if(rs.next()) {
				contact = new ContactM(
						rs.getInt("id_contact"),
						new UtilisateursM(rs.getInt("id_utilisateur")),
						rs.getString("sujet"),
						rs.getString("message"),
						rs.getInt("etat")					
						);		
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return contact;
	}
	
	// 3 Dernires demandes de contact
	public ArrayList<ContactM> lastContact() {
		ArrayList<ContactM> listeContact = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM contact inner join utilisateurs on contact.id_utilisateur = utilisateurs.id_utilisateur ORDER by id_contact DESC LIMIT 3");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				ContactM contact = new ContactM(
						rs.getInt("id_contact"),
						new UtilisateursM(rs.getInt("id_utilisateur"), rs.getString("nom"), rs.getString("prenom")),
						rs.getString("sujet"),
						rs.getString("message"),
						rs.getInt("etat")					
						);
				listeContact.add(contact);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeContact;
	}
	
	public ArrayList<ContactM> notReadContact() {
		ArrayList<ContactM> listeContact = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM contact WHERE etat = 1");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				ContactM contact = new ContactM(
						rs.getInt("id_contact"),
						new UtilisateursM(rs.getInt("id_utilisateur")),
						rs.getString("sujet"),
						rs.getString("message"),
						rs.getInt("etat")					
						);
				listeContact.add(contact);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeContact;
	}
	
	
	public ArrayList<ContactM> readByUserId(int id) {
		ArrayList<ContactM> listeContact = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM contact WHERE id_utilisateur=?");
			req.setInt(1, id);
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				ContactM contact = new ContactM(
						rs.getInt("id_contact"),
						new UtilisateursM(rs.getInt("id_utilisateur")),
						rs.getString("sujet"),
						rs.getString("message"),
						rs.getInt("etat")					
						);
				listeContact.add(contact);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeContact;
	}

}
