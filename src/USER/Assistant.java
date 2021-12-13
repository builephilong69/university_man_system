/***
 * An instances of this class represent an Assistant in the system
 */
package User;
import java.util.Date;

import GradeUtilities.Course;
import GradeUtilities.Record;
import sqlDBConnection.UserDBUtilities;
import java.util.*;

public class Assistant extends User{
    // data attributes
	ArrayList<Hashtable<String, String>> prog_falcuty;
    // constructors
    public Assistant(String username) {
        super(username);
        UserDBUtilities connector = new UserDBUtilities();
        prog_falcuty = connector.getAssistantInfo(username);
    }
    // methods
    /***
	 * @param none
	 * @return none; print to the console
	 */
    @Override
    public void getPersonalInfo() {
        System.out.println("Program Assistant: " + this.info.getFullName());
    }
    /***
	 * @param student_id, course_id, grade
	 * @return none , insert the grade of a student
	 */
    public void insertGrade(String student_id, String course_id, float grade){
        UserDBUtilities connector = new UserDBUtilities();
        connector.connect();
        connector.insertGrade(student_id, course_id, grade);
        connector.disconnect();
    }
    
    /***
	 * @param student_id, course_id, grade)
	 * @return none , modify the grade of a student
	 */
    public void modifyGrade(String student_id, String course_id, float grade){
    	UserDBUtilities connector = new UserDBUtilities();
        connector.connect();
        connector.modifyGrade(student_id, course_id, grade);
        connector.disconnect();
    }

    /***
	 * @param student_id
	 * @return none , print a student record
	 */
    public void printStudentRecord(String student_id){
    	Record stu_record = new Record(student_id);
    	stu_record.printRecord();
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
