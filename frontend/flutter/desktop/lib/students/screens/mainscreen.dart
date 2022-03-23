import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/signup_login/login_screen.dart';
import 'package:frontend/students/widgets/test_screen.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../data.dart';
import '../widgets/transcript_screen.dart';
import '../widgets/widgets.dart';



class MainScreen extends StatefulWidget {

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ScrollController? _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController?.dispose();
    super.dispose();
  }
List<Widget> _screenchild  = [
  PersonalInformation_Screen(),
  TranscriptScreen(),
  TestScreen(),

];

  @override
  Widget build(BuildContext context) {
    final NBBIndexfinal = Provider.of<NBBIndex>(context,listen:true);
    int _currentIndex = NBBIndexfinal.currentIndex;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          TextButton.icon(
              style: TextButton.styleFrom(
                primary: Theme.of(context).iconTheme.color,

              ),
              onPressed:  () {},
              icon:  const Icon(
                Icons.account_circle_outlined,
                size: 30.0,
              ),
            label: const Text('User'),
          ),
          const SizedBox(width: 8.0),
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
          const SizedBox(width: 20.0),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors:[
              const Color(0x8167F6),
              Theme.of(context).backgroundColor,
            ],
            stops: [0, 0.5],
          ),
        ),
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(
                horizontal:20.0,
                vertical: 60.0 ),
            children: [
             _screenchild[_currentIndex],
            ],
          ),
        ),
      ),
    );
  }
  void choiceAction(String choice){
    if(choice == Constants.Settings){
      print('Settings');
    } else if(choice == Constants.SignOut){

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>LoginScreen()), (route) => false);
    }
  }
}
class Constants{
  static const String Settings = 'Settings';
  static const String SignOut = 'Sign out';

  static const List<String> choices = <String>[
    Settings,
    SignOut
  ];
}

