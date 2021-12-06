package USER;
import java.util.Date;

public class Personal_infomation {
    private String name;
    private String role;
    private Date dateOfBirth;
    private String placeOfBirth;
    private String ssn;

    protected String getFullName()
    {
        return this.name;
    }
    protected Date getDateOfBirth()
    {
        return this.dateOfBirth;
    }
    protected String getPlaceOfBirth()
    {
        return this.placeOfBirth;
    }

    
}
