import 'package:flutter/material.dart';
import 'pages/navigation_bar.dart';
import 'pages/constants.dart' as AppColors;

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          fontFamily: 'Monsterrat',
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColors.ELEMENTS_COLOR,
          ),
        ),
        debugShowCheckedModeBanner: false,
        color: AppColors.MAIN_COLOR,
        home: const NavigationBar(),
      ),
    );
