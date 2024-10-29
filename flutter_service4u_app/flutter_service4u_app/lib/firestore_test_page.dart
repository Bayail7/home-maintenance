import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

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

  static Future<void> addProviderData(
      String uid,
      String name,
      String email,
      String mobile,
      String nationality,
      String? major,
      String location,
      String haveCar,
      String? workingHour,
      String password) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('providers_info');

    try {
      // Use uid as the document ID
      await users.doc(uid).set({
        'name': name,
        'email': email,
        'mobile': mobile,
        'nationality': nationality,
        'major': major,
        'location': location,
        'have a car?': haveCar,
        'preferred working hours': workingHour,
        'password': password,
      });
      Get.snackbar('Success','Provider added successfully with UID: $uid');
    } catch (e) {
      print("Error adding user: $e");
    }
  }


  // New method for adding an order to the `new_orders` collection
  static Future<void> addOrderData(
    String customerName,
    String serviceName,
    String date,
    String time,
    String location,
    String phoneNumber,
 String providerId, // New parameter for provider ID
) async {
  CollectionReference orders = FirebaseFirestore.instance.collection('new_orders');

  try {
    await orders.add({
      'user_name': customerName,
      'service_name': serviceName,
      'date': date,
      'time': time,
      'location': location,
      'phone_number': phoneNumber,
      'provider_id': providerId, // Store provider ID with order
      'status': 'new'
      });
      Get.snackbar('Order Success', 'New order added successfully');
      print("Order added successfully for: $customerName");
    } catch (e) {
      print("Error adding order: $e");
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
