import 'package:flutter/material.dart';

import 'PeoplePage.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 48),
            buildMenuItem(
              text: 'People',
              icon: Icons.people,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Favorites',
              icon: Icons.people,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Favorites',
              icon: Icons.favorite_border,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Workflow',
              icon: Icons.workspaces_outline,
              onClicked: () => selectedItem(context, 3),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Updates',
              icon: Icons.update,
              onClicked: () => selectedItem(context, 4),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'QA SDU Academy',
              icon: Icons.question_answer,
              onClicked: () => selectedItem(context, 5),
            ),
            const SizedBox(height: 20),
            Divider(color: Colors.white70),
            const SizedBox(height: 20),
            buildMenuItem(
              text: 'Plugins',
              icon: Icons.account_tree_outlined,
              onClicked: () => selectedItem(context, 6),
            ),
            buildMenuItem(
              text: 'Notifications',
              icon: Icons.notifications,
              onClicked: () => selectedItem(context, 7),
            ),
          ],
        ),
      ),
    );
  }

  buildMenuItem({
      String text, 
      IconData icon,
      VoidCallback onClicked,

    }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  selectedItem(BuildContext context, int i) {
    switch (i) {
      case 0: 
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PeoplePage(),
        ));
        break;
      case 1: 
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PeoplePage(),
        ));
        break;  
    }
  }
}
