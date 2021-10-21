import 'package:flutter/material.dart';

import 'bookmarks.dart';
import 'loading.dart';
import 'search.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  List<Widget> _screens = <Widget>[
    Loading(),
    Search(),
    Bookmarks(),
  ];
  int _selectedItem = 0;

  void _onItemTap(int item) {
    setState(() {
      _selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SDU Academy'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: _screens.elementAt(_selectedItem),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Bookmarks'),
          ),
        ],
        currentIndex: _selectedItem,
        onTap: _onItemTap,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: 25,
      ),
    );
  }
}
