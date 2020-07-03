import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sampleproject/constant.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final decor = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: Colors.white,
  );

  @override
  Size get preferredSize => Size(double.infinity, 300);

  final decoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [colorgrad1, colorgrad2],
    ),
    boxShadow: [BoxShadow(blurRadius: 10, color: colorgrad1)],
  );

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: 170,
        width: double.infinity,
        decoration: decoration,
        child: Column(
          children: <Widget>[
            SizedBox(height: 35),
            Row(children: <Widget>[
              SizedBox(width: 20),
              Container(
                  height: 80.0,
                  width: 80.0,
                  child: new CircleAvatar(
                    backgroundImage: AssetImage('assets/images/newsalem.jpg'),
                  )),
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
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * .65);

    var firstControlPoint = Offset(0, size.height * .75);
    var firstEndPoint = Offset(size.width / 6, size.height * .75);

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
      title: Text('Uploads', style: TextStyle(color: textcolor, fontSize: 15)),
    ),
  ],
);

Widget newAppBar = PreferredSize(
  preferredSize: Size.fromHeight(90),
  child: ClipRRect(
    clipBehavior: Clip.antiAlias,
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0.0)),
    child: AppBar(
      iconTheme: new IconThemeData(color: Colors.white, size: 10),
      flexibleSpace: Container(
        height: 170,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colorgrad1, colorgrad2, colorgrad3],
          ),
          boxShadow: [BoxShadow(blurRadius: 10, color: colorgrad1)],
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 35),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //MenuButton(),
                  //SizedBox(width: 40),
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
                  //SizedBox(width: 20),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/salem1.jpg'),
                  ),
                ]),
          ],
        ),
      ),
    ),
  ),
);

class MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FoldableAppBar bar = Provider.of<FoldableAppBar>(context);
    return Container(
        child: IconButton(
            icon: Icon(MdiIcons.menu, color: Colors.white),
            iconSize: 40,
            onPressed: () {
              bar.openBar();
            }));
  }
}

class FoldableAppBar with ChangeNotifier {
  FoldableAppBar();

  FSBStatus status;

  void openBar() {
    status = FSBStatus.FSB_OPEN;
    notifyListeners();
  }

  void closeBar() {
    status = FSBStatus.FSB_CLOSE;
    notifyListeners();
  }
}

class AppBarrrr extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size(double.infinity, 150);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20.0)),
      child: AppBar(
        iconTheme: new IconThemeData(color: Colors.white, size: 10),
        leading: Container(
            child: Row(children: <Widget>[
          SizedBox(width: 10),
          CircleAvatar(
            child: IconButton(
              icon: Icon(Icons.menu),
              iconSize: 25,
              color: Colors.black,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ])),
        flexibleSpace: Container(
            child: Stack(children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            //fit: BoxFit.fitHeight,
            child: Image(
              image: AssetImage('assets/images/church.jpg'),
              fit: BoxFit.fill,
            ),
            // SizedBox(
            //   height: 130,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(5.0))),
              child: Center(
                  child: RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                          text: 'Salem Europe',
                          style: GoogleFonts.tinos(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 35,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                          ))))),
            ),
          )
        ])),
      ),
    );
  }
}

class AppBar2 extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          backgroundColor: Colors.indigo[700],
          leading: CircleAvatar(
            child: IconButton(
              icon: Icon(Icons.menu),
              iconSize: 35,
              color: Colors.black,
              onPressed: () {},
            ),
          ),
          flexibleSpace: Container(
              child: Stack(children: <Widget>[
            FittedBox(
                fit: BoxFit.fitHeight,
                child: Image(image: AssetImage('assets/images/shot.jpg'))),
            // SizedBox(
            //   height: 130,
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0))),
                child: Center(
                    child: RichText(
                        textAlign: TextAlign.right,
                        text: TextSpan(
                            text: 'Salem Europe',
                            style: GoogleFonts.dancingScript(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 35,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                            ))))),
              ),
            )
          ])),
          expandedHeight: 300.0,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(400);
}

class AppBarr extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size(double.infinity, 80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[700],
      iconTheme: new IconThemeData(color: Colors.white, size: 10),
      leading: Container(
          child: Row(children: <Widget>[
        SizedBox(width: 10),
        SizedBox(
          height: 40,
          width: 40,
          child: IconButton(
            icon:
                SvgPicture.asset("assets/icons/menu.svg", color: Colors.white),
            color: Colors.white,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ])),
      flexibleSpace: Container(
        width: MediaQuery.of(context).size.width,
        child: Image(image: AssetImage('assets/images/salemlogo.png')),
        color: Colors.transparent,
      ),
    );
  }
}

class AppBarrr extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size(double.infinity, 80);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
        color: Colors.blueGrey[700],
        child: Row(
          children: <Widget>[
          SizedBox(width: 20),
          SizedBox(
            height: 40,
            width: 40,
            child: IconButton(
              icon: SvgPicture.asset("assets/icons/menu.svg",
                  color: Colors.white),
              color: Colors.white,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          SizedBox(width: 100),
          Container(
            child: Image(image: AssetImage('assets/images/salemlogo.png')),
          ),
        ]));
  }
}

class TitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      // width: 250,
      decoration: BoxDecoration(
          color: Colors.blueGrey[700], border: Border(top: BorderSide.none)),
      child: Center(
          child: RichText(
              textAlign: TextAlign.right,
              text: TextSpan(
                  text: 'Salem Europe',
                  style: GoogleFonts.tinos(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 35,
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                  ))))),
    );
  }
}
