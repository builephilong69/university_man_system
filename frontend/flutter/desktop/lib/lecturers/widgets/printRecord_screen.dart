import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Define a custom Form widget.
class PrintRecordScreen extends StatefulWidget {
  const PrintRecordScreen({Key? key}) : super(key: key);

  @override
  _PrintRecordScreenState createState() => _PrintRecordScreenState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _PrintRecordScreenState extends State<PrintRecordScreen> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Print record',
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
                  http.Response resp2 = await http.post(Uri.parse("http://localhost:8080/pR"),body:myController.text,headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },);
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