import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/pages/navigation_bar.dart';
import 'package:project/services/auth_service.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final authService = Provider.of<AuthService>(context);

    _signup(emailController, passwordController) async {
      String email = emailController.text;
      String password = passwordController.text;
      try {
        await authService.createUserWithEmailAndPassword(email, password);

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => NavigationBar()));
      } on FirebaseAuthException catch (error) {
        Fluttertoast.showToast(
            msg: error.message, gravity: ToastGravity.CENTER);
      }
    }

      return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Register'),
                onPressed: () => _signup(emailController, passwordController)
                ),
          ],
        ),
      ),
    );


    }
  }

