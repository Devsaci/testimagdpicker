import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      // ignore: prefer_const_constructors
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late File _image;
  final picker = ImagePicker();

  Future getImage(ImageSource src) async {
    final pickedFile = await picker.getImage(source: src);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text("109. Image Picker"),
      ),
      body: Center(
        child: _image == null
            ? const Text('No image selected.')
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: () {
          var ad = AlertDialog(
            title: Text("Chose Picture From "),
            content: Container(
              height: 200,
              child: Column(
                children: [
                  Divider(
                    color: Colors.black,
                    thickness: 3,
                  ),
                  Container(
                    // width: 250,
                    color: Colors.indigo,
                    child: ListTile(
                      leading: Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 40,
                      ),
                      title: Text("Gallery"),
                      onTap: () {
                        getImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    // width: 250,
                    color: Colors.indigo,
                    child: ListTile(
                      leading: Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                        size: 40,
                      ),
                      title: Text("Camera"),
                      onTap: () {
                        getImage(ImageSource.camera);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          );
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return ad;
              });
        },
      ),
    );
  }
}
