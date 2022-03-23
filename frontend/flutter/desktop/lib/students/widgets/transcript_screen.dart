import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/students/data.dart';
import 'package:provider/provider.dart';

import '../../general_data.dart';
import '../../main.dart';
class TranscriptScreen extends StatelessWidget {
  late Future<PersonalInformationData> futurePID;
  late Future<String> futureRecord;


  @override
  Widget build(BuildContext context) {
    final currentUsernamefinal = Provider.of<currentUsername>(context,listen:true);
    futurePID = fetchPIData(currentUsernamefinal.cur_Username);
    futureRecord = fetchRecordData(currentUsernamefinal.cur_Username);
    return Row(
      children: [
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Transcript of record',
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
        ))
      ],
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
