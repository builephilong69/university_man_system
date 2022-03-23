import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/general_data.dart';

import 'package:frontend/students/data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../main.dart';
class PersonalInformation_Screen extends StatelessWidget {
  late Future<PersonalInformationData> futurePID;

  @override
  Widget build(BuildContext context) {
    final currentUsernamefinal = Provider.of<currentUsername>(context,listen:true);
    futurePID = fetchPIData(currentUsernamefinal.cur_Username);
    //final profile = student1PersonalInfo;
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

          ],
        ))
      ],
    );
  }
}
