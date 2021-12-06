package USER;
import java.util.Date;

public class Assistant extends User {
    private String faculty_id;
    private String[] program_id;

    public Assistant() {
    }

    @Override
    public void getPersonalInfo() {
        // TODO Auto-generated method stub
        
    }
    
    public void insertGrade(String student_id,String course_id,float Grade){}

    public void modifyGrade(String student_id,String course_id,float Grade){}

//  private Record getStudentRecord(String student_id){}
    
//  public void printStudentRecord(Record record){}

//  private Course getCourseSummary(String course_id){}

//  public void printCourseSummary(Course course){}

    
}
