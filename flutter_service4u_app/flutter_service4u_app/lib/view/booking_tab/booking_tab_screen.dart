import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:service_hub_app/controller/controller.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final AuthController authController = Get.find<AuthController>();

  // Variables to hold user data
  String userName = "";
  String userEmail = "";
  bool isLoading = true; // Loading state

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      Map<String, dynamic>? userData = await authController.getUserData();

      if (userData != null) {
        setState(() {
          userName = userData['name'] ?? "N/A";
          userEmail = userData['email'] ?? "N/A";
          isLoading = false; // Mark loading as complete
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false; // Prevent infinite loading in case of error
      });
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookings'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading until data is fetched
          : StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('new_orders')
                  .where('user_name', isEqualTo: userName) // Use userName after it's set
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No bookings found.'));
                }

                final bookings = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: bookings.length,
                  itemBuilder: (context, index) {
                    var booking = bookings[index];
                    var data = booking.data() as Map<String, dynamic>;

                    return Card(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(data['service_name'] ?? 'No Service Name'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order #: ${data['order_number'] ?? 'N/A'}'),
                            Text('Provider: ${data['provider_name'] ?? 'No provider'}'),
                            Text('Location: ${data['location'] ?? 'No Location'}'),
                            Text('Date: ${data['date'] ?? 'No Date'}'),
                            Text('Time: ${data['time'] ?? 'No Time'}'),
                            Text('Status: ${data['status'] ?? 'Unknown'}'),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.phone),
                          onPressed: () => _makePhoneCall(data['phone_number']),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }

  void _makePhoneCall(String? phoneNumber) async {
    if (phoneNumber != null && phoneNumber.isNotEmpty) {
      final url = 'tel:$phoneNumber';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
