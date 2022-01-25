/***
 * Instance of this class provides functions relating to the database queries
 * for intended clients which are instances of classes in GradeUtilities
 */
package sqlDBConnection;

import java.util.Hashtable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class GradeDBUtilities extends DBConnector{
	/***
     * Get the grade of one student in a course
     * @param course_id, student_id
     * @return grade value
     */
    public float getGrade(String course_id, String student_id) {
    	float grade_val = 0;
    	try {
    		Statement statement = connector.createStatement();
    		ResultSet results = statement.executeQuery("SELECT grade FROM grade WHERE course_id='" + course_id + "' AND student_username='" + student_id + "'");
    		
    		results.next();
    		grade_val = results.getFloat("grade");
    	} catch (SQLException e){
    		System.out.println("Fetching failed.");
    		e.printStackTrace();
    	}
    	return grade_val;
    }
    
    /***
     * Get the record of the student, given his/her student id 
     * @param student_id
     * @return Hashtable object containing course_id as keys and grade as value
     */
    public Hashtable<String, Float> getRecord(String student_id) {
    	Hashtable<String, Float> record = new Hashtable<String, Float>();
    	try {
    		Statement statement = connector.createStatement();
    		ResultSet results = statement.executeQuery("SELECT * FROM grade WHERE student_username='" + student_id + "'");
    		
    		while (results.next()) {
    			String course_id = results.getString("course_id");
    			float grade = results.getFloat("grade");
    			
    			record.put(course_id, grade);
    		}
    	} catch(SQLException e) {
    		System.out.println("Fetching failed.");
    		e.printStackTrace();
    	}
    	return record;
    }
    
    /***
     * Get course overall information
     * @param course_id
     * @return Hashtable object containing course name, program, lecturer name, semester as keys
     */
    public Hashtable<String, String> getCourseOverallInfo(String course_id){
    	Hashtable<String, String> courseInfo = new Hashtable<String, String>();
    	try {
    		Statement statement = connector.createStatement();
    		ResultSet results = statement.executeQuery("SELECT * FROM course_description WHERE course_id='" + course_id + "'");
    		
    		results.next();
    		String course_name = results.getString("course_name");
    		String program = results.getString("program");
    		String lecturer_username = results.getString("lecturer_username");
    		String semester = results.getString("semester");
    		// get lecturer name and title
    		ResultSet rs = statement.executeQuery("SELECT * FROM authentication A JOIN lecturer L On (A.username=L.username) WHERE A.username='" + lecturer_username + "'");
    		rs.next();
    		String lecturer_name = rs.getString("full_name");
    		String lecturer_title = rs.getString("title");
    		
    		courseInfo.put("Course name", course_name);
    		courseInfo.put("Program", program);
    		courseInfo.put("Semester", semester);
    		courseInfo.put("Instructor", lecturer_title + " "+ lecturer_name);
    	} catch (SQLException e){
    		System.out.println("Fetching failed.");
    		e.printStackTrace();
    	}
    	return courseInfo;
    }
    
    /***
     * Get list of students and his/her corresponding grades in the course
     * @param course_id
     * @return Hashtable object containing student id as keys and grade as value
     */
    public Hashtable<String, Float> getGradesList(String course_id) {
    	Hashtable<String, Float> gradesList = new Hashtable<String, Float>();
    	try {
    		Statement statement = connector.createStatement();
    		ResultSet results = statement.executeQuery("SELECT * FROM grade WHERE course_id='" + course_id + "'");
    		
    		while (results.next()) {
    			String id = results.getString("student_username");
    			float grade = results.getFloat("grade");
    			gradesList.put(id, grade);
    		};
    		
    	} catch (SQLException e){
    		System.out.println("Fetching failed.");
    		e.printStackTrace();
    	}
    	return gradesList;
    }
    
}
