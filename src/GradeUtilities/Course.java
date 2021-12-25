/***
 * An instance of this class represent the final results of all students in a particular course.
 * Methods are provided to the client of this class to show some statistics of the results. 
 */
package GradeUtilities;

import java.util.*;
import sqlDBConnection.GradeDBUtilities;

public class Course {
	// data attributes
	private String course_id;
	private Hashtable<String, String> courseInfo; // {("course_name", "name"),("program", "prog_name"),(),...}
	private Hashtable<String, Float> gradesList; // {("student1", grade1), ("student2", grade2),...}
	private int numStudents;
	private ArrayList<Float> gradeValsList; // grade values only, in ascending order (sorted in the constructor), for computing some statistics of the course's grades, no need to link to student id 
	
	// constructor
	public Course(String course_id){
		// checking conditions to be added
		this.course_id = course_id;
		GradeDBUtilities dbconnector = new GradeDBUtilities();
		dbconnector.connect();
		
		courseInfo = dbconnector.getCourseOverallInfo(course_id);
		gradesList = dbconnector.getGradesList(course_id);
		numStudents = gradesList.size();
		gradeValsList = new ArrayList<Float>(numStudents);
		for(Map.Entry<String, Float> entry: gradesList.entrySet()){
			gradeValsList.add(entry.getValue());
		}
		// sort the grade list in ascending order 
		gradeValsList.sort((Float x, Float y) -> x.compareTo(y)); // lamda function pass as argument
		dbconnector.disconnect();
	}
	// methods
	/***
	 * @param none
	 * @return Course ID
	 */
	public String getCourseID() {
		return course_id;
	}
	/***
	 * @param none
	 * @return List of Student IDs
	 */
	public ArrayList<String> getStudentsList() {
		ArrayList<String> studentsList = new ArrayList<String>();
		for(Map.Entry<String, Float> entry: gradesList.entrySet()){
			studentsList.add(entry.getKey());
		}
		return studentsList;
	}
	/***
	 * @param none
	 * @return string of containing all student: corresponding grade
	 */
	public String getStudentsWithGrades() {
		String result = courseInfo.get("Course name") + " in semester " + courseInfo.get("Semester") + "\n";
		result = result + String.format("%-40s | %-5s\n", "Student ID", "Grade");
		result = result + (new String(new char[48])).replace('\0', '-') + "\n";
		for(Map.Entry<String, Float> entry: gradesList.entrySet()) {
			result = result + String.format("%-40s | %5.1f\n", entry.getKey(), entry.getValue());
		}
		return result;
	}
	/***
	 * @param none
	 * @return Course overall information
	 */
	public String getCourseInfo() {
		String result = "";
		for(Map.Entry<String, String> entry: courseInfo.entrySet()) {
			result = result + String.format("%-11s : %-100s\n", entry.getKey(), entry.getValue());
		}
		return result;
	}
	
	/***
	 * @param none
	 * @return Number of students taking the exam for this course
	 */
	public int getNumStudents() {
		return numStudents;
	}	
	/***
	 * @param none
	 * @return Minimum grade value
	 */
	public float getMinGrade() {
		float minVal = gradeValsList.get(0); // first in the sorted gradeValsList
		return minVal;
	}
	/***
	 * @param none
	 * @return Maximum grade value
	 */
	public float getMaxGrade() {
		float maxVal = gradeValsList.get(numStudents - 1); // last in the sorted gradeValsList
		return maxVal;
	}
	/***
	 * @param none
	 * @return Average of grades
	 */
	public float getAvr() {
		if (numStudents > 0) {
			float sum = 0;
			for (int i = 0; i < numStudents; i++) {
				sum += gradeValsList.get(i);
			}
			return sum/numStudents;
		} else {
			return 0;
		}
	}
	/***
	 * @param none
	 * @return Number of students passing the course
	 */
	public int countNumPass() {
		int numPass = 0;
		for (int i = 0; i < numStudents; i++) {
			if (gradeValsList.get(i) >= 5.0) {
				numPass++;
			}
		}
		return numPass;
	}
	/***
	 * @param none
	 * @return Number of student failed the course
	 */
	public int countNumFailed() {
		int numFailed = 0;
		for (int i = 0; i < numStudents; i++) {
			if (gradeValsList.get(i) < 5.0) {
				numFailed++;
			}
		}
		return numFailed;
	}
}

