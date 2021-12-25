package User;

abstract class User implements UserFunctions {
	// data attributes
    protected String username;
    protected PersonalInformation info;
    
    // constructor
    public User(String username) {
        this.username = username;
        this.info = new PersonalInformation(username);
    }
    
    /***
	 * @param none
	 * @return none
	 */
    public void logout(){
    	System.out.println("Successfully logout.");
    }
    // abstract method to be implemented by Assistant, Lecturer, Student
    public abstract void getPersonalInfo();
}
