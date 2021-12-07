package USER;
import java.util.Date;

public class Lecturer extends User {
    // data attributes
    private String faculty_id;
    
    
    // constructors
    public Lecturer(String faculty_id,String name, String role, Date dateOfBirth, String placeOfBirth, String ssn) {
        this.faculty_id = faculty_id;
        this.info = new Personal_information(name, role, dateOfBirth, placeOfBirth, ssn);
    }
    // methods
    /***
	 * @param none
	 * @return none; print to the console personal info
	 */
    @Override
    public void getPersonalInfo() {
        // TODO Auto-generated method stub
        
    }
    /***
	 * @param course_id
	 * @return Course summary
	 */
    private Course getCourseSummary(String course_id){

    }
    
    /***
	 * @param course_id
	 * @return none; print to the console the lecturer's Course summary
	 */
    public void printCourseSummary(String course_id)
    {

    }

}
