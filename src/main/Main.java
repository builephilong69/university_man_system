package main;

import User.*;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
	
			String username, pw, role;
			System.out.print("Username: ");
			username = sc.nextLine();
			System.out.print("Password: ");
			pw = sc.nextLine();
			role = UserFunctions.login(username, pw);
			// instantiate a new user of type Assistant or Lecturer or Student accordingly
			if (role.equals("assistant")) { 
				Assistant assistant = new Assistant(username);
				assistant.getPersonalInfo();
				assistant.printStudentRecord("11111");
				assistant.printCourseSummary("CSEW2021M13");
				assistant.logout();
			}
			else if (role.equals("lecturer")) {
				Lecturer lecturer = new Lecturer(username);
				lecturer.getPersonalInfo();
				lecturer.logout();
			}
			else if (role.equals("student")){
				Student student = new Student(username);
				student.getPersonalInfo();
				student.logout();
			}
		
		sc.close();
	}

}
