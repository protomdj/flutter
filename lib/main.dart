//import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:sampleproject/home.page.dart';
import 'package:sampleproject/login1.dart';
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
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(

        primarySwatch: Colors.grey,
      ),

        home: LoginScreen1(),

      
    );
  }
}




