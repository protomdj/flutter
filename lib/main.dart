import 'package:flutter/material.dart';
import 'login_screen.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>{

Future<List<User>> _getUsers() async {
  var data = await http.get("http://www.json-generator.com/api/json/get/ckQkmZXIwO?indent=2");
  var jsonData = json.decode(data.body);
  List<User> users = [];

  for(var u in jsonData){
    User user = User(u["index"],u["about"],u["name"],u["email"],u["phone"],u["address"],u["longitude"],u["latitude"]);
    user.add(user);
      }
      return users;
    }
    
    
    
    
      @override
      Widget build(BuildContext context) {
        
        return new Scaffold(appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: Container(
          child: FutureBuilder(
            future: _getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.data == null){
                return Container(
                  child: Center(
                    child: Text("Loading...")
                  )
                );
              }
              else{
              
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context,int index){
                  
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        snapshot.data[index].picture
                      ),
                    ),
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(snapshot.data[index].email),
                    onTap: (){
                      Navigator.push(context, 
                      new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index])));
                    },
                  );
                }
                );
            }
            },
          ),
        ),
        
        );
      }
    }

  class DetailPage extends StatelessWidget{
      final User user;

      DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
    )
    );
  }
      
    }
    
    class User{
      final int index;
      final String about;
      final String name;
      final String email;
      final String phone;
      final String address;
      final String longitude;
      final String latitude;
      User(this.index,this.about,this.name,this.email,this.phone,this.address,this.longitude,this.latitude);
    
      void add(User user) {}
}


