package USER;
import java.util.Date;

abstract public class User {
    private String username;
    private String password;
    private Personal_infomation info;

    public void login(String username, String password){};
    public void logout(){};
    public abstract void getPersonalInfo();
}
