import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebase/component.dart';
import 'package:providerfirebase/model/UserData.dart';
import 'package:providerfirebase/model/user_Auth_details.dart';
import 'package:providerfirebase/screens/Homepage/HomeScreen.dart';
import 'package:providerfirebase/screens/Register/regestir.dart';

// ignore: must_be_immutable
class FormLogin extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Form(child: Consumer<UserAuth>(builder: (context, userinfo, child) {
        return Padding(
            padding: EdgeInsets.only(top: 200, left: 20, right: 10),
            child: Column(children: [
              Text(
                'Login',
                style: TextStyle(fontSize: 30, color: Colors.deepOrangeAccent),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: email,
                  decoration: InputDecoration(
                      fillColor: Colors.deepOrangeAccent.withOpacity(0.6),
                      filled: true,
                      prefix: Icon(Icons.email),
                      labelText: 'Email'),
                  validator: (email) {
                    if (email!.isEmpty) {
                      return 'type you email';
                    } else if (!email.contains('@')) {
                      return 'type Avalid email';
                    }
                    return null;
                  }),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                      fillColor: Colors.white30,
                      filled: true,
                      prefix: Icon(Icons.password),
                      labelText: 'Password'),
                  validator: (password) {
                    if (password!.isEmpty) {
                      return 'forget password';
                    } else if (password.length < 6) {
                      return 'if must have nore than 6 char';
                    }
                    return null;
                  }),
              SizedBox(
                height: 10,
              ),
              defultTextButton(
                function: () {
                  if (formkey.currentState!.validate()) {
                    userinfo.signin(
                        userDate: UserDate(
                            password: password.text, email: email.text),
                        onSuccess: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        onfail: (e) {
                          print(e);
                        });
                  }
                },
                text: Text('Login'),
              ),
              SizedBox(
                height: 10,
              ),
              defultTextButton(
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistirScreen()),
                  );
                },
                text: Text('Regestration'),
              )
            ]));
      }))
    ]);
  }
}
