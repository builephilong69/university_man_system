/***
 * connect to mySQL database using DriverManager
 */
package sqlDBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

abstract class DBConnector {
	// DB constants, USERNAME and PASSWORD are pre-given by the DB system administrator
    protected static final String DATABASE_URL = "jdbc:mysql://localhost:3306/grade_system";
    protected static final String USERNAME = "javaconnector";
    protected static final String PASSWORD = "javaconnector";
    
    protected Connection connector;
    
    /***
     * Open one connection to mySQL Database
     * @param none
     * @return none
     */
    public void connect() {
    	try {
    		connector = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
	        System.out.println("Connected to Grade System database.");
    	} catch (SQLException e) {
    		System.out.println("Failed to open the connection.");
    		 e.printStackTrace();
    	}
    }
    /***
     * Close the connection to mySQL Database
     * @param none
     * @return none
     */
    public void disconnect() {
    	try {
    		connector.close();
    		System.out.println("Disconnect from the Grade System database.");
    	} catch (SQLException e) {
    		if (connector == null) {
    			System.out.println("Connection has not yet opened.");
    		}
    		else {
    			System.out.println("Failed to close the connection.");
    		}
    		e.printStackTrace();
    	}
    }
}
