import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:frontend/lecturers/data/data.dart';
import 'package:provider/provider.dart';

import '../../general_data.dart';
import '../../main.dart';
class PersonalInformation_Screen extends StatelessWidget {
  late Future<PersonalInformationData> futurePID;
  late Future<String>futureOwnCourses;


  @override
  Widget build(BuildContext context) {
    final profile = lecturerPersonalInfo;
    final currentUsernamefinal = Provider.of<currentUsername>(context,listen:true);
    futurePID = fetchPIData(currentUsernamefinal.cur_Username);
    futureOwnCourses = fetchOwnCourses(currentUsernamefinal.cur_Username);

    return Row(
      children: [
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('PERSONAL INFORMATION',
              style: Theme.of(context)
                  .textTheme
                  .overline!
                  .copyWith(fontSize:12.0),
            ),
            const SizedBox(height: 12.0),
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


            const SizedBox(height: 12.0),
            SizedBox(
              child:FutureBuilder<PersonalInformationData>(
                  future:futurePID,
                  builder:(context,snapshot){
                    if(snapshot.hasData){
                      return Text('Role: '+snapshot.data!.role,style:Theme.of(context).textTheme.headline5);
                    }else if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }
              ),
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                Text('ID: '+currentUsernamefinal.cur_Username, style: Theme.of(context).textTheme.headline5),

                const SizedBox(width: 300.0),

                SizedBox(
                  child:FutureBuilder<PersonalInformationData>(
                      future:futurePID,
                      builder:(context,snapshot){
                        if(snapshot.hasData){
                          return Text('SSN: '+snapshot.data!.ssn,style:Theme.of(context).textTheme.headline5);
                        }else if(snapshot.hasError){
                          return Text('${snapshot.error}');
                        }
                        return const CircularProgressIndicator();
                      }
                  ),
                ),
                //Text('SSN: '+profile.ssn, style: Theme.of(context).textTheme.headline5),
              ],
            ),
            const SizedBox(height: 12.0),
            //Text('Day of birth: '+ profile.dob,style: Theme.of(context).textTheme.headline5),
            SizedBox(
              child:FutureBuilder<PersonalInformationData>(
                  future:futurePID,
                  builder:(context,snapshot){
                    if(snapshot.hasData){
                      return Text('Date of birth: '+snapshot.data!.dateOfBirth,style:Theme.of(context).textTheme.headline5);
                    }else if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }
              ),
            ),
            const SizedBox(height: 12.0),
            SizedBox(
              child:FutureBuilder<PersonalInformationData>(
                  future:futurePID,
                  builder:(context,snapshot){
                    if(snapshot.hasData){
                      return Text('Place of birth: '+snapshot.data!.placeOfBirth,style:Theme.of(context).textTheme.headline5);
                    }else if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }
              ),
            ),
            const SizedBox(height: 100.0),








            Text('Own Courses: ' ,style: Theme.of(context).textTheme.headline5,),
            SizedBox(
              child:FutureBuilder<String>(
                  future:futureOwnCourses,
                  builder:(context,snapshot){
                    if(snapshot.hasData){
                      return Text('\n'+snapshot.data!,style:Theme.of(context).textTheme.bodyText2);
                    }else if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }
              ),
            ),

            /*
            LimitedBox(
              maxHeight: double.infinity,
              child: ListView.builder(
                shrinkWrap:true,
                itemCount: OwnCourses.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildRow(context, index);
                },
              ),

            ),
            */
            const SizedBox(height: 12.0),


          ],
        ))
      ],
    );
  }
}
/*
Row buildRow(BuildContext context, int index) {
  return Row(
    children: [
      SizedBox(
          width:300.0,
          height: 30.0,
          child: Text('Course:  '+ OwnCourses[index].name, style: Theme.of(context).textTheme.bodyText2)),
    ],
  );
}

 */

