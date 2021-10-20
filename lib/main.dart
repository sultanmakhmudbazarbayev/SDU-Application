import 'package:flutter/material.dart';

import 'pages/bookmarks.dart';
import 'pages/loading.dart';
import 'pages/search.dart';
import 'pages/home.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/bookmarks': (context) => Bookmarks(),
        '/search': (context) => Search(),
      },
    ));
