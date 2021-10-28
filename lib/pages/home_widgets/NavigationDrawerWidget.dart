import 'package:flutter/material.dart';

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
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Favorites',
              icon: Icons.people,
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Favorites',
              icon: Icons.favorite_border,
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Workflow',
              icon: Icons.workspaces_outline,
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Updates',
              icon: Icons.update,
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'QA SDU Academy',
              icon: Icons.question_answer,
            ),
            const SizedBox(height: 24),
            Divider(color: Colors.white70),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  buildMenuItem({String text, IconData icon}) {
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
      onTap: () {},
    );
  }
}
