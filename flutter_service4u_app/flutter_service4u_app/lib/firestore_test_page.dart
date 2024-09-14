import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreTestPage extends StatefulWidget {
  @override
  _FirestoreTestPageState createState() => _FirestoreTestPageState();
}

class _FirestoreTestPageState extends State<FirestoreTestPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _addUser();
    _getUsers();
  }

  Future<void> _addUser() async {
    try {
      await firestore.collection('users').add({
        'name': 'Sama Alhassan',
        'email': 'sama@example.com',
      });
    } catch (e) {
      print("Failed to add user $e");
    }
  }

  Future<void> _getUsers() async {
    try {
      QuerySnapshot querySnapshot = await firestore.collection('users').get();
      querySnapshot.docs.forEach((doc) {
        print(doc["name"]);
      });
    } catch (e) {
      print("Error fetching users: $e");
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
