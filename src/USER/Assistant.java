/***
 * An instances of this class represent an Assistant in the system
 */
package User;
import java.util.Date;

import GradeUtilities.Course;


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
    public void insertGrade(String student_id,String course_id,float Grade){
        
    }
    
    /***
	 * @param (student_id,course_id,Grade)
	 * @return none , modify the grade of a student
	 */
    public void modifyGrade(String student_id,String course_id,float Grade){

    }
    
    
    /***
	 * @param (student_id)
	 * @return A student's record
	 */
    private Record getStudentRecord(String student_id){
        return null;
        //to be added later
    }

    /***
	 * @param (record)
	 * @return none , print a student record
	 */
    public void printStudentRecord(Record record){

    }

    /***
	 * @param (course_id)
	 * @return Course summary
	 */
    private Course getCourseSummary(String course_id){
        return null;

    } 

    /***
	 * @param (Course)
	 * @return none, print to the console Course Summary
	 */
    public void printCourseSummary(Course course){

    }

    
}
