import 'dart:convert';
import 'package:frontend/assistant/assistant_page.dart';
import 'package:frontend/lecturers/lecturer_page.dart';
import 'package:frontend/main.dart';
import 'package:frontend/students/student_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final currentUsernamefinal = Provider.of<currentUsername>(context,listen:true);
    final NBBIndexfinal = Provider.of<NBBIndex>(context,listen:true);
    return Scaffold(
      appBar: AppBar(
        // title: Text('Login'),
        elevation: 0,

      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        color: Color(0x1880EA),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'assets/login_signup/user.png',
              height: 300,
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              controller: usernameController,
              style: TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Username',
                contentPadding: const EdgeInsets.all(15),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              style: TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Password',
                contentPadding: const EdgeInsets.all(15),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    )
                ),
              ),
              onPressed: ()async {
                NBBIndexfinal.changeIndex(0);
                Map<String,dynamic> lmap = {"username": usernameController.text, "password": passwordController.text};
                String json = jsonEncode(lmap);
                http.Response resp = await http.post(Uri.parse("http://localhost:8080/login"),body:json,headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },);
                String nghe =  resp.body;


                
                if(nghe == "student")
                  {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>StudentPage()), (route) => false);
                  }
                else if(nghe =="lecturer")
                  {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>LecturerPage()), (route) => false);
                  }
                else if(nghe =="assistant")
                {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>AssistantPage()), (route) => false);
                }
                else{
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text the that user has entered by using the
                        // TextEditingController.
                        content: Text('Wrong username or password'),
                      );
                    },
                  );
                }
                if(nghe!="notMatched")
                  {
                    currentUsernamefinal.changeUName(usernameController.text);


                  }
                http.Response resp2 = await http.post(Uri.parse("http://localhost:8080/pi"),body:currentUsernamefinal.cur_Username,headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },);
                print(resp2.body);


                
                


              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}