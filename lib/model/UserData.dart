// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDate {
  late String? id;
  late String? name;
  late String? password;
  late String? email;

  UserDate.formSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    name = snapshot['name'] as String;
    email = snapshot['email'] as String;
  }

  UserDate({this.id, this.name, this.password, this.email});

  DocumentReference get firestore =>
      FirebaseFirestore.instance.doc('users/$id');
  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email};
  }

  Future<void> saveinformation() async {
    return firestore.set(toMap());
  }
}
