import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProviderNotificationScreen extends StatelessWidget {
  final String providerId;

  const ProviderNotificationScreen({required this.providerId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('new_orders')
          //  .where('provider_id', isEqualTo: providerId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No notifications found.'));
          }

          final notifications = snapshot.data!.docs;

          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              var notification = notifications[index];
              var data = notification.data() as Map<String, dynamic>;

              // Determine the message based on the status
              String message;
              if (data['status'] == 'new') {
                message = "You have a new order!\nOrder Number: ${data['order_number']}";
              } else if (data['status'] == 'accepted') {
                message = "You accepted the order '${data['order_number']}'!";
              } else if (data['status'] == 'canceled') {
                message = "You rejected the order '${data['order_number']}'!";
              } else {
                message = "Order '${data['order_number']}' has an unknown status.";
              }

              return Card(
                margin: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    message,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: _getMessageColor(data['status']),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  /// Get color for the message box based on status
  Color _getMessageColor(String? status) {
    switch (status) {
      case 'new':
        return Colors.blue;
      case 'accepted':
        return Colors.green;
      case 'canceled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
