import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewOrdersScreen extends StatelessWidget {
  final String providerId;

  NewOrdersScreen({required this.providerId});

  @override
  Widget build(BuildContext context) {
    // Convert providerId to a string to ensure consistent data type for Firebase queries
    final String providerIdStr = providerId.toString();

    // Debugging: Print the providerId to confirm it's set correctly
    print("Provider ID passed to NewOrdersScreen: $providerIdStr");

    return Scaffold(
      appBar: AppBar(
        title: Text('New Orders'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('new_orders')
            .where('provider_id', isEqualTo: providerIdStr)
            .snapshots(),
        builder: (context, snapshot) {
          // Check if the stream is still loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Debugging: Check if documents were retrieved
          if (snapshot.hasData) {
            print("Documents found for providerId $providerIdStr: ${snapshot.data!.docs.length}");
          }

          // Verify if there's any data for the selected provider
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No new orders available for this provider.'));
          }

          // Get the list of orders for the provider
          final orders = snapshot.data!.docs;

          // Display orders in a list format
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              var order = orders[index];

              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(order['service_name']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Requested by: ${order['user_name']}'),
                      Text('Date: ${order['date']}'),
                      Text('Time: ${order['time']}'),
                      Text('Location: ${order['location']}'),
                      Text('Phone: ${order['phone_number']}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                          acceptOrder(order.id);
                        },
                        child: Text('Accept', style: TextStyle(color: Colors.green)),
                      ),
                      TextButton(
                        onPressed: () {
                          cancelOrder(order.id);
                        },
                        child: Text('Cancel', style: TextStyle(color: Colors.red)),
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

  // Function to mark an order as 'accepted'
  void acceptOrder(String orderId) {
    FirebaseFirestore.instance.collection('new_orders').doc(orderId).update({
      'status': 'accepted',
      'updated_at': FieldValue.serverTimestamp(),
    }).then((_) {
      print('Order accepted with ID: $orderId');
    }).catchError((error) {
      print('Failed to accept order: $error');
    });
  }

  // Function to mark an order as 'canceled'
  void cancelOrder(String orderId) {
    FirebaseFirestore.instance.collection('new_orders').doc(orderId).update({
      'status': 'canceled',
      'updated_at': FieldValue.serverTimestamp(),
    }).then((_) {
      print('Order canceled with ID: $orderId');
    }).catchError((error) {
      print('Failed to cancel order: $error');
    });
  }
}
