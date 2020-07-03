//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

//import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sampleproject/clipPage.dart';
import 'package:sampleproject/constant.dart';

//import 'package:sampleproject/signup.dart';

class ImagePage extends StatefulWidget {
  final String title = 'Upload page';
  @override
  _ImagePageState createState() => _ImagePageState();
}

enum AppState {
  free,
  picked,
  cropped,
}

class _ImagePageState extends State<ImagePage> {
  AppState state;
  File imageFile;
  TextEditingController _fileName = TextEditingController();

  @override
  void initState() {
    super.initState();
    state = AppState.free;
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbackgroundcolor,
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
                  child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height >= 775.0
                  ? MediaQuery.of(context).size.height
                  : 775.0,
              padding: EdgeInsets.all(10),
              child: Column(children: <Widget>[
                Container(
                    height: 60,
                    width: 350,
                    padding: EdgeInsets.all(10),
                    decoration: decor,
                    child: _textInput("File Name", 1, _fileName)),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _pickImage();
                    });
                  },
                  child: Container(
                    height: 350,
                    width: 350,
                    decoration: decor,
                    child: Center(
                        child: imageFile != null
                            ? Image.file(imageFile)
                            : const Text(
                                'Tap here to add image',
                                style: TextStyle(
                                  // fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  color: Color(0xFF6A1B9A),
                                  fontStyle: FontStyle.normal,
                                ),
                              )),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton.extended(
                    backgroundColor: Color(0xFF6A1B9A),
                    label: Text('Save', style: TextStyle(color: textcolor)),
                    onPressed: () {
                      _save();
                    },
                    icon: _buildButtonIcon(),
                  ),
                ),
              ])),
        ),
        bottomNavigationBar: bottomBar);
  }

  Widget _buildButtonIcon() {
    if (state == AppState.free)
      return Icon(
        MdiIcons.contentSave,
        color: iconbackground,
      );
    else if (state == AppState.picked)
      return Icon(Icons.thumb_up, color: Colors.white);
    else if (state == AppState.cropped)
      return Icon(Icons.clear, color: Colors.white);
    else
      return Container();
  }

  Future<Null> _pickImage() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        state = AppState.picked;
      });
    }
  }

  // void _clearImage() {
  //   imageFile = null;
  //   setState(() {
  //     state = AppState.free;
  //   });
  // }

  void _save() {
    String name = _fileName.text;
    StorageReference storageReference = FirebaseStorage()
        .ref()
        .child('images/users/qUvDfBIfZXfOaXj8Svmx8pc9JDK2/$name.jpg');

    storageReference.putFile(
        imageFile, StorageMetadata(contentType: 'image/jpeg'));

    // Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()),
    //);
  }
}
