import 'package:flutter/material.dart';
import 'pages/navigation_bar.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          fontFamily: 'Monsterrat',
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Color(0xFF131315),
          ),
        ),
        debugShowCheckedModeBanner: false,
        color: Color(0xFFF3F5F7),
        home: NavigationBar(),
      ),
    );
