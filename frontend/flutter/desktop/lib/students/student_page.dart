import 'package:flutter/material.dart';
import 'package:frontend/students/screens/mainscreen.dart';
import 'package:frontend/students/widgets/side_menu.dart';
import 'package:frontend/students/widgets/transcript_screen.dart';
import 'package:provider/provider.dart';
import 'package:frontend/students/widgets/widgets.dart';

import '../main.dart';
import 'data.dart';
class StudentPage extends StatefulWidget {
  static const routeName = '/studentpage';

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {


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

