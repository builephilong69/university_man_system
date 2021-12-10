/***
 * An instances of this class represent a final result of a student in a course
 */
package GradeUtility;

import sqlDBConnection.GradeDBUtilities;

class Grade {
	// data attributes
	private String student_id;
	private	String course_id;
	private float grade_val;
	// constructor
	Grade(String st_id, String co_id){
		// checking conditions to be added
		student_id = st_id;
		course_id = co_id;
		GradeDBUtilities dbconnector = new GradeDBUtilities();
		dbconnector.connect();
		grade_val = dbconnector.getGrade(course_id=co_id,student_id=st_id);
		dbconnector.disconnect();
	}
	// methods
	/***
	 * @param none
	 * @return Student ID
	 */
	protected String getStudentID() {
		return student_id;
	}
	/***
	 * @param none
	 * @return Course ID
	 */
	protected String getCourseID() {
		return course_id;
	}
	/***
	 * @param none
	 * @return Grade of the student on this course
	 */
	protected float getGradeValue() {
		return grade_val;
	}
}
