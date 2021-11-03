import 'package:flutter/material.dart';
import 'people_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// <<<<<<< HEAD
//       //drawerEnableOpenDragGesture: true,
// =======
//       backgroundColor: Colors.transparent,
//       drawerEnableOpenDragGesture: true,
// >>>>>>> 0738fefce35f61fb4ae205eb726b9c9b206fe9ac
      body: Drawer(
        child: Material(
          color: Colors.white,
          child: ListView(
            padding: padding,
            children: <Widget>[
              const SizedBox(height: 25),
              buildMenuItem(
                text: 'People',
                icon: Icons.people,
                onClicked: () => selectedItem(context, 0),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Favorites',
                icon: Icons.favorite_border,
                onClicked: () => selectedItem(context, 1),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Updates',
                icon: Icons.update,
                onClicked: () => selectedItem(context, 3),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'QA SDU Academy',
                icon: Icons.question_answer,
                onClicked: () => selectedItem(context, 4),
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.grey),
              const SizedBox(height: 20),
              buildMenuItem(
                text: 'Plugins',
                icon: Icons.account_tree_outlined,
                onClicked: () => selectedItem(context, 5),
              ),
              buildMenuItem(
                text: 'Notifications',
                icon: Icons.notifications,
                onClicked: () => selectedItem(context, 6),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    const color = Color(0xFF131315);
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: const TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  selectedItem(BuildContext context, int i) {
    switch (i) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PeoplePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PeoplePage(),
        ));
        break;
    }
  }
}
