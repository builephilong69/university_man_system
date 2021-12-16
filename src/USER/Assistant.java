/***
 * An instances of this class represent an Assistant in the system
 */
package User;
import java.util.ArrayList;

import GradeUtilities.*;
import GradeUtilities.Record;
import sqlDBConnection.UserDBUtilities;


public class Assistant extends User {
    // data attributes

    // contructors
    public Assistant(String username) {
        super(username);

    }
    // methods
    /***
	 * @param none
	 * @return none; print to the console
	 */
    @Override
    public void getPersonalInfo() {
        System.out.println("Program Assistant: "+this.info.getFullName());
        this.info.getPersonalInfo();
        
    }
    /***
	 * @param (student_id,course_id,Grade)
	 * @return none , insert the grade of a student
	 */
    public void insertGrade(String course_id,String student_id,float Grade){
        UserDBUtilities dbconnector = new UserDBUtilities();
        dbconnector.connect();
        dbconnector.insertGrade(course_id, student_id,Grade);
        dbconnector.disconnect();
    }
    
    /***
	 * @param (student_id,course_id,Grade)
	 * @return none , modify the grade of a student
	 */
    public void modifyGrade(String student_id,String course_id,float Grade){
        UserDBUtilities connector = new UserDBUtilities();
        connector.connect();
        connector.modifyGrade(student_id, course_id, Grade);
        connector.disconnect();
    }
    
    
    /***
	 * @param (student_id)
	 * @return A student's record
	 */
    private Record getStudentRecord(String student_id){
        Student student =  new Student(student_id);
        return student.getRecord();
    }

    /***
	 * @param (record)
	 * @return none , print a student record
	 */
    public void printStudentRecord(String student_id){
        Record record = this.getStudentRecord(student_id);
        record.printRecord();
    }

    /***
	 * @param (course_id)
	 * @return Course summary
	 */
    private Course getCourse(String course_id){
        //added later
         Course course = new Course(course_id);
         return course;
    } 

    /***
	 * @param (Course)
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


    /***
	 * @param String course_id
	 * @return List of Student IDs
	 */
	public ArrayList<String> getStudentsList(String course_id){
        Course course = this.getCourse(course_id);
        ArrayList<String> result = course.getStudentsList();
        return result;
    }
    /***
	 * @param none
	 * @return none, print to the console list of students
	 */
    public void printStudentsList(String course_id)
    {
        ArrayList<String> studentsList = this.getStudentsList(course_id);
        System.out.println("Students' list for the Course  "+ course_id);
        for(String i : studentsList)
        {
            System.out.println(i);
        }
    }

    

    
}
