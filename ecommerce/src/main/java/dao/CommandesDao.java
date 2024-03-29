package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Adresses_livraisonM;
import model.CommandesM;
import model.UtilisateursM;

public class CommandesDao implements IDao<CommandesM> {

	// Connection to Database
	
		Connection connect = DatabaseConnection.getConnection();
		
	// Create

	
	@Override
	public boolean create(CommandesM commande) {
		try {
			PreparedStatement req = connect.prepareStatement("INSERT INTO commandes (id_utilisateur, dateC, total, id_adresse_livraison, etat)"
					+ "VALUES (?,now(),?,?,?)");
			
			req.setInt(1, commande.getId_utilisateur().getId_utilisateur());
			req.setFloat(2, commande.getTotal());
			req.setInt(3, commande.getId_adresse_livraison().getId_adresse_livraison());
			req.setInt(4, commande.getEtat());
			
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
	public ArrayList<CommandesM> read() {
		ArrayList<CommandesM> listeCommande = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM commandes");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				CommandesM commande = new CommandesM(
						rs.getInt("id_commande"),
						new UtilisateursM(rs.getInt("id_utilisateur")),
						rs.getDate("dateC"),
						rs.getFloat("total"),
						new Adresses_livraisonM(rs.getInt("id_adresse_livraison")),
						rs.getInt("etat")
						);
				listeCommande.add(commande);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCommande;
	}
	
	// Update

	@Override
	public boolean update(CommandesM commande, int id) {
		try {
			PreparedStatement req = connect.prepareStatement("UPDATE commandes SET id_utilisateur=?, "
					+ "dateC=?,total=?,id_adresse_livraison=?,etat=? WHERE id_commande=?");
			
			req.setInt(1, commande.getId_utilisateur().getId_utilisateur());
			req.setFloat(2, commande.getTotal());
			req.setInt(3, commande.getId_adresse_livraison().getId_adresse_livraison());
			req.setInt(4, commande.getEtat());
			
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
			PreparedStatement req = connect.prepareStatement("DELETE FROM commandes WHERE "
					+ "id_commande = ?");
			
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
	public CommandesM findById(int id) {
		CommandesM commande = null;
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM commandes"
					+ " WHERE id_commande = ? ");
			
			req.setInt(1, id);
			
			ResultSet rs = req.executeQuery();
			
			if(rs.next()) {
				commande = new CommandesM(
						rs.getInt("id_commande"),
						new UtilisateursM(rs.getInt("id_utilisateur")),
						rs.getDate("dateC"),
						rs.getFloat("total"),
						new Adresses_livraisonM(rs.getInt("id_adresse_livraison")),
						rs.getInt("etat")
						);
						
					
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return commande;
	}
	
	public ArrayList<CommandesM> readByUserId(int UserId) {
ArrayList<CommandesM> listeCommande = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM commandes WHERE id_utilisateur = ?");
			req.setInt(1, UserId);
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				CommandesM commande = new CommandesM(
						rs.getInt("id_commande"),
						new UtilisateursM(rs.getInt("id_utilisateur")),
						rs.getDate("dateC"),
						rs.getFloat("total"),
						new Adresses_livraisonM(rs.getInt("id_adresse_livraison")),
						rs.getInt("etat")
						);
				listeCommande.add(commande);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCommande;
	}

	
	public int createReturn(CommandesM commande) {
		int newid = 0;
		
		try {
			PreparedStatement req = connect.prepareStatement("INSERT INTO commandes (id_utilisateur, dateC, total, id_adresse_livraison, etat)"
					+ "VALUES (?,now(),?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
			
			req.setInt(1, commande.getId_utilisateur().getId_utilisateur());
			req.setFloat(2, commande.getTotal());
			req.setInt(3, commande.getId_adresse_livraison().getId_adresse_livraison());
			req.setInt(4, commande.getEtat());
			
			req.executeUpdate();

			ResultSet rs = req.getGeneratedKeys();
			
			rs.next();
			
		 newid = rs.getInt(1);
		 
		return newid;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return newid;
	}
	
	public ArrayList<CommandesM> readLastCommandByUserId(int UserId) {
		ArrayList<CommandesM> listeCommande = new ArrayList<>();
				
				try {
					PreparedStatement req = connect.prepareStatement("SELECT * FROM commandes  WHERE id_utilisateur=? ORDER BY id_commande DESC LIMIT 1");
					req.setInt(1, UserId);
					
					ResultSet rs = req.executeQuery();
					
					while (rs.next()) {
						CommandesM commande = new CommandesM(
								rs.getInt("id_commande"),
								new UtilisateursM(rs.getInt("id_utilisateur")),
								rs.getDate("dateC"),
								rs.getFloat("total"),
								new Adresses_livraisonM(rs.getInt("id_adresse_livraison")),
								rs.getInt("etat")
								);
						listeCommande.add(commande);
					}
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return listeCommande;
			}
	
	// CA annuel
	public ArrayList<Object> caByYear() {
		ArrayList<Object> listCaByYear = new ArrayList<>();
		float ca =0;
		try {
			PreparedStatement req = connect.prepareStatement("SELECT SUM(total) FROM commandes WHERE YEAR(dateC) = YEAR(CURRENT_DATE)");
		
			ResultSet rs = req.executeQuery();
					
			while (rs.next()) {
				ca =rs.getFloat(1);	
				listCaByYear.add(ca);		
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listCaByYear;
	}
	
	// CA monsuel 
	
	public ArrayList<Object> caByMonth() {
		ArrayList<Object> listCaByMonth = new ArrayList<>();
		float ca =0;
		try {
			PreparedStatement req = connect.prepareStatement("SELECT SUM(total) FROM commandes WHERE YEAR(dateC) = YEAR(CURRENT_DATE) and MONTH(dateC) = MONTH(CURRENT_DATE)");
		
			ResultSet rs = req.executeQuery();
					
			while (rs.next()) {
				ca =rs.getFloat(1);	
				listCaByMonth.add(ca);		
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listCaByMonth;
	}

	
}
