import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class SideMenu extends StatefulWidget {
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  @override
  Widget build(BuildContext context) {
    final NBBIndexfinal = Provider.of<NBBIndex>(context,listen:true);
    final currentUsernamefinal = Provider.of<currentUsername>(context,listen:true);
    int _currentIndex = NBBIndexfinal.currentIndex;
    return Container(
      height: double.infinity,
      width: 280.0,
      color: Theme.of(context).primaryColor,
      child: Column(children:[
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/students.png',
                height:55.0,
                filterQuality: FilterQuality.high,
              ),
            ),
            Padding(padding: const EdgeInsets.all(16.0),
              child: Text(
                'Student',
                style: Theme.of(context).textTheme.headline4,

              ),
            )
          ],
        ),
        _SideMenuIconTab(
          iconData: Icons.supervised_user_circle_outlined,
          title: 'Profile',
          onTap: (){
            NBBIndexfinal.changeIndex(0);
          },
        ),
        _SideMenuIconTab(
          iconData: Icons.receipt_long_sharp,
          title: 'Transcript of Record',
          onTap: (){
            NBBIndexfinal.changeIndex(1);
          },
        ),

        _SideMenuIconTab(
          iconData: Icons.print,
          title: 'Print record',
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('PRINT'),
              content: const Text('Print your transcript? '),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    http.Response resp2 = await http.post(Uri.parse("http://localhost:8080/pR"),body:currentUsernamefinal.cur_Username,headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },);

                    Navigator.pop(context, 'OK');
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        ),
        /*
        _SideMenuIconTab(
          iconData: Icons.expand_more,
          title: 'Test',
          onTap: (){
            NBBIndexfinal.changeIndex(2);
          },
        ),

         */

      ],
      ),
    );
  }
}

class _SideMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;
  const _SideMenuIconTab({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          iconData,
          color: Theme.of(context).iconTheme.color,
          size: 28.0,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
          overflow: TextOverflow.ellipsis,
        ),
      onTap: onTap,
      );
  }
}
