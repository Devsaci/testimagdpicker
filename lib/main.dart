import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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

  getImage() async{

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("109. Image Picker"),
      ),
      body: const Center(
        child: Text("No Image selected"),
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