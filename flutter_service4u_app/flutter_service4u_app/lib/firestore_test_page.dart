import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreTestPage extends StatefulWidget {
  @override
  FirestoreTestPageState createState() => FirestoreTestPageState();
}

class FirestoreTestPageState extends State<FirestoreTestPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<void> addUserData(String uid, String name, String email,
      String mobile, String location, String password) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('users_info');

    try {
      // Use uid as the document ID
      await users.doc(uid).set({
        'name': name,
        'email': email,
        'mobile': mobile,
        'location': location,
        'password': password,
      });
      print("User added successfully with UID: $uid");
    } catch (e) {
      print("Error adding user: $e");
    }
  }



 static Future<void> addProviderData(String uid, String name, String email,
      String mobile, String location, String password) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('providers_info');

    try {
      // Use uid as the document ID
      await users.doc(uid).set({
        'name': name,
        'email': email,
        'mobile': mobile,
        'location': location,
        'password': password,
      });
      print("User added successfully with UID: $uid");
    } catch (e) {
      print("Error adding user: $e");
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firestore Test')),
      body: Center(child: Text('Check console for Firestore data')),
    );
  }
}
