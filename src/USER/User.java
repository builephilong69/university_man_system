package USER;

abstract public class User {
    // data attributes
    protected String username;
    protected String password;
    protected Personal_information info;
    // methods

    /***
	 * @param (user_name,password)
	 * @return none; login
	 */
    public void login(String username, String password){

    }

    /***
	 * @param none
	 * @return none; print to the console
	 */
    public void logout(){

    }
    //abstract method
    public abstract void getPersonalInfo();
}
