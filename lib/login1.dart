import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sampleproject/register.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen1 extends StatefulWidget {
  @override
  _LoginScreen1State createState() => new _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1>
    with TickerProviderStateMixin {
  final Color primaryColor = Color(0xFFee4c7c);
  final Color backgroundColor = Colors.white;
  final Color highlightColor = Color(0xffEDF5E1);
  final AssetImage backgroundImage = new AssetImage("assets/images/logo.png");


  //final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;


  String username = "";
  String password = "";

  //@override
  Widget build(BuildContext context) {
    return new Scaffold(
       
        resizeToAvoidBottomPadding: false,
        
        body: Container(
          padding: new EdgeInsets.all(30.0),
                  
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            //color: this.backgroundColor,
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
              //fit: BoxFit.fitHeight,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop),
            ),
          ),
          child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 100.0, bottom: 70.0),
                child: Center(
                  child: new Column(
                    children: <Widget>[
                      Container(
                        height: 140.0,
                        width: 140.0,
                        child: new CircleAvatar(
                          radius: 100.0,
                          backgroundImage: AssetImage('assets/images/logo.png'),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1.0,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Text(
                  "Email",
                  style: TextStyle(
                      color: this.primaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Row(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      height: 30.0,
                      width: 1.0,
                      color: Colors.grey.withOpacity(0.5),
                      margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                    ),
                    new Expanded(
                      child: TextField(
                        onChanged: (val) {
                          setState(() => username = val);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.only(bottom: 15.0)),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Text(
                  "Password",
                  style: TextStyle(
                      color: this.primaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Row(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      child: Icon(
                        Icons.lock_open,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      height: 30.0,
                      width: 1.0,
                      color: Colors.grey.withOpacity(0.5),
                      margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                    ),
                    new Expanded(
                      child: TextField(
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.only(bottom: 15.0)),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        splashColor: this.primaryColor,
                        color: this.primaryColor,
                        child: new Row(
                          children: <Widget>[
                            new Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                "LOGIN",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            new Expanded(
                              child: Container(),
                            ),
                            new Transform.translate(
                              offset: Offset(15.0, 0.0),
                              child: new Container(
                                padding: const EdgeInsets.all(5.0),
                                child: FlatButton(
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(28.0)),
                                  splashColor: Colors.white,
                                  color: Colors.white,
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: this.primaryColor,
                                  ),
                                  onPressed: () async {
                                    _handleSignIn();
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        onPressed: () => {},
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        splashColor: Color(0xFF3B5998),
                        color: Color(0xff3B5998),
                        child: new Row(
                          children: <Widget>[
                            new Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                "LOGIN WITH FACEBOOK",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            new Expanded(
                              child: Container(),
                            ),
                            new Transform.translate(
                              offset: Offset(15.0, 0.0),
                              child: new Container(
                                padding: const EdgeInsets.all(5.0),
                                child: FlatButton(
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(28.0)),
                                  splashColor: Colors.white,
                                  color: Colors.white,
                                  child: Icon(
                                    MdiIcons.facebook,
                                    color: Colors.blueAccent,
                                  ),
                                  onPressed: () => {},
                                ),
                              ),
                            )
                          ],
                        ),
                        onPressed: () => {},
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.transparent,
                        child: Container(
                          padding: const EdgeInsets.only(left: 20.0),
                          alignment: Alignment.center,
                          child: Text(
                            "DON'T HAVE AN ACCOUNT?",
                            style: TextStyle(color: this.primaryColor),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
        )
        );
  }

  Future<FirebaseUser> _handleSignIn() async {
  //final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  //final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // final AuthCredential credential = GoogleAuthProvider.getCredential(
  //   accessToken: googleAuth.accessToken,
  //   idToken: googleAuth.idToken,
  // );

  final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
    email: username,password: password)).user;
  //print("signed in " + user.displayName);
  print("signed in " + user.uid);
  return user;

}


}

