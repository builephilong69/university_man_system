/***
 * An instances of this class represent an Lecturer in the system
 */
package User;

import java.util.ArrayList;
import java.util.Hashtable;

import GradeUtilities.*;
import sqlDBConnection.UserDBUtilities;

public class Lecturer extends User {
    private Hashtable<String, String> lecturerInfo;
    // constructors
    public Lecturer(String username) {
        super(username);
        UserDBUtilities dbconnector = new UserDBUtilities();
        dbconnector.connect();
        lecturerInfo = dbconnector.getLecturerInfo(username);
        dbconnector.disconnect();
    }
    // methods
    /***
	 * @param none
	 * @return none; print to the console personal info
	 */
    @Override
    public void getPersonalInfo() {
    	System.out.println("Full name     : " + lecturerInfo.get("Title") + " " + info.getFullName());
    	System.out.println("Date of birth : " + info.getDateOfBirth().toString());
    	System.out.println("Place of birth: " + info.getPlaceOfBirth());
    	System.out.println("SSN           : " + info.getSSN());
    	System.out.println("Faculty       : " + lecturerInfo.get("Faculty"));
    }
    /**
     * 
     * @return Array list of course_id taught by the lecturer
     */
    private ArrayList<String> getOwnCourse()
    {
        ArrayList<String> result = new ArrayList<String>();
        UserDBUtilities connector = new UserDBUtilities();
        connector.connect();
        result = connector.getOwnCourse(this.username);
        connector.disconnect();
        return result;
    }
    /**
     * 
     * @param none
     * @return none, print to console the Courses' id that lecturer teach 
     */
    public void printOwnCourse()
    {
        ArrayList<String> courseList = this.getOwnCourse();
        System.out.println("All the courses taught by "+ lecturerInfo.get("Title") + " " + info.getFullName());
        for(String i : courseList)
        {
            System.out.println(i);
        }

    }
   
    /***
	 * @param course_id
	 * @return none, print to the console Course Summary
	 */
    public void printCourseSummary(String course_id){
    	Course course = new Course(course_id);
    	System.out.println(course.getCourseInfo());
    	System.out.println("Number of passing students: " + course.countNumPass());
    	System.out.println("Number of failed students: " + course.countNumFailed());
    	System.out.println("Highest grade: " + course.getMaxGrade());
    	System.out.println("Lowest grade: " + course.getMinGrade());
    	System.out.println("Class average: " + course.getAvr());
    }   

}
