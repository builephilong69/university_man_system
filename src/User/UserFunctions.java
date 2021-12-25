package User;

import sqlDBConnection.UserDBUtilities;
import java.util.Hashtable;
public interface UserFunctions {
	static public String login(String username, String pw) {
		String result; // "notMatched" or "assistant" or "lecturer" or "student" (same as value stored in the DB, case-sensitive)
		UserDBUtilities dbconnector = new UserDBUtilities();
		dbconnector.connect();
		int success_indicator = dbconnector.login(username, pw); // 0 if success, 1 otherwise
		if (success_indicator == 0) {
			dbconnector.getPersonalInfo(username);
			Hashtable<String, String> info = dbconnector.getPersonalInfo(username);
			result = info.get("Role"); // --> can initialize user of type Assistant or Lecturer or Student
			System.out.print(result);
		}
		else {
			result = "notMatched";
		}
		dbconnector.disconnect();
		return result;
	};
	public void logout();
	void getPersonalInfo();
}
