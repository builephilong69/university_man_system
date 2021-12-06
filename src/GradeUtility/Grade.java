/***
 * An instances of this class represent a final result of a student in a course
 */
package GradeUtility;

class Grade {
	// data attributes
	private String student_id;
	private	String course_id;
	private float grade;
	// constructor
	Grade(String st_id, String co_id, float gr){
		// checking conditions to be added
		student_id = st_id;
		course_id = co_id;
		grade = gr;
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
