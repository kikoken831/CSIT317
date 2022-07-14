import java.sql.*;

class task3
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
        ResultSet rset1 = stmt1.executeQuery( "SELECT * FROM LINEITEM" );
	while ( rset1.next() ) 
        {
	    price = rset1.getDouble(6);
	    if (price == 2644.76) 
		counter++;
        }
	System.out.println( "2644.76" + " " + counter ); 

        counter = 0;
    	Statement stmt2 = conn.createStatement();
        ResultSet rset2 = stmt2.executeQuery( "SELECT * FROM LINEITEM" );
	while ( rset2.next() ) 
        {
	    price = rset2.getDouble(6);
	    if (price == 6118.28) 
		counter++;
        }
	System.out.println( "6118.28" + " " + counter ); 
        counter = 0;
	Statement stmt3 = conn.createStatement();
        ResultSet rset3 = stmt3.executeQuery( "SELECT * FROM LINEITEM" );
	while ( rset3.next() ) 
        {
	    price = rset3.getDouble(6);
	    if (price == 29461.4) 
		counter++;
        }
	System.out.println( "29461.4" + " " + counter ); 

        System.out.println( "Done." ); 
    }
   catch (SQLException e )
   {
     String errmsg = e.getMessage();
     System.out.println( errmsg );
   }
  }
}
