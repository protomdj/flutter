import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sampleproject/constant.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final decor = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: Colors.white,
  );

  @override
  Size get preferredSize => Size(double.infinity, 300);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: 190,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colorgrad1, colorgrad2],
          ),
          boxShadow: [BoxShadow(blurRadius: 10, color: colorgrad1)],
        ),
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                   Container(
                  //   height: 35,
                  //   width: 35,
                  //   decoration: decor,
                  //   child: IconButton(
                  //     icon: Icon(MdiIcons.home),
                  //     iconSize: 20,
                  //     color: colorgrad2,
                  //     onPressed: () {
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: (context) => Events()));
                  //     },
                  //   ),
                  // ),
                  // SizedBox(width:10),
                  
                     child:Row(
                      children: [
                        SizedBox(height: 25),
                        Container(
                            height: 60.0,
                            width: 60.0,
                            child: new CircleAvatar(
                              // radius: 100.0,
                              backgroundImage:
                                  AssetImage('assets/images/newsalem.jpg'),
                            )),
                        SizedBox(height: 5),
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
                      ],
                    ),
                  ),
                  // SizedBox(width:10),
                  // Container(
                  //   height: 35,
                  //   width: 35,
                  //   decoration: decor,
                  //   child: IconButton(
                  //     icon: Icon(MdiIcons.account),
                  //     iconSize: 20,
                  //     color: colorgrad2,
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => ImagePage()));
                  //     },
                  //   ),
                  // ),
                ]),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * .65);

    var firstControlPoint = Offset(0, size.height * .75);
    var firstEndPoint = Offset(size.width/6, size.height * .75);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width / 1.2, size.height * .75);

    var secControlPoint = Offset(size.width, size.height * .75);
    var secEndPoint = Offset(size.width, size.height * 0.65);

    path.quadraticBezierTo(
        secControlPoint.dx, secControlPoint.dy, secEndPoint.dx, secEndPoint.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

Widget bottomBar = BottomNavigationBar(
  backgroundColor: colorgrad2,
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(MdiIcons.calendarAccount, color: iconbackground),
        title:
            Text('Events', style: TextStyle(color: textcolor, fontSize: 15))),
    BottomNavigationBarItem(
      icon: Icon(MdiIcons.group, color: iconbackground),
      title:
          Text('Cell Groups', style: TextStyle(color: textcolor, fontSize: 15)),
    ),
    BottomNavigationBarItem(
      icon: Icon(MdiIcons.upload, color: iconbackground),
      title:
          Text('Uploads', style: TextStyle(color: textcolor, fontSize: 15)),
    ),
  ],
);
