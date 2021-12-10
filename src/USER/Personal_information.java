package USER;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Hashtable;
import sqlDBConnection.UserDBUtilities;

class PersonalInformation {
    // data attributes
    private String full_name;
    private String role;
    private LocalDate dateOfBirth;
    private String placeOfBirth;
    private String ssn;
    // constructors
    protected PersonalInformation(String username) {
    	UserDBUtilities dbconnector = new UserDBUtilities();
		dbconnector.connect();
		Hashtable<String, String> info = dbconnector.getPersonalInfo(username);
		this.full_name = info.get("Full name");
        this.role = info.get("Role");
        if (info.get("Date of birth") != "unknown") {
        	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        	String infoDOB = info.get("Date of birth");
        	this.dateOfBirth = LocalDate.parse(infoDOB, formatter);
        } else {
        	dateOfBirth = LocalDate.of(0, 1, 1); // set to default
        }
        this.placeOfBirth = info.get("Place of birth");
        this.ssn = info.get("SSN");
		dbconnector.disconnect();
    }
    //methods
    /***
	 * @param none
	 * @return none; print to the console
	 */
    protected String getFullName()
    {
        return this.full_name;
    }

    /***
	 * @param none
	 * @return Date of birth 
	 */
    protected LocalDate getDateOfBirth()
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
    /***
	 * @param none
	 * @return role
	 */
    protected String getRole() {
    	return this.role;
    }
    /***
	 * @param none
	 * @return ssn
	 */
    protected String getSSN() {
    	return this.ssn;
    }
}
