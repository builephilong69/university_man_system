//Grade & transcript
import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:ffi';
import 'package:mysql1/mysql1.dart';

//Course
class Course{
  final String id;
  final String name;
  final String program;
  final int numStudents;
  //late final HashMap<String,Float>gradeList;
  //late final HashMap<String, String>courseInfo;
  final double maxGrade;
  final double minGrade;
  final double avr;

  Course(this.id, this.name,this.program, this.numStudents, this.maxGrade, this.minGrade,this.avr);
}
final oopCourse = Course('CSEW2021M13','OOP Programming with Java','CSE',3,1.5,2.0,2.2);
final cnCourse = Course('CSEW2021M15','Computer Network','CSE',3,2.0,5.0,1.7);
final stCourse = Course('CSEW2021M17','Statistics','CSE',10,1.0,5.0,2.0);

class LecturerProfile{
  final String id;
  final String name;
  final String role;
  final String dob;
  final String ssn;
  //lecturer info
  late final List<String> list_of_ownCourses;
  final String title;

  LecturerProfile(this.id, this.name, this.role, this.dob, this.ssn, this.title);
}
List<Course>OwnCourses = [oopCourse,cnCourse,stCourse];

final lecturerPersonalInfo = LecturerProfile(
  '16619',
  'Bui Le Phong Li',
   'lecturer',
   '12/03/1969',
   '69696969',
  'Dr.',

);
class ListOfCourseData{
  final String course_own_status;
  final String course_name;
  final String no_student;
  final String min_grade;
  final String max_grade;
  final String average;
  ListOfCourseData({
    required this.course_own_status,
    required this.course_name,
    required this.no_student,
    required this.min_grade,
    required this.max_grade,
    required this.average
  });
  factory ListOfCourseData.fromJson(Map<String, dynamic>json){
    return ListOfCourseData(
        course_own_status: json['course_own_status'],
        course_name : json['course_name'],
        no_student: json['no_student'],
        min_grade: json['min_grade'],
        max_grade: json['max_grade'],
        average: json['average']
    );
  }
}

Future<ListOfCourseData> fetchListOfCoursesData(String username, String course_id) async {
  Map<String,dynamic> lmap = {"username": username, "courseid": course_id};
  String json = jsonEncode(lmap);
  final response = await http.post(Uri.parse("http://localhost:8080/getCS"),body:json,headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the string.
    return ListOfCourseData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load PI data');
  }
}
Future<String>fetchOwnCourses(String username)async
{
  final response = await http.post(Uri.parse("http://localhost:8080/sendOC"),body:username,headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the string.
    return response.body;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load PI data');
  }
}




