
import 'dart:convert';
import 'package:http/http.dart' as http;

class StudentProfile{
  final String id;
  final String name;
  final String role;
  final String dob;
  final String ssn;

  const StudentProfile({
    required this.id,
    required this.name,
    required this.role,
    required this.dob,
    required this.ssn,
});
}
const student1PersonalInfo = StudentProfile(
  id:'16619',
  name:'Bui Le Phi Long',
  role : 'student',
  dob:  '12/03/2001',
  ssn : '69696969',
);
const student2PersonalInfo = StudentProfile(
  id:'16618',
  name:'Bui Le Phi Dao',
  role : 'student',
  dob:  '13/12/2001',
  ssn : '69696969',
);
const student3PersonalInfo = StudentProfile(
  id:'16620',
  name:'Bui Le Phi Ly',
  role : 'student',
  dob:  '15/09/2001',
  ssn : '69696969',
);
const student4PersonalInfo = StudentProfile(
  id:'16621',
  name:'Bui Le Phi Hanh',
  role : 'student',
  dob:  '16/05/2001',
  ssn : '69696969',
);

//Grade & transcript
class Grade{
  final String CourseName;
  final double grade;
  Grade({
    required this.CourseName,
    required this.grade,
  });
}
final grade_a = Grade(CourseName: 'Calculus', grade: 8.3);
final grade_b = Grade(CourseName: 'Computer Network', grade: 8.0);
final grade_c = Grade(CourseName: 'Programming', grade: 6.9);
final grade_d = Grade(CourseName: 'English', grade: 9.6);
List<Grade> Transcript =[
  grade_a,
  grade_b,
  grade_c,
  grade_d,
];
Future<String> fetchRecordData(String username) async{
  http.Response response = await http.post(Uri.parse("http://localhost:8080/sc"),body:username,headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //return Album.fromJson(jsonDecode(response.body));
    return response.body;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load the Records');
  }
}


