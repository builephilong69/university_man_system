package User;

import GradeUtilities.*;

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
    /***
	 * @param course_id
	 * @return Course summary
	 */
    public Course getCourseSummary(String course_id){
        Course a_course = new Course(course_id);
        return a_course;

    }
    
    /***
	 * @param course_id
	 * @return none; print to the console the lecturer's Course summary
	 */
    public void printCourseSummary(String course_id)
    {
        Course a_course = this.getCourseSummary(course_id);
        String course_info = a_course.getCourseInfo();
        System.out.println(course_info);
    }

}
