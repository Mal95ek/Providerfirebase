// ignore: import_of_legacy_library_into_null_safe

// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';

import 'UserData.dart';

class UserAuth extends ChangeNotifier {
  UserAuth() {
    loadLoggedUserP();
  }
  late UserDate user;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> signin(
      {required UserDate userDate,
      required Function onfail,
      required Function onSuccess}) async {
    try {
      auth.signInWithEmailAndPassword(
          email: userDate.email, password: userDate.password);
      await loadLoggedUserP();
      onSuccess();
    } catch (e) {
      onfail('error message$e');
    }
  }

  Future<void> signup(
      {UserDate? userDate, Function? onfail, Function? onSuccess}) async {
    try {
      auth.createUserWithEmailAndPassword(
          email: userDate!.email, password: userDate.password);

      final User user = auth.currentUser;

      final _uid = user.uid;
      await userDate.saveinformation();
    } catch (e) {
      onfail!('error message$e');
    }
  }

  Future loadLoggedUserP({User? user}) async {
    final _uid = user!.uid;
    // ignore: unnecessary_null_comparison
    if (user != null) {
      final DocumentSnapshot userdoc =
          await FirebaseFirestore.instance.collection('users').doc('').get();
      UserDate.formSnapshot(userdoc);
    }
    notifyListeners();
  }
}
