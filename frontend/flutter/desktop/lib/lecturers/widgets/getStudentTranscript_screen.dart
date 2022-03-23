import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:frontend/assistant/data/data.dart';
import 'package:frontend/students/data.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../general_data.dart';
import '../../main.dart';

class GetTranscriptScreen extends StatelessWidget {



  static const routeName = 'studenttranscript';
  static List<StudentProfile>studentList = [student1PersonalInfo,student2PersonalInfo,student3PersonalInfo];
  late Future<String> futureRecord;
  late Future<PersonalInformationData>futurePID;



  @override
  Widget build(BuildContext context) {
    final CourseIndex = Provider.of<courseIndex>(context,listen:true);
    int index = CourseIndex.currentIndex;
    final currentUsernamefinal = Provider.of<currentUsername>(context,listen:true);
    String uid = currentUsernamefinal.cur_StudentTranscriptUID;
    futureRecord = fetchRecordData(uid);
    futurePID = fetchPIData(uid);


    //run a method to get student profile on course_index

    return Scaffold(
      appBar: AppBar(
        // title: Text('Login'),
        elevation: 0,

      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('STUDENT TRANSCRIPT',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontSize: 50.0),
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


            LimitedBox(
              maxHeight: double.infinity,
              child: FutureBuilder<String>(
                  future:futureRecord,
                  builder:(context,snapshot){
                    if(snapshot.hasData){
                      return Text(snapshot.data!,style:Theme.of(context).textTheme.bodyText2);
                    }else if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }
              ),
            ),
            const SizedBox(height: 12.0),

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