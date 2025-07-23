import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/header.dart';
import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:admin/screens/dashboard/components/recent_files.dart';
import 'package:admin/screens/dashboard/components/storage_details.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            Text("Notifications"),
            SizedBox(height: defaultPadding),
           
          _buildNotification(
            icon: Icons.warning,
            color: Colors.orange,
            title: 'New Work Instruction',
            description: 'Using of Chemical Material...',
            time: 'Jun 5 2025',
          ),
          _buildNotification(
            icon: Icons.assignment,
            color: Colors.blue,
            title: 'Mr. Farlan – Ticket Assigned',
            description: 'Planter urgently',
            time: '6h ago',
          ),
          _buildNotification(
            icon: Icons.check_circle,
            color: Colors.green,
            title: 'Pending Approval',
            description: '1 week ago',
            time: 'May 3025',
          ),
          _buildNotification(
            icon: Icons.notifications,
            color: Colors.red,
            title: 'Admin Manager',
            description: 'Ticket revision resolved',
            time: '1w ago',
          ),
      
         
          ]
      ),
    )
    );
  }
    Widget _buildNotification({
    required IconData icon,
    required Color color,
    required String title,
    required String description,
    required String time,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          '$description\n$time',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        trailing:  Text(
          '$time',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
