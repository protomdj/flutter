import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleproject/constant.dart';

import 'package:sampleproject/customAppBar.dart';

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;

   final _style = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 18,
    color: Colors.white,
    fontStyle: FontStyle.normal,
  );

  CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    final FoldableAppBar bar = Provider.of<FoldableAppBar>(context);

    return Container(
      //color: Colors.white,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [colorgrad1, colorgrad2, colorgrad3],
      )),
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.withAlpha(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text("Events")
                ],
              )),
          ListTile(
            onTap: () {
              debugPrint("Tapped Profile");
            },
            leading: Icon(Icons.person,color:Colors.white),
            title: Text(
              "Cell Groups",style:_style
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped settings");
              bar.closeBar();
              // closeDrawer();
            },
            leading: Icon(Icons.settings,color:Colors.white),
            title: Text("Departments",style:_style),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("About us");
            },
            leading: Icon(Icons.payment,color:Colors.white),
            title: Text("Payments",style:_style),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Notifications");
            },
            leading: Icon(Icons.notifications,color:Colors.white),
            title: Text("Contact us",style:_style),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Log Out");
            },
            leading: Icon(Icons.exit_to_app,color:Colors.white),
            title: Text("Log Out",style:_style),
          ),
        ],
      ),
    );
  }
}
