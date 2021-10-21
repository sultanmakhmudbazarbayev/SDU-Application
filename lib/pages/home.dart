import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

double heihtOfContainer = 120;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: heihtOfContainer,
            width: double.maxFinite,
            child: Card(
              child: Text(
                "First lesson",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal,
                ),
              ),
              elevation: 5,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: heihtOfContainer,
            width: double.maxFinite,
            child: Card(
              child: Text(
                "Second lesson",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal,
                ),
              ),
              elevation: 5,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: heihtOfContainer,
            width: double.maxFinite,
            child: Card(
              child: Column(
                children: [
                  Text(
                    "Third lesson",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              elevation: 5,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: heihtOfContainer,
            width: double.maxFinite,
            child: Card(
              child: Text(
                "Fourth lesson",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal,
                ),
              ),
              elevation: 5,
            ),
          ),
        ],
      ),
    );
  }
}
