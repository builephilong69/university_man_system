package User;

import java.util.ArrayList;

import GradeUtilities.*;
import sqlDBConnection.UserDBUtilities;

public class Lecturer extends User {
    // data attributes
    
    
    
    
    // constructors
    public Lecturer(String username) {
        super(username);
    }
    // methods
    /***
	 * @param none
	 * @return none; print to the console personal info
	 */
    @Override
    public void getPersonalInfo() {
        System.out.println("Lecturer: "+this.info.getFullName());
        this.info.getPersonalInfo();
    }
    /**
     * 
     * @return Array list of course_id taught by the lecturer
     */
    private ArrayList<String> getOwnCourse()
    {
        ArrayList<String> result = new ArrayList<String>();
        UserDBUtilities connector = new UserDBUtilities();
        connector.connect();
        result =connector.getOwnCourse(this.username);
        connector.disconnect();
        return result;
    }
    /**
     * 
     * @param none
     * @return none, print to consle the Courses' id that lecturer teach 
     */
    public void printOwnCourse()
    {
        ArrayList<String> courseList = this.getOwnCourse();
        System.out.println("All the course taught by   "+ this.username);
        for(String i : courseList)
        {
            System.out.println(i);
        }

    }


   
    /***
	 * @param courseIndex
	 * @return the summary of the course taught by that lecturer
	 */
    public String getCourseSummary(int courseIndex){
        ArrayList<String> courseList = this.getOwnCourse();
        Course course = new Course(courseList.get(courseIndex));
        return course.getCourseInfo();
    }
    
    /***
	 * @param course_id
	 * @return none; print to the console the lecturer's Course summary
	 */
    public void printCourseSummary(int courseIndex)
    {
        String summary = getCourseSummary(courseIndex);
        System.out.println(summary);
    }

}
