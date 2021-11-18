import 'package:flutter/material.dart';

class QASDUAcademy extends StatefulWidget {
  const QASDUAcademy({Key key}) : super(key: key);

  @override
  _QASDUAcademyState createState() => _QASDUAcademyState();
}

class _QASDUAcademyState extends State<QASDUAcademy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "QA SDU Academy",
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
