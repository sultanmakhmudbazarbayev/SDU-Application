import 'package:flutter/material.dart';

import 'bookmarks.dart';
import 'loading.dart';
import 'search.dart';
import 'home.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  List<Widget> _screens = <Widget>[
    Home(),
    Search(),
    Bookmarks(),
    Loading(),
  ];
  int _selectedItem = 0;
  List<String> arrayOfTitles = ['SDU Academy', 'Search', 'Bookmarks'];

  String appBarTItle = '';

  void _onItemTap(int item) {
    setState(() {
      appBarTItle = arrayOfTitles[item];
      _selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTItle),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
        leading: GestureDetector(
          onTap: () {/* Write listener code here */},
          child: Icon(
            Icons.menu, // add custom icons also
          ),
        ),

        centerTitle: true,
        // backgroundColor: Colors.grey,
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
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
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
