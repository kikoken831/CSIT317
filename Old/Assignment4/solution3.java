import java.sql.*;

class solution3
{
  public static void main (String args [])
       throws SQLException, ClassNotFoundException
  {
    // Load the Oracle JDBC driver
    Class.forName ("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection
       ("jdbc:oracle:thin:@localhost:1521:db",  "tpchr", "oracle");
  try{
        System.out.println( "Connected to a database server" );
        System.out.println( );

	double price = 0.0;
        long counter = 0;

	Statement stmt1 = conn.createStatement();
        ResultSet rset1 = stmt1.executeQuery( "SELECT l_extendedprice, count(*) FROM LINEITEM where l_extendedprice in (2644.76, 6118.28, 29461.4) group by l_extendedprice" );
	while ( rset1.next() ) 
        {
		System.out.println(rset1.getDouble(1) + "  " + rset1.getInt(2));
	}

        System.out.println( "Done." ); 
    }
   catch (SQLException e )
   {
     String errmsg = e.getMessage();
     System.out.println( errmsg );
   }
  }
}
