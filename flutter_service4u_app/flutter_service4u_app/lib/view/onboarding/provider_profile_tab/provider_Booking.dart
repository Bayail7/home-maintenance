import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class ProviderBookingScreen extends StatelessWidget {
  final String providerId;

  ProviderBookingScreen({required this.providerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookings  test '),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('new_orders')
            //.where('provider_id', isEqualTo: providerId) // Uncomment if filtering by provider is needed
            .where('status', whereIn: ['accepted', 'canceled'])
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
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['service_name'] ?? 'No Service Name',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Order #: ${data['order_number'] ?? 'N/A'}',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Text(
                        'User: ${data['user_name'] ?? 'No User'}',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Text(
                        'Location: ${data['location'] ?? 'No Location'}',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Text(
                        'Date: ${data['date'] ?? 'No Date'}',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Text(
                        'Time: ${data['time'] ?? 'No Time'}',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Text(
                        'Status: ${data['status'] ?? 'Unknown'}',
                        style: TextStyle(
                          color: data['status'] == 'accepted'
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () => _makePhoneCall(data['phone_number']),
                            icon: Icon(Icons.phone),
                            label: Text('Call'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              textStyle: TextStyle(fontSize: 16),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('More Details'),
                          ),
                        ],
                      ),
                    ],
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
