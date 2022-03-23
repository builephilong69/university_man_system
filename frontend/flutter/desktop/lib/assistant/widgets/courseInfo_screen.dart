import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/assistant/widgets/listofStudent_Screen.dart';
import 'package:frontend/main.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../students/data.dart';
import '../data/data.dart';


class Assistant_CourseInfo extends StatelessWidget {
  static const routeName = '/assistant/widgets/courseInfo';
  late Future<ListOfCourseData>futureLOCD;
  @override
  Widget build(BuildContext context) {
    final CourseIndex = Provider.of<courseIndex>(context,listen:true);
    int index = CourseIndex.currentIndex;
    final currentUsernamefinal = Provider.of<currentUsername>(context,listen:true);
    futureLOCD = fetchListOfCoursesData(currentUsernamefinal.cur_Username,currentUsernamefinal.cur_Courseid);


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
            Text('Course info',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontSize:50.0),
            ),
            SizedBox(height: 24.0,),
            SizedBox(
              child:FutureBuilder<ListOfCourseData>(
                  future:futureLOCD,
                  builder:(context,snapshot){
                    if(snapshot.hasData){
                      return Text(snapshot.data!.course_name,style:Theme.of(context).textTheme.headline2);
                    }else if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }
              ),
            ),
            SizedBox(height: 24.0,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle:Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 24),
                    elevation: 23.0,
                  ),
                  onPressed: (){
                    Navigator.of(context).pushNamed(LOS_Screen.routeName);
                  },
                  child: const Text('Student list', style: TextStyle(decoration: TextDecoration.underline)),
                ),
              ],
            ),
            SizedBox(height: 24.0,),
            SizedBox(
              child:FutureBuilder<ListOfCourseData>(
                  future:futureLOCD,
                  builder:(context,snapshot){
                    if(snapshot.hasData){
                      return Text("Number of students: "+snapshot.data!.no_student,style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 24));
                    }else if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }
              ),
            ),
            SizedBox(height: 12.0,),
            SizedBox(
              child:FutureBuilder<ListOfCourseData>(
                  future:futureLOCD,
                  builder:(context,snapshot){
                    if(snapshot.hasData){
                      return Text("Minimum grade: "+snapshot.data!.min_grade,style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 24));
                    }else if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }
              ),
            ),
            SizedBox(height: 12.0,),

            SizedBox(
              child:FutureBuilder<ListOfCourseData>(
                  future:futureLOCD,
                  builder:(context,snapshot){
                    if(snapshot.hasData){
                      return Text("Maximum grade: "+snapshot.data!.max_grade,style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 24));
                    }else if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }
              ),
            ),
            SizedBox(height: 12.0,),
            SizedBox(
              child:FutureBuilder<ListOfCourseData>(
                  future:futureLOCD,
                  builder:(context,snapshot){
                    if(snapshot.hasData){
                      return Text("Average grade: "+snapshot.data!.average,style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 24));
                    }else if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }
              ),
            ),
            SizedBox(height: 12.0,),

          ],
        ),
      ),
    );
  }
}
