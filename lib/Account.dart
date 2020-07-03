
//import 'dart:io';

//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:sampleproject/mywidgets.dart';
//import 'package:sampleproject/signup.dart';
import 'package:firebase_storage/firebase_storage.dart';


class AccountPage extends StatelessWidget{



  @override

  Widget build(BuildContext context) {
     
     return FutureBuilder(future: getUrlofImage(),
     builder: (context,snapshot){
       if(snapshot.connectionState ==ConnectionState.done){

         return Scaffold(
      
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
        children: <Widget>[
          Container(
          
          child: CircleAvatar(
            radius: 300.0,
          
            backgroundImage: NetworkImage(snapshot.data),
          ),
          )]
          )
        )
      )
    );


       }
       else{
         return CircularProgressIndicator();
       }
     },
     
     );
  }

 Future<String> getUrlofImage() async {

  final ref = FirebaseStorage.instance.ref().child('images/users/qUvDfBIfZXfOaXj8Svmx8pc9JDK2/default.jpg');

  String url = await ref.getDownloadURL();

  return url;
 
}

}
