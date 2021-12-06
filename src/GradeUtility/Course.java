/***
 * An instance of this class represent the final results of all students in a particular course.
 * Methods are provided to the client of this class to show some statistics of the results. 
 */
package GradeUtility;

public class Course {
	// data attributes
	private String course_id;
	private String course_name;
	private String program;
	private String lecturer_name;
	private String semester;
	Grade[] gradeList;
	// constructor
	Course(String c_id, String c_name, String prog, String ltr_name, String sem, Grade[] glist){
		// checking conditions to be added
		course_id = c_id;
		course_name = c_name;
		program = prog;
		lecturer_name = ltr_name;
		semester = sem;
		System.arraycopy(glist, 0, gradeList, 0, gradeList.length);
	}
	// methods
	/***
	 * @param none
	 * @return Course ID
	 */
	public String getCourseID() {
		// to be added later
		return "";
	}
	/***
	 * @param none
	 * @return List of Student IDs
	 */
	public String[] getStudentsList() {
		// to be added later
		String studentList[] = {""};
		return studentList;
	}
	/***
	 * @param none
	 * @return Course overall information
	 */
	public String getCourseInfo() {
		// to be added later
		return "";
	}
	/***
	 * @param none
	 * @return Number of students taking the exam for this course
	 */
	public int getNumStudent() {
		// to be added later
		return 0;
	}
	/***
	 * @param none
	 * @return Minimum grade value
	 */
	public float getMinGrade() {
		// to be added later
		return 0;
	}
	/***
	 * @param none
	 * @return Maximum grade value
	 */
	public float getMaxGrade() {
		// to be added later
		return 0;
	}
	/***
	 * @param none
	 * @return Average of grades
	 */
	public float getAvr() {
		// to be added later
		return 0;
	}
	/***
	 * @param none
	 * @return Number of students passing the course
	 */
	int countNumPass() {
		// to be added later
		return 0;
	}
	/***
	 * @param none
	 * @return Number of student failed the course
	 */
	int countNumFailed() {
		// to be added later
		return 0;
	}
}
