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
				Assistant assistant = new Assistant(username); // e.g. (trang.nguyenthithuy, programAssistant)
				assistant.getPersonalInfo();
				assistant.printStudentRecord("11111");
				assistant.printCourseSummary("CSEW2021M13");
				assistant.logout();
			}
			else if (role.equals("lecturer")) {
				Lecturer lecturer = new Lecturer(username); // e.g. (ngoc.tranhong, cseLecturer1)
				lecturer.getPersonalInfo();
				lecturer.printOwnCourse();
				lecturer.logout();
			}
			else if (role.equals("student")){
				Student student = new Student(username); // e.g. (11111, cseStudent1)
				student.getPersonalInfo();
				student.printRecord();
				student.logout();
			}
		
		sc.close();
	}

}
