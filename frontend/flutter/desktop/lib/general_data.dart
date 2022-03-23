import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'main.dart';

class PersonalInformationData{
  final String full_name;
  final String role;
  final String dateOfBirth;
  final String placeOfBirth;
  final String ssn;
  PersonalInformationData({
    required this.full_name,
    required this.role,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.ssn,
});
  factory PersonalInformationData.fromJson(Map<String, dynamic>json){
    return PersonalInformationData(
      full_name: json['full_name'],
      role : json['role'],
      dateOfBirth: json['dateOfBirth'],
      placeOfBirth: json['placeOfBirth'],
      ssn: json['ssn']
    );
  }
  //method
  String getFullName()
  {
    return this.full_name;
  }
  String getRole(){
    return this.role;
  }
  String getDOB(){
    return this.dateOfBirth;
  }
  String getPOB(){
    return this.placeOfBirth;
  }
  String getSSN(){
    return this.ssn;
  }

}
Future<PersonalInformationData> fetchPIData(String username) async {
  final response = await http.post(Uri.parse("http://localhost:8080/pi"),body:username,headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //return Album.fromJson(jsonDecode(response.body));
    return PersonalInformationData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load PI data');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}