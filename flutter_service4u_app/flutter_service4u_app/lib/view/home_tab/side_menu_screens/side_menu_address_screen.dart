import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:service_hub_app/current_location_screen.dart';

class SideMenuAddressScreen extends StatefulWidget {
  @override
  _SideMenuAddressScreenState createState() => _SideMenuAddressScreenState();
}

class _SideMenuAddressScreenState extends State<SideMenuAddressScreen> {
  String? userLocation;
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    _fetchUserLocation(); // Fetch location when the screen initializes
  }

  // Function to fetch user's location from Firestore
  Future<void> _fetchUserLocation() async {
    final User? user = FirebaseAuth.instance.currentUser; // Get current user
    if (user == null) {
      setState(() {
        userLocation = 'User not authenticated';
      });
      return;
    }

    String uid = user.uid; // Get the authenticated user's UID

    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users_info')
        .doc(uid)
        .get();

    if (snapshot.exists) {
      setState(() {
        userLocation = snapshot['location']; // Get the location field
      });
    } else {
      setState(() {
        userLocation = 'Location not found';
      });
    }
  }

  // Function to handle location modification
  void _modifyLocation() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CurrentLocationScreen(
          onLocationSelected: (String placeName, double latitude, double longitude) {
            _updateLocationInFirebase(placeName, latitude, longitude);
            setState(() {
              userLocation = placeName; // Update the displayed location
              this.latitude = latitude;
              this.longitude = longitude;
            });
          },
        ),
      ),
    );
  }

  // Function to update location in Firestore
  Future<void> _updateLocationInFirebase(String placeName, double latitude, double longitude) async {
    final User? user = FirebaseAuth.instance.currentUser; // Get current user
    if (user == null) {
      print("User not authenticated");
      return; // Exit if the user is not authenticated
    }

    CollectionReference users =
        FirebaseFirestore.instance.collection('users_info');
    String uid = user.uid; // Use the authenticated user's UID

    await users.doc(uid).set({
      'location': placeName,
      'latitude': latitude,
      'longitude': longitude,
    }, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Location"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              userLocation ?? 'Loading location...',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _modifyLocation,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 115, 177, 228), // Set the background color to blue
              ),
              child: const Text(
                "Modify Location",
                style: TextStyle(
                    color: Colors.black), // Set the text color to black
              ),
            ),
          ],
        ),
      ),
    );
  }
}
