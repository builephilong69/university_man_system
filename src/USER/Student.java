package USER;
import java.util.Date;

public class Student extends User {
    // data attributes
    private String program_id;
    private String intake;
    private Record record;
    // constructors
    public Student(String program_id, String intake, Record record,String name, String role, Date dateOfBirth, String placeOfBirth, String ssn) {
        this.program_id = program_id;
        this.intake = intake;
        this.record = record;
        this.info = new Personal_information(name, role, dateOfBirth, placeOfBirth, ssn);
    }
    //methods

    /***
	 * @param none
	 * @return none; print to the console personal info
	 */
    @Override
    public void getPersonalInfo() {
        // TODO Auto-generated method stub
        
    }

    /***
	 * @param none
	 * @return none; print to the console Record
	 */
    public void viewRecord(){}

    /***
	 * @param none
	 * @return none; export record to pdf
	 */
    public void exportRecordToPDF(){}
    
}
