import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sampleproject/constant.dart';

class TopBar extends StatefulWidget{
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container
    (child:PreferredSize(
                  preferredSize: Size.fromHeight(100),
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80.0),
                        bottomRight: Radius.circular(0.0)),
                    child: AppBar(
                      
                      flexibleSpace: Container(

height: 170,
        width: double.infinity,
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: [colorgrad1, colorgrad2],
          ),
          boxShadow: [BoxShadow(blurRadius: 10, color: colorgrad1)],
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height:35),
            Row(
                children: <Widget>[
                  SizedBox(width: 30),
                   Container(
                     
                       height: 80.0,
                       width: 80.0,
                       child: new CircleAvatar(
                         backgroundImage:
                             AssetImage('assets/images/newsalem.jpg'),                           
                       )
                       ),
                   SizedBox(width: 20),
                   RichText(
                       textAlign: TextAlign.right,
                       text: TextSpan(
                           text: 'Salem Europe',
                           style: GoogleFonts.pTSans(
                               textStyle: TextStyle(
                                 letterSpacing: 2,
                             fontWeight: FontWeight.w900,
                             fontSize: 25,
                             color: textcolor,
                             fontStyle: FontStyle.normal,
                           )))),
             
                ]),
          ],
        ),

                      ),
                     // centerTitle: true,
                      //title: Text('Salem'),
                    ),
                  ),
                )
      
    );
  }
}