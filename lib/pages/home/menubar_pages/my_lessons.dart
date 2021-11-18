import 'package:flutter/material.dart';

class MyLessons extends StatefulWidget {
  const MyLessons({Key key}) : super(key: key);

  @override
  _MyLessonsState createState() => _MyLessonsState();
}

class _MyLessonsState extends State<MyLessons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My Lessons",
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Center(child: Text("In Process")),
      ),
    );
  }
}
