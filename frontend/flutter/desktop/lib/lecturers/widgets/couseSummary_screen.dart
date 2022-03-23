import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/lecturers/data/data.dart';
import 'package:frontend/lecturers/screens/mainscreen.dart';
import 'package:frontend/lecturers/widgets/courseInfo_screen.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../general_data.dart';
import '../../main.dart';
import '../../signup_login/login_screen.dart';
class CSummaryScreen extends StatelessWidget {
  late Future<PersonalInformationData> futurePID;


  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUsernamefinal = Provider.of<currentUsername>(context,listen:true);
    futurePID = fetchPIData(currentUsernamefinal.cur_Username);
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
            SizedBox(
              child:FutureBuilder<PersonalInformationData>(
                  future:futurePID,
                  builder:(context,snapshot){
                    if(snapshot.hasData){
                      return Text('Name: '+ snapshot.data!.full_name,style:Theme.of(context).textTheme.headline2);
                    }else if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }
              ),
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
                http.Response resp = await http.post(Uri.parse("http://localhost:8080/getCS"),body:json,headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },);

                Map<String, dynamic> map = jsonDecode(resp.body);
                String check_result = map['course_own_status'];
                String new_course_name = map['course_name'];
                currentUsernamefinal.changeCourseName(new_course_name);

                if(check_result== 'notallowed')
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
                  Navigator.of(context).pushNamed(CourseInfo.routeName);
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
  Card buildCard(BuildContext context, int index)
  {
    final CourseIndex = Provider.of<courseIndex>(context,listen:true);
    return Card(

                  child: InkWell(
                    onTap: (){
                      CourseIndex.changeIndex(index);
                      Navigator.of(context).pushNamed(CourseInfo.routeName);
                    },
                    child: ListTile(
                      //leading: FlutterLogo(size: 72.0),
                      title: Text(OwnCourses[index].name,
                        style: TextStyle(
                          fontSize: 25.0,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Number of Students:  '+OwnCourses[index].numStudents.toString(),
                              style: Theme.of(context).textTheme.bodyText2),

                          Text('Minimum Grade:  '+OwnCourses[index].minGrade.toString(),
                              style: Theme.of(context).textTheme.bodyText2),

                          Text('Maximum Grade: '+OwnCourses[index].maxGrade.toString(),
                                style: Theme.of(context).textTheme.bodyText2),

                        ],
                      ),
                      /*
                      trailing:
                        IconButton(
                          icon: Icon(
                            Icons.expand_more,
                            size: 50.0,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            //   _onDeleteItemPressed(index);
                           },
                        ),
                      */
                      ),
                  ),
    );
  }

}
