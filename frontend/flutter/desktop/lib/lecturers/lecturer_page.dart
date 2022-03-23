import 'package:flutter/material.dart';


import '../main.dart';
import '../lecturers/screens/mainscreen.dart';
import '../lecturers/widgets/side_menu.dart';

class LecturerPage extends StatefulWidget {
  static const routeName = '/lecturerpage';

  @override
  State<LecturerPage> createState() => _LecturerPageState();
}

class _LecturerPageState extends State<LecturerPage> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body:Column(
        children: [
          Expanded(child: Row(
            children: [
              SideMenu(),
              //MainScreen(profile: studentPersonalInfo),

              Expanded(
                child: //MainScreen(profile: studentPersonalInfo)
                MainScreen(),
              )
            ],
          ),
          ),
        ],

      ),

    );
  }
}

