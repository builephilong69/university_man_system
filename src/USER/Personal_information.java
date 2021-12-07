package USER;
import java.util.Date;

public class Personal_information {
    // data attributes
    private String name;
    private String role;
    private Date dateOfBirth;
    private String placeOfBirth;
    private String ssn;
    // constructors
    public Personal_information(String name, String role, Date dateOfBirth, String placeOfBirth, String ssn) {
        this.name = name;
        this.role = role;
        this.dateOfBirth = dateOfBirth;
        this.placeOfBirth = placeOfBirth;
        this.ssn = ssn;
    }
    //methods
    /***
	 * @param none
	 * @return none; print to the console
	 */
    protected String getFullName()
    {
        return this.name;
    }

    /***
	 * @param none
	 * @return Date of birth 
	 */
    protected Date getDateOfBirth()
    {
        return this.dateOfBirth;
    }

    /***
	 * @param none
	 * @return Place of birth
	 */
    protected String getPlaceOfBirth()
    {
        return this.placeOfBirth;
    }

    
}
