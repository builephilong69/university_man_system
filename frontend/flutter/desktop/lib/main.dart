import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/assistant/widgets/courseInfo_screen.dart';
import 'package:frontend/assistant/widgets/listofStudent_Screen.dart';
import 'package:frontend/lecturers/widgets/courseInfo_screen.dart';
import 'package:frontend/lecturers/widgets/getStudentTranscript_screen.dart';
import 'package:frontend/signup_login/login_screen.dart';
import 'package:frontend/signup_login/signup_screen.dart';
import 'package:frontend/students/student_page.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:frontend/students/widgets/transcript_screen.dart';
import 'package:provider/provider.dart';

import 'assistant/assistant_page.dart';
import 'lecturers/lecturer_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
    await DesktopWindow.setMinWindowSize(const Size(600, 800));
  }
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<NBBIndex>(create: (_)=>NBBIndex()),
      ChangeNotifierProvider<courseIndex>(create: (_)=>courseIndex()),
      ChangeNotifierProvider<currentUsername>(create: (_)=>currentUsername()),
      ChangeNotifierProvider<currentPID>(create: (_)=>currentPID()),
    ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,

      theme: ThemeData(

        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: const Color(0xFF121212),
        backgroundColor: const Color(0xFF121212),
        primaryColor: Colors.black,
        accentColor: const Color(0xFF1DB954),
        iconTheme: const IconThemeData().copyWith(color: Colors.white),
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline2: const TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            fontSize: 12.0,
            color: Colors.grey[300],
            fontWeight: FontWeight.w500,
            letterSpacing: 2.0,
          ),
          bodyText1: TextStyle(
            color: Colors.grey[300],
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),
          bodyText2: TextStyle(
            color: Colors.grey[300],
            letterSpacing: 1.0,
          ),
        ),
      ),


      //home: MyHomePage(title: 'Flutter Demo Home Page'),
        initialRoute:  LoginScreen.routeName,

        routes: {
        LoginScreen.routeName:(_)=> LoginScreen(),
          StudentPage.routeName: (_) =>StudentPage(),
          LecturerPage.routeName: (_) =>LecturerPage(),
          CourseInfo.routeName: (_) =>CourseInfo(),
          AssistantPage.routeName: (_) => AssistantPage(),
          Assistant_CourseInfo.routeName: (_) => Assistant_CourseInfo(),
          LOS_Screen.routeName: (_) => LOS_Screen(),
          GetTranscriptScreen.routeName:(_)=> GetTranscriptScreen(),
      }
    );
  }
}
class NBBIndex with ChangeNotifier{
  int currentIndex = 0;

  void changeIndex(int newIndex)
  {
    currentIndex = newIndex;
    notifyListeners();
  }
}
class courseIndex with ChangeNotifier{
  int currentIndex = 0;
  void changeIndex(int newIndex){
    currentIndex = newIndex;
    notifyListeners();
  }
}
class currentUsername with ChangeNotifier{
  String cur_Username ="none";
  String cur_Courseid="";
  String cur_CourseName="";
  String cur_StudentTranscriptUID="";
  void changeUName(String newUN)
  {
    cur_Username = newUN;
    notifyListeners();
  }
  void changeCID(String newCID)
  {
    this.cur_Courseid=newCID;
    notifyListeners();
  }
  void changeCourseName(String newCourseName)
  {
    this.cur_CourseName = newCourseName;
    notifyListeners();
  }
  void changeStudentTranscriptUID(String newUID)
  {
    this.cur_StudentTranscriptUID = newUID;
    notifyListeners();
  }
}

//class of personal information data ansync
class currentPID with ChangeNotifier{
  String cur_FullName = "null";
  String cur_role = "null";
  String cur_DOB = "null";
  String cur_POB = "null";
  String cur_SSN = "null";
  void Update(String full_name, String role, String dateOfBirth, String placeOfBirth, String ssn)
  {
    this.cur_FullName = full_name;
    this.cur_role= role;
    this.cur_DOB = dateOfBirth;
    this.cur_POB = placeOfBirth;
    this.cur_SSN = ssn;
    notifyListeners();
  }
}

