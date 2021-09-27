import 'package:flutter/material.dart';
import 'RegestirForm.dart';

class RegistirScreen extends StatelessWidget {
  const RegistirScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: new DecorationImage(
          image: new AssetImage("images/backgoundLogin.jpeg"),
          fit: BoxFit.fill,
        )),
        child: Container(child: FormRegestir()),
      ),
    );
  }
}
