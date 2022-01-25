/***
 * An instances of this class represent an Student in the system
 */
package User;

import GradeUtilities.Record;
import sqlDBConnection.UserDBUtilities;
import java.util.Hashtable;

public class Student extends User {
    // data attributes
    private Hashtable<String, String> studentInfo;
    private Record record;

    // constructors
    public Student(String username) {
        super(username);
        UserDBUtilities dbconnector = new UserDBUtilities();
        dbconnector.connect();
        studentInfo = dbconnector.getStudentInfo(username);
        dbconnector.disconnect();
        this.record = new Record(username);
    }

    //methods

    /***
	 * @param none
	 * @return none; print to the console personal info
	 */
    @Override
    public void getPersonalInfo() {
    	System.out.println("Full name     : " + info.getFullName());
    	System.out.println("Date of birth : " + info.getDateOfBirth().toString());
    	System.out.println("Place of birth: " + info.getPlaceOfBirth());
    	System.out.println("SSN           : " + info.getSSN());
    	System.out.println("Program       : " + studentInfo.get("Program"));
    	System.out.println("Intake        : " + studentInfo.get("Intake"));
    }

    /***
	 * @param none
	 * @return none; print to the console Record
	 */
    public void printRecord(){
        this.record.printRecord();
    }

    /***
	 * @param none
	 * @return none; export record to txt
	 */
    public void exportRecordToTXT(){
	    this.record.toTXT();
    }   
}
