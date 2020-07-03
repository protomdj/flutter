import 'package:flutter/material.dart';
import 'package:sampleproject/customAppBar.dart';
import 'package:sampleproject/drawers.dart';

class Test extends StatefulWidget {
  // name({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBarr(),
        drawer: drawers,
        body: 
       

        Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40.0))),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height >= 775.0
                ? MediaQuery.of(context).size.height
                : 775.0,
            padding: EdgeInsets.all(20),
            child: Text('Check IT'))
     
    );
  }
}
