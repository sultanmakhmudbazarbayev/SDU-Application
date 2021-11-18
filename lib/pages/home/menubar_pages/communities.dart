import 'package:flutter/material.dart';

class Communities extends StatefulWidget {
  const Communities({Key key}) : super(key: key);

  @override
  _QASDUAcademyState createState() => _QASDUAcademyState();
}

class _QASDUAcademyState extends State<Communities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Communities",
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
