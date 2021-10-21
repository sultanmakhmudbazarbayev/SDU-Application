import 'package:flutter/material.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({Key? key}) : super(key: key);

  @override
  _BookmarksState createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  @override
  void initState() {
    super.initState();
    // Implement here!
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Text(
        "Here will be your Bookmarks!",
        style: TextStyle(
          fontSize: 20.0,
          fontStyle: FontStyle.normal,
          color: Colors.grey,
        ),
      ),
    ));
  }
}
