import 'package:flutter/material.dart';
import 'package:project/pages/navigation/bottom_navigaton_item.dart';

class BottomNavBar extends StatefulWidget {
  PageController pageController;
  List<String> arrayOfTitles;
  String appBarTitle;
  int selectedItem;

  BottomNavBar(
      {Key key,
      this.selectedItem,
      this.arrayOfTitles,
      this.appBarTitle,
      this.pageController})
      : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  void _onItemTap(int item) {
    setState(() {
      widget.appBarTitle = widget.arrayOfTitles[item];
      widget.selectedItem = item;

      if (widget.pageController.hasClients) {
        widget.pageController.animateToPage(item,
            duration: Duration(milliseconds: 900),
            curve: Curves.easeInOutCubicEmphasized);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        bottomNavigationBarItem('Home', 14),
        bottomNavigationBarItem('Search', 14),
        bottomNavigationBarItem('Bookmarks', 14),
      ],
      currentIndex: widget.selectedItem,
      onTap: _onItemTap,
      iconSize: 25,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      backgroundColor: const Color(0xFFFFFFFF),
      selectedItemColor: Color(0xFF131315),
    );
  }
}
