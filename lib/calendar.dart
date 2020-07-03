import 'dart:io';

//import 'package:image_picker/image_picker.dart';
//import 'package:sampleproject/newwidgets.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Calendar extends StatefulWidget {
  @override
  _Calendarstate createState() => _Calendarstate();
}

class _Calendarstate extends State<Calendar> {
  CalendarController _calendarController;
  TextEditingController _eventController;
  Map<DateTime, List<dynamic>> _events;
  File imageFile;
  //String _time = "Not set";

  @override
  void initState() {
    super.initState();
    //final _selectedDay = DateTime.now();
    _calendarController = CalendarController();
    _eventController = TextEditingController();
    _events = {};
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: MyAppBar(title: new Text('Title')),
      body: Center(
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
            Container(
                margin: EdgeInsets.all(10),
                height: 60,
                width: 350,
                child: TextField(
                  enabled: false,
                  maxLines: 2,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.yellow[800],
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Event Title",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                )),
            SizedBox(height: 10.0),
            Container(
                margin: EdgeInsets.all(10),
                height: 100,
                width: 350,
                child: TextField(
                  enabled: false,
                  maxLines: 4,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.yellow[800],
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Transport Information",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                )),
            Container(
              height: 300,
              width: 300,
              child: TableCalendar(
                events: _events,
                initialCalendarFormat: CalendarFormat.month,
                calendarController: _calendarController,
              ),
            ),
            FlatButton(
                onPressed: () {},
                child: Text(
                  'Show DateTime Picker',
                )),
            SizedBox(
                child: FloatingActionButton.extended(
              label: Text('Save'),
              icon: Icon(
                Icons.save,
                color: Colors.redAccent,
                size: 40,
              ),
              backgroundColor: Colors.amberAccent,
              onPressed: () {

              debugPrint(_eventController.text);
              },
            ))
          ]))),
    );
  }

  // _showAddDialog() {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Dialog(
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(20.0)), //this right here
  //           child: Container(
  //             width: MediaQuery.of(context).size.width,
  //             height: MediaQuery.of(context).size.height-200,
  //             child: Padding(
  //               padding: const EdgeInsets.all(12.0),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Container(
  //                     margin: EdgeInsets.all(10),
  //                child: TextField(
  //                     controller: _eventController,
  //                     decoration: InputDecoration(
  //                         filled: true,
  //                         fillColor: Colors.grey[300],
  //                         contentPadding:
  //                             EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
  //                         hintText: "Event Title",
  //                         border: OutlineInputBorder(
  //                             borderRadius: BorderRadius.circular(10.0))),
  //                   )),
  //                   SizedBox(height: 15.0),
  //                   Container(
  //                     margin: EdgeInsets.all(10),
  //                     height: 90,
  //                   child:TextField(
  //                     maxLines: 3,
  //                     decoration: InputDecoration(
  //                         filled: true,
  //                         fillColor: Colors.grey[300],
  //                         contentPadding:
  //                             EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
  //                         hintText: "Transport Information",
  //                         border: OutlineInputBorder(
  //                             borderRadius: BorderRadius.circular(10.0))),
  //                   )),
  //                   SizedBox(height: 15.0),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: <Widget>[
  //                 Padding(padding: const EdgeInsets.all(20.0),
  //                   child: SizedBox(
  //                       child: FloatingActionButton.extended(
  //                         label: Text('Save'),
  //                     icon: Icon(Icons.save,
  //                     color: Colors.redAccent,
  //                     size: 40,),
  //                     backgroundColor: Colors.amberAccent,
  //                     onPressed: (){
  //                        if(_eventController.text.isEmpty) return;
  //                        setState(() {
  //                          if(_events[_calendarController.selectedDay] != null){
  //                          _events[_calendarController.selectedDay].add(_eventController.text);
  //                        }
  //                        else{
  //                          _events[_calendarController.selectedDay] = [_eventController.text];
  //                        }
  //                        _eventController.clear();
  //                        Navigator.pop(context);
  //                        });

  //                     },
  //                   )

  //                       )
  //                 )
  //             ]
  //             )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }
}

// Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => DetailScreen(todo: todos[index]),
//           ),

//   final Todo todo;
//   DetailScreen({Key key, @required this.todo}) : super(key: key);
