import 'package:flutter/material.dart';

import 'pages/bookmarks.dart';
import 'pages/loading.dart';
import 'pages/search.dart';
import 'pages/home.dart';

void main() => runApp(MaterialApp(
      routes: {
        '/': (context) => Loading(),
      },
    ));
