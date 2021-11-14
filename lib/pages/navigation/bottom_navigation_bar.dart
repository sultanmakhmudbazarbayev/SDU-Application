// ignore_for_file: library_prefixes, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:project/pages/navigation/bottom_navigaton_item.dart';
import '../constants.dart' as AppColors;

class BottomNavBar extends StatefulWidget {
  final PageController pageController;
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
  final double DEFAULT_FONT_SIZE = 14;
  final double DEFAULT_ICON_SIZE = 25;
  final double SELECTED_ITEM_SIZE = 12;

  final int ANIMATION_DURATION_MS = 900;

  void _onItemTap(int item) {
    setState(() {
      widget.appBarTitle = widget.arrayOfTitles[item];
      widget.selectedItem = item;
      if (widget.pageController.hasClients) {
        widget.pageController.animateToPage(item,
            duration: Duration(milliseconds: ANIMATION_DURATION_MS),
            curve: Curves.easeInOutCubicEmphasized);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          bottomNavigationBarItem('Home', DEFAULT_FONT_SIZE, Icons.home),
          bottomNavigationBarItem('Search', DEFAULT_FONT_SIZE, Icons.search),
          bottomNavigationBarItem(
              'Bookmarks', DEFAULT_FONT_SIZE, Icons.bookmark),
        ],
        currentIndex: widget.selectedItem,
        onTap: _onItemTap,
        iconSize: DEFAULT_ICON_SIZE,
        selectedFontSize: SELECTED_ITEM_SIZE,
        unselectedFontSize: SELECTED_ITEM_SIZE,
        backgroundColor: AppColors.SECONDARY_COLOR,
        selectedItemColor: AppColors.ELEMENTS_COLOR,
      ),
    );
  }
}
