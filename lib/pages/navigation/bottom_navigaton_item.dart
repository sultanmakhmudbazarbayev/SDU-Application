import 'package:flutter/material.dart';

BottomNavigationBarItem bottomNavigationBarItem(String label, double fontSize) {
  return BottomNavigationBarItem(
    icon: Icon(Icons.bookmark),
    title: Text(
      '$label',
      style: TextStyle(
        fontSize: fontSize,
      ),
    ),
  );
}
