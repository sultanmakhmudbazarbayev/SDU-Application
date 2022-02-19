import 'package:flutter/material.dart';
import 'package:project/pages/navigation_bar.dart';
import 'package:project/screens/login_screen.dart';
import 'package:project/services/auth_service.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return StreamBuilder<User>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<User> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User user = snapshot.data;
            return user == null ? const LoginScreen() : const NavigationBar1();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
