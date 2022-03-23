import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchRecordScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

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
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),


            const SizedBox(height: 12.0),


          ],
        ))
      ],
    );
  }
}
