import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home/navigation_drawer_widget.dart';
import 'cards/lesson_card.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

const double heightOfContainer = 120;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          elevation: 0,
          foregroundColor: const Color(0xFF131315),
          titleTextStyle: const TextStyle(
            color: Color(0xFF131315),
            fontSize: 18,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white,
            statusBarColor: Color(0xFFF3F5F7),
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: const Color(0xFFF3F5F7),
          title: const Text(
            "SDU Academy",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color(0xFFF3F5F7),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: const [
              LessonCard(header: 'Linear Algebra'),
              LessonCard(header: 'Calculus'),
              LessonCard(header: 'Physics'),
              LessonCard(header: 'Astronomy'),
              LessonCard(header: 'Programming'),
              LessonCard(header: 'Geology'),
            ],
          ),
        ),
      ),
    );
  }
}
