package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.ProduitsM;
import model.UtilisateursM;
import model.VisitesM;

public class VisitesDao implements IDao<VisitesM> {
	
	// Connection to Database
	
		Connection connect = DatabaseConnection.getConnection();
		
	// Create

	@Override
	public boolean create(VisitesM visite) {
		try {
			PreparedStatement req = connect.prepareStatement("INSERT INTO visites (id_produit, id_utilisateur, dateV)"
					+ "VALUES (?,?,now())");
			
			req.setInt(1, visite.getId_produit().getId_produit());
			req.setInt(2, visite.getId_utilisateur().getId_utilisateur());
			
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
	public ArrayList<VisitesM> read() {
		ArrayList<VisitesM> listeVisite = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM visites");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				VisitesM visite = new VisitesM(
						rs.getInt("id_visite"),
						new ProduitsM(rs.getInt("id_produit")),
						new UtilisateursM(rs.getInt("id_utilisateur")),
						rs.getDate("dateV")
								
						);
				listeVisite.add(visite);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeVisite;
	}

	// Update
	
	@Override
	public boolean update(VisitesM visite, int id) {
		try {
			PreparedStatement req = connect.prepareStatement("UPDATE visites SET id_produit=?, "
					+ "id_utilisateur=?, dateV=? WHERE id_visite=?");
			
			req.setInt(1, visite.getId_produit().getId_produit());
			req.setInt(2, visite.getId_utilisateur().getId_utilisateur());
			req.setDate(3, visite.getDateV());
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
			PreparedStatement req = connect.prepareStatement("DELETE FROM visites WHERE "
					+ "id_visite = ?");
			
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
	public VisitesM findById(int id) {
		VisitesM visite = null;
		try {
			PreparedStatement req = connect.prepareStatement("SELECT * FROM visites"
					+ " WHERE id_visite = ? ");
			
			req.setInt(1, id);
			
			ResultSet rs = req.executeQuery();
			
			if(rs.next()) {
				 visite = new VisitesM(
							rs.getInt("id_visite"),
							new ProduitsM(rs.getInt("id_produit")),
							new UtilisateursM(rs.getInt("id_utilisateur")),
							rs.getDate("dateV")
										
						);
						
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return visite;
	}
	
	// visit By Product
	public ArrayList<VisitesM> visitByProd() {
		ArrayList<VisitesM> listeVisiteByProd = new ArrayList<>();
		
		try {
			PreparedStatement req = connect.prepareStatement("	SELECT COUNT(visites.id_produit), visites.id_produit, titre FROM `visites` "
					+ "INNER JOIN produits on produits.id_produit = visites.id_produit GROUP BY produits.titre");
			
			ResultSet rs = req.executeQuery();
			
			while (rs.next()) {
				VisitesM visite = new VisitesM(
						
						new ProduitsM(rs.getInt("id_produit"), rs.getString("titre"))
						);
				listeVisiteByProd.add(visite);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeVisiteByProd;
	}
	
	// Nbr visit By Product
		public ArrayList<Integer> nbrVisitByProd() {
			ArrayList<Integer> listeNbrVisiteByProd = new ArrayList<>();
			int  nbrV = 0;
			try {
				PreparedStatement req = connect.prepareStatement("	SELECT COUNT(visites.id_produit) FROM `visites` "
						+ "INNER JOIN produits on produits.id_produit = visites.id_produit GROUP BY produits.titre");
				
				ResultSet rs = req.executeQuery();
				
				while (rs.next()) {
					nbrV =rs.getInt(1);	
					listeNbrVisiteByProd.add(nbrV);
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return listeNbrVisiteByProd;
		}
		
		//Visit By Year
		public ArrayList<VisitesM> visitByYear() {
			ArrayList<VisitesM> listeVisite = new ArrayList<>();
			
			try {
				PreparedStatement req = connect.prepareStatement("SELECT * FROM `visites` WHERE YEAR(dateV) = YEAR(CURRENT_DATE)");
				
				ResultSet rs = req.executeQuery();
				
				while (rs.next()) {
					VisitesM visite = new VisitesM(
							rs.getInt("id_visite"),
							new ProduitsM(rs.getInt("id_produit")),
							new UtilisateursM(rs.getInt("id_utilisateur")),
							rs.getDate("dateV")
									
							);
					listeVisite.add(visite);
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return listeVisite;
		}
				
}
