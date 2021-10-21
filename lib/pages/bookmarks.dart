import 'package:flutter/material.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({Key key}) : super(key: key);

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
      body: SafeArea(
        child: Text('Bookmarks'),
      ),
    );
  }
}
