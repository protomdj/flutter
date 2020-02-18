//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sampleproject/home.page.dart';
import 'package:sampleproject/login_screen.dart';
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
        home: LoginScreen(),

      debugShowCheckedModeBanner: false  
    );
  }
}




