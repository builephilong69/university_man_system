import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/lecturers/widgets/getStudentTranscript_screen.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../students/widgets/transcript_screen.dart';


class SearchRecordScreen extends StatelessWidget {

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUsernamefinal = Provider.of<currentUsername>(context,listen:true);
    return Row(
      children: [
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Search record',
              style: Theme.of(context)
                  .textTheme
                  .overline!
                  .copyWith(fontSize:30.0),
            ),
            const SizedBox(height: 20.0,),

            TextField(
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter student UID',
              ),
            ),



            const SizedBox(height: 12.0),
            OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    )
                ),
              ),

              // When the user presses the button, show an alert dialog containing
              // the text that the user has entered into the text field.
              onPressed: ()async {
                currentUsernamefinal.changeStudentTranscriptUID(myController.text);

                final response = await http.post(Uri.parse("http://localhost:8080/sc"),body:myController.text,headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },);
                if(response.body=="notlegit")
                  {
                    showDialog(
                      context: context,
                      builder: (context)  {
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          content: Text('Cannot find the record of '+myController.text),
                        );
                      },
                    );
                  }
                else{
                  Navigator.of(context).pushNamed(GetTranscriptScreen.routeName);
                }
              },
              child: const Text('Print'),
            ),


          ],
        ))
      ],
    );
  }
}
