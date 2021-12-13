/***
 * Instance of this class provides functions relating to the database queries
 * for intended clients which are instances of classes in User
 */
package sqlDBConnection;

import java.util.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDBUtilities extends DBConnector{
	/***
	 * Get the general personal information given the username
	 * @param: username
	 * @return: Hashtable object whose keys are full_name, ssn, date_of_birth, place_of_birth and role
	 */
	public Hashtable<String, String> getPersonalInfo(String username){
		Hashtable<String, String> info = new Hashtable<String, String>();
		try {
			Statement statement = connector.createStatement();
    		ResultSet results = statement.executeQuery("SELECT * FROM authentication WHERE username='" + username + "'");
    		
    		results.next();
    		String full_name = results.getString("full_name");
    		// additional checking for ssn, date_of-birth, place_of_birth since in the DB they can be null
    		String ssn = "unknown";
    		if (results.getString("ssn") != null) {
    			ssn = results.getString("ssn");
    		}
    		String date_of_birth = "unknown";
    		if (results.getDate("date_of_birth") != null) {
    			date_of_birth = results.getDate("date_of_birth").toString();
    		}
    		String place_of_birth = "unknown";
    		if (results.getDate("date_of_birth") != null) {
    			place_of_birth = results.getString("place_of_birth");
    		}
    		String role = results.getString("uniRole");
    		
    		info.put("Full name", full_name);
    		info.put("SSN", ssn);
    		info.put("Date of birth", date_of_birth);
    		info.put("Place of birth", place_of_birth);
    		info.put("Role", role);
		} catch(SQLException e) {
			System.out.println("Fetching failed.");
    		e.printStackTrace();
		}
		return info;
	}
	/***
	 * Get the specific lecturer personal information given the username
	 * @param: username
	 * @return: Hashtable object whose keys are title, faculty
	 */
	public Hashtable<String, String> getLecturerInfo(String username){
		Hashtable<String, String> info = new Hashtable<String, String>();
		try {
			Statement statement = connector.createStatement();
    		ResultSet results = statement.executeQuery("SELECT * FROM lecturer WHERE username='" + username + "'");
    		
    		results.next();
    		String title = results.getString("title");
    		String faculty = results.getString("faculty");
    		
    		info.put("Title", title);
    		info.put("Faculty", faculty);
		} catch(SQLException e) {
			System.out.println("Fetching failed.");
    		e.printStackTrace();
		}
		return info;
	}
	/***
	 * Get the specific assistant personal information given the username
	 * @param: username
	 * @return: Hashtable objects whose keys are faculty, program(s)
	 */
    public ArrayList<Hashtable<String, String>> getAssistantInfo(String username){
    	ArrayList<Hashtable<String, String>> info = new ArrayList<Hashtable<String, String>>();
    	try {
    		Statement statement = connector.createStatement();
    	    ResultSet results = statement.executeQuery("SELECT * FROM program_assistant WHERE assistant_username='" + username + "'");
    	    
    	    while (results.next()) {
    	    	String program = results.getString("program");
    	    	String faculty = results.getString("faculty");
    	    	
    	    	Hashtable<String, String> entry = new Hashtable<String, String>();
    	    	entry.put("Program", program);
    	    	entry.put("Faculty", faculty);
    	    	info.add(entry);
    	    }
    	} catch(SQLException e) {
			System.out.println("Fetching failed.");
    		e.printStackTrace();
		}
		return info;
    }
	/***
	 * Get the specific student personal information given the username
	 * @param: username
	 * @return: Hashtable object whose keys are program, intake
	 */
    public Hashtable<String, String> getStudentInfo(String username){
    	Hashtable<String, String> info = new Hashtable<String, String>();
    	try {
    		Statement statement = connector.createStatement();
    	    ResultSet results = statement.executeQuery("SELECT * FROM student WHERE username='" + username + "'");
    	    
    	    results.next();
    	    String program = results.getString("program");
    	    String intake = results.getString("intake");
    	    info.put("Program", program);
    	    info.put("Intake", intake);
    	} catch(SQLException e) {
			System.out.println("Fetching failed.");
    		e.printStackTrace();
		}
		return info;
    }
	/***
	 * Intended client: assistant;
	 * Insert new entry in the grade table
	 * @param student_id, course_id, grade value
	 * @return 0 if successfully done, 1 if unsuccessfully done
	 */
    public int insertGrade(String student_id, String course_id, float grade) {
    	try {
    		Statement statement = connector.createStatement();
    	    statement.executeUpdate("INSERT INTO grade (course_id, student_username, grade) VALUES ('" + course_id + "', '" + student_id + "', " + grade + ")");
    	    System.out.println("Successfull insertion.");
    		return 0;
    	} catch (SQLException e) {
    		System.out.println("Unsuccessful insertion.");
    		e.printStackTrace();
    		return 0;
    	}
    }
    /***
	 * Intended client: assistant;
	 * Modify one grade entry in the grade table
	 * @param student_id, course_id, grade value
	 * @return 0 if successfully done, 1 if unsuccessfully done
	 */
    public int modifyGrade(String student_id, String course_id, float grade) {
    	try {
    		Statement statement = connector.createStatement();
    	    statement.executeUpdate("UPDATE grade SET grade=" + grade + " WHERE course_id='" + course_id + "' AND student_username='" + student_id + "'");
    	    System.out.println("Successful modification.");
    		return 0;
    	} catch (SQLException e) {
    		System.out.println("Unsuccessful modification.");
    		e.printStackTrace();
    		return 1;
    	}
    }
    /***
     * Login checking
     * @param username, pw
     * @return 0 if matched, 1 if mismatched
     */
    public int login(String username, String pw) {
    	try {
    		Statement statement = connector.createStatement();
    		ResultSet results = statement.executeQuery("SELECT pw FROM authentication WHERE username='" + username + "'");
    		
    		results.next();
    		String pwDB = results.getString("pw");
    		if (pwDB.equals(pw)) {
    			System.out.println("Successfully login.");
    			return 0;
    		} else {
    			System.out.println("Wrong password.");
    			return 1;
    		}
    	} catch (SQLException e) {
    		System.out.println("Username does not exist.");
    		e.printStackTrace();
    		return 1;
    	}
    }
}
