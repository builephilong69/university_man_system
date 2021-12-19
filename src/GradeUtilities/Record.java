/***
 * An instance of this class represent a final grade of all courses of a particular student  
 */
package GradeUtilities;

import java.util.*;
import java.io.*;
import sqlDBConnection.GradeDBUtilities;
//import com.itextpdf.kernel.pdf.PdfDocument;
//import com.itextpdf.kernel.pdf.PdfWriter;
//import com.itextpdf.layout.Document;
//import com.itextpdf.layout.element.Paragraph;

public class Record {
	// data member
	private String student_id;
	private Hashtable<String, Float> record; // {("course1_id", grade1), "course2_id", grade2}
	
	// constructor
	public Record (String student_id){
		this.student_id = student_id;
		GradeDBUtilities dbconnector = new GradeDBUtilities();
		dbconnector.connect();
		record = dbconnector.getRecord(student_id);
		dbconnector.disconnect();
	}
	
	// methods
	/***
	 * @param none
	 * @return string of all record details to be used in printRecord() or toPDF()
	 */
	private String getRecord() {
		String result = "";
		result = result + "Record of student " + student_id + "\n";
		result = result + String.format("%-100s | %-20s | %-8s | %-5s\n", "Course name", "Course ID", "Semester", "Grade");
		result = result + (new String(new char[142])).replace("\0", "-") + "\n";
		for(Map.Entry<String, Float> entry: record.entrySet()){
			String course_id = entry.getKey();
			GradeDBUtilities dbconnector = new GradeDBUtilities();
			dbconnector.connect();
			Hashtable<String, String> courseInfo = dbconnector.getCourseOverallInfo(course_id);
			String course_name = courseInfo.get("Course name");
			String semester = courseInfo.get("Semester");
			dbconnector.disconnect();
			result = result + String.format("%-100s | %-20s | %-8s | %5.1f\n", course_name, course_id, semester, entry.getValue());
		}
		return result;
	}
	/***
	 * @param none
	 * @return none; print record to the console
	 */
	public void printRecord() {
		System.out.println(this.getRecord());
	}
	/***
	 * testing successfully, to be deleted when toPDF() dependency problems resolved
	 * @param none
	 * @return TXT record file created in the current directory 
	 */
	public void toTXT() {
		try {
			String currentDir = System.getProperty("user.dir");
			File file = new File(currentDir);
			file.createNewFile();
			PrintWriter writer = new PrintWriter("Record.txt", "UTF-8");
			writer.println(this.getRecord());
			writer.close();
			System.out.println(currentDir);
			// after creating file, opening the file explorer and highlighting the directory containing it
			Runtime.getRuntime().exec("explorer.exe /select," + currentDir); 
		} catch(IOException e) {
			System.out.println("Fail to create file.");
			e.printStackTrace();
		}
	}
//	/***
//	 * @param none
//	 * @return PDF record file created in the current directory 
//	 */
//	public void toPDF() {
//		try {
//			String currentDir = System.getProperty("user.dir");
//			PdfDocument pdf = new PdfDocument(new PdfWriter(currentDir + "/Record.pdf"));
//			Document doc = new Document(pdf);
//			doc.add(new Paragraph(this.getRecord()));
//			doc.close();
//			// after creating file, opening the file explorer and highlighting the directory containing it
//			Runtime.getRuntime().exec("explorer.exe /select," + currentDir); 
//		} catch (IOException e) {
//			System.out.println("Fail to create pdf file.");
//			e.printStackTrace();
//		}
//	}
}
