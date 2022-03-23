import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/assistant/data/data.dart';
import 'package:frontend/lecturers/screens/mainscreen.dart';
import 'package:frontend/lecturers/widgets/courseInfo_screen.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import '../../signup_login/login_screen.dart';
import 'courseInfo_screen.dart';
class CSummaryScreen extends StatelessWidget {



  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUsernamefinal = Provider.of<currentUsername>(context,listen:true);

    return Row(
      children: [
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Course Summary',
              style: Theme.of(context)
                  .textTheme
                  .overline!
                  .copyWith(fontSize:12.0),
            ),
            const SizedBox(height: 20.0,),

            /*
            LimitedBox(
              maxHeight: double.infinity,
              child: ListView.builder(
                shrinkWrap:true,
                itemCount: OwnCourses.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildCard(context, index);
                },
              ),

            ),
             */
            TextField(
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter the course id',
              ),
            ),


            const SizedBox(height: 12.0),

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
              onPressed: () async {
                currentUsernamefinal.changeCID(myController.text);
                Map<String,dynamic> lmap = {"username": currentUsernamefinal.cur_Username, "courseid": myController.text};
                String json = jsonEncode(lmap);
                http.Response resp = await http.post(Uri.parse("http://localhost:8080/assistantgetCS"),body:json,headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },);

                Map<String, dynamic> map = jsonDecode(resp.body);
                String check_result = map['course_own_status'];
                String new_course_name = map['course_name'];
                currentUsernamefinal.changeCourseName(new_course_name);

                if(new_course_name== '')
                {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text the that user has entered by using the
                        // TextEditingController.
                        content: Text('You are not allowed to see the course or there is no such course exists'),
                      );
                    },
                  );
                }
                else{
                  Navigator.of(context).pushNamed(Assistant_CourseInfo.routeName);
                }


              },
              child: const Text('Search'),
            ),


            const SizedBox(height: 12.0),


          ],
        ))
      ],
    );
  }

}
