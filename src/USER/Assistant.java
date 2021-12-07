/***
 * An instances of this class represent an Assistant in the system
 */
package USER;
import java.util.Date;

public class Assistant extends User {
    // data attributes
    private String faculty_id;
    private String[] program_id;
    // contructors
    public Assistant(String faculty_id, String[] program_id,String name, String role, Date dateOfBirth, String placeOfBirth, String ssn) {
        this.faculty_id = faculty_id;
        this.program_id = program_id;
        this.info = new Personal_information(name, role, dateOfBirth, placeOfBirth, ssn)
    }
    // methods
    /***
	 * @param none
	 * @return none; print to the console
	 */
    @Override
    public void getPersonalInfo() {
        // TODO Auto-generated method stub
        
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

    } 

    /***
	 * @param (Course)
	 * @return none, print to the console Course Summary
	 */
    public void printCourseSummary(Course course){

    }

    
}
