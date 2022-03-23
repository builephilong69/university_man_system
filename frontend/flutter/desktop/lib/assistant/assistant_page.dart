import 'package:flutter/material.dart';


import '../main.dart';
import '../assistant/screens/mainscreen.dart';
import '../assistant/widgets/side_menu.dart';

class AssistantPage extends StatefulWidget {
  static const routeName = '/assistantpage';

  @override
  State<AssistantPage> createState() => _AssistantPageState();
}

class _AssistantPageState extends State<AssistantPage> {


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

