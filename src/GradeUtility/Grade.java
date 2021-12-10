/***
 * An instance of this class represent a final grade of all courses of a particular student  
 */
package GradeUtilities;

import java.util.*;
import sqlDBConnection.GradeDBUtilities;

public class Record {
	// data member
	private String student_id;
	private Hashtable<String, Float> record;
	
	// constructor
	public Record (String student_id){
		this.student_id = student_id;
		GradeDBUtilities dbconnector = new GradeDBUtilities();
		dbconnector.connect();
		record = dbconnector.getRecord(student_id);
		dbconnector.disconnect();
	}
	
	// methods
	/***
	 * @param none
	 * @return none; print to the console
	 */
	public void printRecord() {
		System.out.println("Record of student " + student_id);
		for(Map.Entry<String, Float> entry: record.entrySet()){
			System.out.println(entry.getKey() + ": " + entry.getValue());
		}
	}
}
