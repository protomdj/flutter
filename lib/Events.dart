import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sampleproject/customAppBar.dart';
import 'package:sampleproject/customdrawer.dart';
import 'package:sampleproject/drawers.dart';

import 'constant.dart';

class Events extends StatefulWidget {
  Events({Key key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  TextEditingController _eventTitle = TextEditingController();
  TextEditingController _transportInformation = TextEditingController();
  String _date;
  String _startTime;
  String _endTime;

  bool dateInitial = true;
  bool startTimeInitial = true;
  bool endTimeInitial = true;

  FSBStatus drawerStatus;


  Widget _textInput(String title, int lines, TextEditingController control) {
    return TextField(
      style: TextStyle(height: 1.5, fontSize: 15, color: Colors.indigo[400]),
      cursorWidth: 3.0,
      controller: control,
      maxLines: lines,
      decoration: InputDecoration(
        filled: true,
        hintText: title,
        hintStyle: TextStyle(
            color: colorgrad2, fontSize: 20, fontWeight: FontWeight.bold),
        fillColor: Colors.white,
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }

  final decor = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(offset: Offset(0, 2), blurRadius: 5, color: Color(0xFF6A1B9A))
      ]);

  final data = CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
    dateTimePickerTextStyle: TextStyle(fontSize: 20, color: Colors.white),
  ));

  @override
  Widget build(BuildContext context) {
    final FoldableAppBar foldableAppBar = Provider.of<FoldableAppBar>(context);

    drawerStatus = foldableAppBar.status;
    
    return Scaffold(
      backgroundColor: kbackgroundcolor,
      appBar: AppBarrrr(),
      drawer: drawers,
      body: FoldableSidebarBuilder(
        drawerBackgroundColor: Colors.white,
        drawer: CustomDrawer(
          closeDrawer: () {
            setState(() {
             drawerStatus = FSBStatus.FSB_CLOSE;
            });
          },         
        ),
        status: drawerStatus,
        screenContents: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height >= 775.0
                ? MediaQuery.of(context).size.height
                : 775.0,
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Container(
                    height: 60,
                    padding: EdgeInsets.only(left: 30.0),
                    decoration: decor,
                    child: _textInput("Title", 1, _eventTitle)),
                SizedBox(height: 30),
                Container(
                    height: 100,
                    padding: EdgeInsets.all(10),
                    decoration: decor,
                    child: _textInput("Transport", 2, _transportInformation)),
                SizedBox(
                  height: 30.0,
                ),
                Row(children: <Widget>[
                  SizedBox(height: 20),
                  Container(
                      decoration: decor,
                      height: 50,
                      width: 180,
                      child: RaisedButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10),
                          ),
                          elevation: 6.0,
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext builder) {
                                  return Container(
                                    height: MediaQuery.of(context)
                                            .copyWith()
                                            .size
                                            .height /
                                        5,
                                    child: CupertinoTheme(
                                      data: data,
                                      child: CupertinoDatePicker(
                                        initialDateTime: DateTime.now(),
                                        backgroundColor: Color(0xFF6A1B9A),
                                        mode: CupertinoDatePickerMode.date,
                                        onDateTimeChanged: (date) {
                                          setState(() {
                                            _date =
                                                '${date.year} : ${date.month} : ${date.day}';
                                            dateInitial = false;
                                          });
                                        },
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Container(
                              child: Row(children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.date_range,
                              size: 25.0,
                              color: Color(0xFFefba07),
                            ),
                            Text(
                              dateInitial ? "Event Date" : _date,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                                color: Color(0xFF6A1B9A),
                                fontStyle: FontStyle.normal,
                              )),
                            ),
                          ])))),
                  SizedBox(width: 30),
                  Column(children: <Widget>[
                    SizedBox(height: 30),
                    Container(
                        decoration: decor,
                        height: 50,
                        width: 160,
                        child: RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              // side: BorderSide(color: Colors.black),
                            ),
                            elevation: 6.0,
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext builder) {
                                    return Container(
                                      height: MediaQuery.of(context)
                                              .copyWith()
                                              .size
                                              .height /
                                          5,
                                      child: CupertinoTheme(
                                        data: data,
                                        child: CupertinoDatePicker(
                                          use24hFormat: true,
                                          initialDateTime:
                                              DateTime(2020, 01, 01),
                                          minuteInterval: 30,
                                          backgroundColor: Color(0xFF6A1B9A),
                                          mode: CupertinoDatePickerMode.time,
                                          onDateTimeChanged: (startTime) {
                                            setState(() {
                                              _startTime =
                                                  '${startTime.hour} : ${startTime.minute}';
                                              startTimeInitial = false;
                                            });
                                          },
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                                child: Row(children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 25.0,
                                color: Color(0xFFefba07),
                              ),
                              Text(
                                startTimeInitial ? "Start Time" : _startTime,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  color: Color(0xFF6A1B9A),
                                  fontStyle: FontStyle.normal,
                                )),
                              ),
                            ])))),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                        decoration: decor,
                        height: 50,
                        width: 160,
                        child: RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              // side: BorderSide(color: Colors.black),
                            ),
                            elevation: 6.0,
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext builder) {
                                    return Container(
                                      height: MediaQuery.of(context)
                                              .copyWith()
                                              .size
                                              .height /
                                          5,
                                      child: CupertinoTheme(
                                        data: data,
                                        child: CupertinoDatePicker(
                                          use24hFormat: true,
                                          initialDateTime:
                                              DateTime(2020, 01, 01),
                                          minuteInterval: 30,
                                          backgroundColor: Color(0xFF6A1B9A),
                                          mode: CupertinoDatePickerMode.time,
                                          onDateTimeChanged: (endTime) {
                                            setState(() {
                                              _endTime =
                                                  '${endTime.hour} : ${endTime.minute}';
                                              endTimeInitial = false;
                                            });
                                          },
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                                child: Row(children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.access_time,
                                size: 25,
                                color: Color(0xFFefba07),
                              ),
                              Text(
                                endTimeInitial ? "End Time" : _endTime,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  color: Color(0xFF6A1B9A),
                                  fontStyle: FontStyle.normal,
                                )),
                              ),
                            ]))))
                  ])
                ]),
                SizedBox(
                  height: 30,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      backgroundColor: kbuttoncolor,
                      onPressed: () {
                        _handleEvent();
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 40,
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      
    );
  }

  Future<void> _handleEvent() async {
    Firestore.instance.collection('events').add(<String, dynamic>{
      'eventTitle': _eventTitle.text,
      'transportInformation': _transportInformation.text,
      'eventDate': _date,
      'startTime': _startTime,
      'endTime': _endTime,
    });
  }
}
