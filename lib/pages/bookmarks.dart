import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/pages/home/navigation_drawer_widget.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({Key key}) : super(key: key);

  @override
  _BookmarksState createState() => _BookmarksState();
}

List<String> favorites = [
  "Machine Learning",
  "Digital Design",
  "Data Analysis",
  "FAANG",
];

class _BookmarksState extends State<Bookmarks> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        foregroundColor: const Color(0xFF131315),
        titleTextStyle: TextStyle(
          color: const Color(0xFF131315),
          fontSize: 18,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: const Color(0xFFFFFFFF),
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: const Color(0xFFF3F5F7),
        elevation: 0,
        title: Text(
          "Bookmarks",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFF3F5F7),
      body: Card(
        elevation: 3,
        margin: EdgeInsets.fromLTRB(16, 13, 16, 0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                favorites[0],
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(
                "Let's Start your course!",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextButton.icon(
                label: Text('Delete course'),
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
