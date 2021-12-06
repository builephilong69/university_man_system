/***
 * An instance of this class represent a final grade of all courses of a particular student  
 */
package GradeUtility;

public class Record {
	// data member
	private Grade[] list;
	// constructor
	Record (Grade[] l){
		// checking condition to be added
		System.arraycopy(l, 0, list, 0, l.length);
	}
	// methods
	/***
	 * @param none
	 * @return none; print to the console
	 */
	public void printRecord() {
		// to be added later
	}
}
