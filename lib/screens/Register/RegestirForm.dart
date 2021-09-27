import 'package:flutter/material.dart';
import 'package:providerfirebase/component.dart';
import 'package:providerfirebase/model/UserData.dart';
import 'package:providerfirebase/model/user_Auth_details.dart';
import 'package:providerfirebase/screens/login/login.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FormRegestir extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  //check code ??
  final UserDate user = UserDate();

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Form(
          key: formkey,
          child: Consumer<UserAuth>(builder: (_, userAuth, __) {
            return Padding(
              padding: EdgeInsets.only(top: 150, left: 20, right: 10),
              child: Column(
                children: [
                  Text(
                    'Registration',
                    style:
                        TextStyle(fontSize: 30, color: Colors.deepOrangeAccent),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Please enter the email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.deepOrangeAccent.withOpacity(0.6),
                        filled: true,
                        prefix: Icon(Icons.email),
                        labelText: 'Email'),
                    onSaved: (email) => user.password = email!,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (password) {
                      if (password == null || password.isEmpty) {
                        return 'Please enter the email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white30,
                        filled: true,
                        prefix: Icon(Icons.password),
                        labelText: 'Password'),
                    onSaved: (password) => user.password = password!,
                  ),
                  TextFormField(
                    validator: (name) {
                      if (name == null || name.isEmpty) {
                        return 'Please enter the Full name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.deepOrangeAccent.withOpacity(0.6),
                        filled: true,
                        prefix: Icon(Icons.person),
                        labelText: 'FullName'),
                    onSaved: (name) => user.name = name!,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  defultTextButton(
                    function: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        userAuth.signup(
                            userDate: user,
                            onfail: () {},
                            onSuccess: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            });
                      }
                    },
                    text: Text('Regestration'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  defultTextButton(
                    function: () {},
                    text: Text('Login'),
                  ),
                ],
              ),
            );
          }))
    ]);
  }
}
