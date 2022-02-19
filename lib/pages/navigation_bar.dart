import 'package:flutter/material.dart';

import 'home/navigation_drawer_widget.dart';
import 'navigation/bottom_navigation_bar.dart';

import 'bookmarks.dart';
import 'search.dart';
import 'home.dart';

class NavigationBar1 extends StatefulWidget {
  const NavigationBar1({Key key}) : super(key: key);

  @override
  _NavigationBar1State createState() => _NavigationBar1State();
}

class _NavigationBar1State extends State<NavigationBar1> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _screens = <Widget>[
    const Home(),
    const Search(),
    const Bookmarks(),
  ];

  final List<String> _arrayOfTitles = ['Study', 'Search', 'Bookmarks'];
  String _appBarTitle = 'Study';

  final PageController _pageController = PageController();
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        key: _scaffoldKey,
        body: PageView(
          physics: const BouncingScrollPhysics(),
          controller: _pageController,
          children: _screens,
          onPageChanged: (page) {
            setState(() {
              _selectedItem = page;
              _appBarTitle = _arrayOfTitles[page];
            });
          },
        ),
        bottomNavigationBar: BottomNavBar(
          selectedItem: _selectedItem,
          appBarTitle: _appBarTitle,
          arrayOfTitles: _arrayOfTitles,
          pageController: _pageController,
        ),
      ),
    );
  }
}
