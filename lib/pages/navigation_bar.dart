import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bookmarks.dart';
import 'home_widgets/NavigationDrawerWidget.dart';
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

  int _selectedItem = 0;
  List<String> arrayOfTitles = ['Study', 'Search', 'Bookmarks'];

  String appBarTitle = 'Study';

  PageController _pageController = PageController();

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
        key: _scaffoldKey,
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          foregroundColor: const Color(0xFF131315),
          titleTextStyle: TextStyle(
            color: const Color(0xFF131315),
            fontSize: 18,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: const Color(0xFFF3F5F7), // Status bar
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: const Color(0xFFF3F5F7),
          elevation: 0,
          title: Text(
            appBarTitle,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: <Widget>[],
          leading: new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          ),
          centerTitle: true,
        ),
        body: PageView(
          physics: BouncingScrollPhysics(),
          controller: _pageController,
          children: _screens,
          onPageChanged: (page) {
            setState(() {
              _selectedItem = page;
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
