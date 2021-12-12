package User;

abstract public class User {
    // data attributes
    protected String username;
    protected String password;
    protected PersonalInformation info;
    // methods

    public User(String username) {
        this.username = username;
        this.info = new PersonalInformation(username);
    }

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
