import 'package:flutter/material.dart';

BottomNavigationBarItem bottomNavigationBarItem(
    String label, double fontSize, IconData icon) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
