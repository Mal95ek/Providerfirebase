import 'package:flutter/material.dart';
import 'FormLogin.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: new DecorationImage(
          image: new AssetImage("images/backgoundLogin.jpeg"),
          fit: BoxFit.fill,
        )),
        child: Container(child: FormLogin()),
      ),
    );
  }
}
