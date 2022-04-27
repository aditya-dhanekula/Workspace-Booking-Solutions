package bitshyd.dbmsproject.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Database {
	private static Connection con;
	public static Connection getConnection() throws SQLException
	{
		
		if (con == null || con.isClosed())
		{
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wsbs", "root", "root");
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		return con;
	}
	
	protected void finalize() throws Throwable
    {
        try {
        		if (con != null && !con.isClosed())
        			con.close();
        		con = null;
        }
        catch (Throwable e) {
  
            throw e;
        }
    }
}
