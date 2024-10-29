import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class CurrentLocationScreen extends StatefulWidget {
  final Function(String) onLocationSelected; // Change type to String for the place name

  const CurrentLocationScreen({Key? key, required this.onLocationSelected}) : super(key: key);

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  final GlobalKey<ScaffoldState> currentLocationScaffoldKey = GlobalKey<ScaffoldState>();
  late GoogleMapController googleMapController;
  LatLng? selectedLocation;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: currentLocationScaffoldKey,
      appBar: AppBar(title: const Text("Location"), centerTitle: true),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () async {
              Position position =  await _determinePosition();
              googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: LatLng(position.latitude, position.longitude),
                      zoom: 14)));
              markers.clear();
              selectedLocation = LatLng(position.latitude, position.longitude);
              markers.add(Marker(
                  markerId: const MarkerId('currentLocation'),
                  position: selectedLocation!));
              setState(() {});
            },
            label: const Text("Current Location"),
            icon: const Icon(Icons.location_history),
            backgroundColor: const Color.fromARGB(255, 115, 177, 228),
            heroTag: 'currentLocationFAB', // Add a unique tag
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            onPressed: () async {
              if (selectedLocation != null) {
                String placeName = await _getPlaceName(selectedLocation!); // Get place name
                widget.onLocationSelected(placeName); // Pass place name
                await _saveLocationToFirebase(placeName); // Save to Firebase
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please select a location first')),
                );
              }
            },
            label: const Text("Done"),
            icon: const Icon(Icons.check),
            backgroundColor: const Color.fromARGB(255, 115, 177, 228),
          ),
        ],
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

Future<String> _getPlaceName(LatLng latLng) async {
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    Placemark place = placemarks.first; // Take the first placemark
    
    // Extract and format the desired details: country, city, street name
    String country = place.country ?? "Unknown Country";
    String city = place.locality ?? "Unknown City";
    String street = place.street ?? "Unknown Street";

    return "$street, $city, $country";
  } catch (e) {
    print("Error getting place name: $e");
    return "Unknown Location"; // Default value if error occurs
  }
}

  // Function to save location to Firestore
  Future<void> _saveLocationToFirebase(String placeName) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users_info'); // Change this to your collection

    try {
      // Use the UID or a unique identifier for the user
      String uid = 'your_uid'; // Replace with actual UID or method to get it

      await users.doc(uid).set({
        'location': placeName, // Save the place name
      }, SetOptions(merge: true)); // Use merge if you want to update
      print("Location saved to Firestore: $placeName");
    } catch (e) {
      print("Error saving location: $e");
    }
  }
}
