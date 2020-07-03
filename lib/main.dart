//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sampleproject/Events.dart';
import 'package:sampleproject/customAppBar.dart';
import 'package:sampleproject/home_screen.dart';
import 'package:sampleproject/test.dart';
//import 'package:sampleproject/Events.dart';
//import 'package:sampleproject/clipPage.dart';
//import 'package:sampleproject/calendar.dart';
//import 'package:sampleproject/eventPage.dart';
//import 'package:sampleproject/Account.dart';
//import 'package:sampleproject/salem.dart';
//import 'package:sampleproject/home.page.dart';
//import 'package:sampleproject/login1.dart';

//import 'package:sampleproject/upload.dart';
//import 'package:sampleproject/login_screen.dart';
//import 'package:sampleproject/login_test.dart';
//import 'login_screen.dart';

//import 'package:http/http.dart' as http;
//import 'dart:async';
//import 'dart:convert';

//import 'dart:io';
//import 'dart:convert';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_) => FoldableAppBar()),
      ],


          child: MaterialApp(
        title: 'Salem',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          cursorColor: Colors.blue,
          
          
          primarySwatch: Colors.grey,
        ),
          
          home: 
          
         //Events(),
         // LoginPage(),
        HomeScreen(),
       // Test(),
       
      ),
    );
  }
}




