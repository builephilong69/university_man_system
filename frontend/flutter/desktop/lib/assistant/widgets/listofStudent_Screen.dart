import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:frontend/assistant/data/data.dart';
import 'package:frontend/students/data.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class LOS_Screen extends StatelessWidget {
  static const routeName = 'listofStudents';
  static List<StudentProfile>studentList = [student1PersonalInfo,student2PersonalInfo,student3PersonalInfo];
  late Future<String> futureStudentList;

  @override
  Widget build(BuildContext context) {
    final CourseIndex = Provider.of<courseIndex>(context,listen:true);
    int index = CourseIndex.currentIndex;
    final currentUsernamefinal = Provider.of<currentUsername>(context,listen:true);
    futureStudentList= fetchStudentList(currentUsernamefinal.cur_Courseid);
    final uidInsertGradeController = TextEditingController();
    final gradeInsertController = TextEditingController();

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      uidInsertGradeController.dispose();
    }
    //run a method to get student profile on course_index

    return Scaffold(
      appBar: AppBar(
        // title: Text('Login'),
        elevation: 0,

      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('LIST OF STUDENTS',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 50.0),
                ),
                SizedBox(height: 24.0,),
                Text('Course: '+currentUsernamefinal.cur_CourseName ,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 25.0),
                ),
                SizedBox(height: 24.0,),
                /*
                DataTable(columns: [
                  DataColumn(label: Text('ID'),
                  ),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Grade')),
                ],
                    rows: [buildDataRow(context, index)]
                ),
                */
                SizedBox(
                  child:FutureBuilder<String>(
                      future:futureStudentList,
                      builder:(context,snapshot){
                        if(snapshot.hasData){
                          return Text('\n'+snapshot.data!,style:Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 24));
                        }else if(snapshot.hasError){
                          return Text('${snapshot.error}');
                        }
                        return const CircularProgressIndicator();
                      }
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        )
                    ),
                  ),

                  // When the user presses the button, show an alert dialog containing
                  // the text that the user has entered into the text field.
                  onPressed: () {

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          content: SizedBox(
                            height: 165.0,
                            child: Column(
                              children: [
                                TextField(
                                  controller: uidInsertGradeController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'UID',
                                  ),
                                ),
                                SizedBox(height: 12.0,),
                                TextField(
                                  controller: gradeInsertController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Grade',
                                  ),
                                ),
                                SizedBox(height: 12.0,),
                                OutlinedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(0.0),
                                        )
                                    ),
                                  ),
                                  child: const Text('Insert grades'),
                                  onPressed: () async {
                                    print("inserting grade..");
                                    print(currentUsernamefinal.cur_Username);
                                    Map<String,dynamic> lmap = {"student_uid": uidInsertGradeController.text,
                                                                "grade": gradeInsertController.text,
                                                                "assistant_username":currentUsernamefinal.cur_Username,
                                                                "course_id":currentUsernamefinal.cur_Courseid,
                                                                "requestname":"insertGrade"};
                                    String json = jsonEncode(lmap);
                                    http.Response resp = await http.post(Uri.parse("http://localhost:8080/insertgrade"),body:json,headers: <String, String>{
                                      'Content-Type': 'application/json; charset=UTF-8',
                                    },);
                                    if(resp.body=="fail")
                                      {
                                        showDialog(context: context, builder: (context){
                                          return AlertDialog(
                                            content: Text("Fail to insert grade, check the UID again"),
                                          );
                                        });
                                      }
                                    else if(resp.body=="existed"){
                                      showDialog(context: context, builder: (context){
                                        return AlertDialog(
                                          content: Text("Fail to insert, maybe there exists a grade for that UID in this course"),
                                        );
                                      });
                                    }
                                    else{
                                      showDialog(context: context, builder: (context){
                                        return AlertDialog(
                                          content: Text(" Successfully insert! Reload the page"),
                                        );
                                      });

                                    }


                                  }
                                  ),

                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text('Insert grades'),
                ),
              ],),
            SizedBox(width: 12.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        )
                    ),
                  ),

                  // When the user presses the button, show an alert dialog containing
                  // the text that the user has entered into the text field.
                  onPressed: () {

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          content: SizedBox(
                            height: 165.0,
                            child: Column(
                              children: [
                                TextField(
                                  controller: uidInsertGradeController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'UID',
                                  ),
                                ),
                                SizedBox(height: 12.0,),
                                TextField(
                                  controller: gradeInsertController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Grade',
                                  ),
                                ),
                                SizedBox(height: 12.0,),
                                OutlinedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(0.0),
                                          )
                                      ),
                                    ),
                                    child: const Text('Modify grade'),
                                    onPressed: () async {
                                      print("modifying grade..");
                                      print(currentUsernamefinal.cur_Username);
                                      Map<String,dynamic> lmap = {"student_uid": uidInsertGradeController.text,
                                        "grade": gradeInsertController.text,
                                        "assistant_username":currentUsernamefinal.cur_Username,
                                        "course_id":currentUsernamefinal.cur_Courseid,
                                        "requestname":"modifyGrade"
                                      };
                                      String json = jsonEncode(lmap);
                                      http.Response resp = await http.post(Uri.parse("http://localhost:8080/insertgrade"),body:json,headers: <String, String>{
                                        'Content-Type': 'application/json; charset=UTF-8',
                                      },);
                                      if(resp.body=="fail")
                                      {
                                        showDialog(context: context, builder: (context){
                                          return AlertDialog(
                                            content: Text("Fail to modify grade, check the UID again"),
                                          );
                                        });
                                      }
                                      else if(resp.body=="not existed"){
                                        showDialog(context: context, builder: (context){
                                          return AlertDialog(
                                            content: Text("Fail to modify, maybe there does not exist a grade for that UID in this course"),
                                          );
                                        });
                                      }
                                      else{
                                        showDialog(context: context, builder: (context){
                                          return AlertDialog(
                                            content: Text("Successfully modify!!! Reload the page"),
                                          );
                                        });

                                      }


                                    }
                                ),

                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text('Modify grades'),
                ),
              ],),
          ],
        ),
      ),
    );
  }

  /*
  DataRow buildDataRow(BuildContext context, int index)
  {
    return DataRow(
        cells: [
      DataCell(Text(studentList[index].id)),
      DataCell(Text(studentList[index].name)),
      DataCell(Text('...')),
    ]
    );
  }
  */
  Future<String>fetchStudentList(String course_id)async
  {
    final response = await http.post(Uri.parse("http://localhost:8080/studentlist"),body:course_id,headers: <String, String>{
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

}