import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_widgets/navigation_drawer_widget.dart';

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
          foregroundColor: const Color(0xFF131315),
          titleTextStyle: const TextStyle(
            color: Color(0xFF131315),
            fontSize: 18,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xFFF3F5F7),
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: const Color(0xFFF3F5F7),
          elevation: 0,
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

class LessonCard extends StatelessWidget {
  final String header;
  final String description;

  const LessonCard({Key key, this.header, this.description}) : super(key: key);

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 22, top: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '$header',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20, right: 15, top: 10, bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$description',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
