// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/pages/home/navigation_drawer_widget.dart';
import 'constants.dart' as AppColors;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        foregroundColor: AppColors.ELEMENTS_COLOR,
        titleTextStyle: const TextStyle(
          color: AppColors.ELEMENTS_COLOR,
          fontSize: 18,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.ELEMENTS_COLOR,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: AppColors.MAIN_COLOR,
        elevation: 0,
        title: const Text(
          "Bookmarks",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.MAIN_COLOR,
      body: Card(
        elevation: 3,
        margin: const EdgeInsets.fromLTRB(16, 13, 16, 0),
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
              const SizedBox(
                height: 6.0,
              ),
              Text(
                "Let's Start your course!",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextButton.icon(
                label: const Text('Delete course'),
                icon: const Icon(Icons.delete),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
