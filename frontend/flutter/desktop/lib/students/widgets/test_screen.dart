import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/general_data.dart';
import 'package:frontend/students/data.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
class TestScreen extends StatelessWidget {
late Future<PersonalInformationData> futurePID;


  @override
  Widget build(BuildContext context) {
    final currentUsernamefinal = Provider.of<currentUsername>(context,listen:true);
    futurePID = fetchPIData(currentUsernamefinal.cur_Username);



    return Center(
      child: FutureBuilder<PersonalInformationData>(
        future:futurePID,
        builder:(context,snapshot){
          if(snapshot.hasData){
            return Text(snapshot.data!.full_name);
          }else if(snapshot.hasError){
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        }
      ),
    );
  }

  Row buildRow(BuildContext context, int index) {
    return Row(
      children: [
        SizedBox(
            width:300.0,
            height: 30.0,
            child: Text('Course:  '+Transcript[index].CourseName, style: Theme.of(context).textTheme.bodyText2)),
        SizedBox(
            width:300.0,
            height: 30.0,
            child: Text('Grade: '+Transcript[index].grade.toString(), style: Theme.of(context).textTheme.bodyText2)),
      ],
    );
  }
}
