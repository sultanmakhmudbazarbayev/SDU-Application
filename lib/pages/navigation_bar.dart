import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_widgets/navigation_drawer_widget.dart';
import 'bookmarks.dart';
import 'loading.dart';
import 'search.dart';
import 'home.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Widget> _screens = <Widget>[
    Home(),
    Search(),
    Bookmarks(),
  ];

  List<String> arrayOfTitles = ['Study', 'Search', 'Bookmarks'];
  String appBarTitle = 'Study';

  PageController _pageController = PageController();

  int _selectedItem = 0;

  void _onItemTap(int item) {
    setState(() {
      appBarTitle = arrayOfTitles[item];
      _selectedItem = item;
      if (_pageController.hasClients) {
        _pageController.animateToPage(item,
            duration: Duration(milliseconds: 900),
            curve: Curves.easeInOutCubicEmphasized);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        key: _scaffoldKey,
        body: PageView(
          physics: BouncingScrollPhysics(),
          controller: _pageController,
          children: _screens,
          onPageChanged: (page) {
            setState(() {
              _selectedItem = page;
              appBarTitle = arrayOfTitles[page];
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text(
                'Search',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              title: Text(
                'Bookmarks',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ],
          currentIndex: _selectedItem,
          onTap: _onItemTap,
          iconSize: 25,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          backgroundColor: const Color(0xFFFFFFFF),
          selectedItemColor: Color(0xFF131315),
        ),
      ),
    );
  }
}
