import 'package:flutter/material.dart';
import 'package:project/pages/home/menubar_pages/messages.dart';
import 'package:project/pages/home/menubar_pages/notifications.dart';
import 'package:project/pages/home/menubar_pages/profile_page.dart';
import 'package:project/pages/home/menubar_pages/communities.dart';
import 'package:project/pages/home/my_lessons.dart';
import 'package:project/screens/login_screen.dart';
import 'package:project/services/auth_service.dart';
import 'package:provider/provider.dart';

import 'menubar_pages/qasduacademy.dart';
import 'menubar_pages/settings.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Drawer(
        child: Material(
          child: ListView(
            padding: padding,
            children: <Widget>[
              const SizedBox(height: 25),
              buildMenuItem(
                text: 'Profile',
                icon: Icons.person,
                onClicked: () => selectedItem(context, 0),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'My Lessons',
                icon: Icons.play_lesson_outlined,
                onClicked: () => selectedItem(context, 1),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Messages',
                icon: Icons.message_outlined,
                onClicked: () => selectedItem(context, 2),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Communities',
                icon: Icons.people_outline,
                onClicked: () => selectedItem(context, 3),
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.grey),
              const SizedBox(height: 20),
              buildMenuItem(
                text: 'QA SDU Academy',
                icon: Icons.question_answer_outlined,
                onClicked: () => selectedItem(context, 4),
              ),
              buildMenuItem(
                text: 'Notifications',
                icon: Icons.notifications,
                onClicked: () => selectedItem(context, 5),
              ),
              buildMenuItem(
                text: 'Settings',
                icon: Icons.settings,
                onClicked: () => selectedItem(context, 6),
              ),
              const SizedBox(
                height: 25.0,
              ),
              ElevatedButton(
                  child: const Text('Logout'),
                  onPressed: () {
                    authService.signOut();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  )),
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
          builder: (context) => const ProfilePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const MyLessons(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Messages(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Communities(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const QASDUAcademy(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Notifications(),
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Settings(),
        ));
        break;

      // case 7:
      //   Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => LoginScreen(),
      //   ));
      //   break;
    }
  }
}
