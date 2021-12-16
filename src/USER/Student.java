package User;


import java.util.Hashtable;

import GradeUtilities.Record;
import sqlDBConnection.UserDBUtilities;

public class Student extends User {
    // data attributes
    private String program_id;
    private String intake;
    private Record record;

    // constructors
    public Student(String username) {
        super(username);
        UserDBUtilities dbconnector = new UserDBUtilities();
        dbconnector.connect();
        Hashtable<String,String> student_info  = dbconnector.getStudentInfo(username);
        this.program_id = student_info.get("Program");
        this.intake= student_info.get("Intake");
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
        
        System.out.println("Student: "+this.info.getFullName()+"  - Program: "+this.program_id+" - Intake: "+this.intake);
        this.info.getPersonalInfo();
        
    }

    /***
	 * @param none
	 * @return Record
	 */
    public Record getRecord()
    {
        return this.record;
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
	 * @return none; export record to pdf
	 */
    public void exportRecordToPDF(){}
    
}
