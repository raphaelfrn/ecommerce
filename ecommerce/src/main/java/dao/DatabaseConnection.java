package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	
	public static Connection getConnection() {
		String url = "jdbc:mysql://localhost/";
		String dbName = "ecommerce";
		String user="root";
		String pwd="";

		Connection connect = null;


		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

					try {
						connect = (Connection) DriverManager.getConnection(url+dbName,user,pwd);
						System.out.println("Connexion Ok");
		
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {e.printStackTrace();
		}
		return connect;

   }
}
