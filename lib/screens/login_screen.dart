// ignore_for_file: library_prefixes

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/pages/navigation_bar.dart';
import 'package:project/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:project/pages/constants.dart' as AppColors;

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final authService = Provider.of<AuthService>(context);

    _signin(emailController, passwordController) async {
      String email = emailController.text;
      String password = passwordController.text;
      try {
        await authService.signInWithEmailAndPassword(email, password);

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const NavigationBar()));
      } on FirebaseAuthException catch (error) {
        Fluttertoast.showToast(
            msg: error.message, gravity: ToastGravity.CENTER);
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: AppColors.ELEMENTS_COLOR,
          titleTextStyle: const TextStyle(
            color: AppColors.ELEMENTS_COLOR,
            fontSize: 18,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.ELEMENTS_COLOR,
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: AppColors.MAIN_COLOR,
          elevation: 0,
          title: const Text(
            "SDU Academy",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 0),
              child: ElevatedButton(
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () => _signin(emailController, passwordController),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 50), primary: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 50), primary: Colors.white),
                child: const Text(
                  'Don\'t have an accont?',
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                )),
          ],
        ),
      ),
    );
  }
}
