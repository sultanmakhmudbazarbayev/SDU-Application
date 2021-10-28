import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

double heihtOfContainer = 120;

class _HomeState extends State<Home> {
  List<String> _values = [
    'Math',
    'Science',
    'Economics',
    'Art and humanities',
    'Computing'
  ];

  List<String> _descriptions = [
    '\n Your lessons are waiting For you!',
    '\n Your lessons are waiting For you!',
    '\n Your lessons are waiting For you!',
    '\n Your lessons are waiting For you!',
    '\n Your lessons are waiting For you!'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F5F7),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            LessonCard(header: 'Linear Algebra'),
            LessonCard(header: 'Calculus'),
            LessonCard(header: 'Physics'),
            LessonCard(header: 'Physics'),
            LessonCard(header: 'Physics'),
            LessonCard(header: 'Physics'),
            LessonCard(header: 'Physics'),
            LessonCard(header: 'Physics'),
            LessonCard(header: 'Astronomy'),
            LessonCard(header: 'Programming'),
            LessonCard(header: 'Geology'),
          ],
        ),
      ),
    );
  }
}

class LessonCard extends StatelessWidget {
  final String header;

  const LessonCard({Key key, this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 15),
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Colors.white,
        elevation: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, top: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '$header',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
