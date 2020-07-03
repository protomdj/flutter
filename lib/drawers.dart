import 'package:flutter/material.dart';

import 'constant.dart';

final drawers = Drawer(
    child: Container(
  decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: [colorgrad1, colorgrad2, colorgrad3],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight)),
  child: ListView(children: <Widget>[
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
      leading: Icon(Icons.person, color: Colors.white),
      title: Text("Cell Groups"),
    ),
    Divider(
      height: 1,
      color: Colors.grey,
    ),
    ListTile(
      onTap: () {
        debugPrint("Tapped settings");
      },
      leading: Icon(Icons.settings, color: Colors.white),
      title: Text("Departments"),
    ),
    Divider(
      height: 1,
      color: Colors.grey,
    ),
    ListTile(
      onTap: () {
        debugPrint("About us");
      },
      leading: Icon(Icons.payment, color: Colors.white),
      title: Text("Payments"),
    ),
    Divider(
      height: 1,
      color: Colors.grey,
    ),
    ListTile(
      onTap: () {
        debugPrint("Tapped Notifications");
      },
      leading: Icon(Icons.notifications, color: Colors.white),
      title: Text("Contact us"),
    ),
    Divider(
      height: 1,
      color: Colors.grey,
    ),
    ListTile(
      onTap: () {
        debugPrint("Tapped Log Out");
      },
      leading: Icon(Icons.exit_to_app, color: Colors.white),
      title: Text("Log Out"),
    ),
  ]),
));
