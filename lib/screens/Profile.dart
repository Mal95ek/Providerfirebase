// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebase/model/user_Auth_details.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? email;
  String? name;
  String? password;
  @override
  void initState() {
    Provider.of<UserAuth>(context, listen: false)
        .loadLoggedUserP()
        .then((value) => {
              value.forEach((element) {
                email = element.email;
                name = element.name;
              })
            });
    super.initState();
    Firebase.initializeApp();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(children: [
          TextField(
              decoration: InputDecoration(
                  labelText: this.name, hintText: "Add username"),
              onChanged: (val) => name = val),
          TextField(
              decoration:
                  InputDecoration(labelText: this.email, hintText: "Add email"),
              onChanged: (val) => email = val),
        ]));
  }
}
