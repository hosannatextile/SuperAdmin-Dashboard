import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/header.dart';
import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:admin/screens/dashboard/components/recent_files.dart';
import 'package:admin/screens/dashboard/components/storage_details.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class UserDetailsScreen extends StatefulWidget {
  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final List<Map<String, String>> data = [
    {
      'name': 'Rashid',
      'cnic': '123-456 7899',
      'mobile': 'Plant',
      'level': 'High',
      "status": "Active"
    },
    {
      'name': 'Imran',
      'cnic': '123-456 7890',
      'mobile': 'Warehouse',
      'level': 'Prioity',
      "status": "Active" // Typo from original preserved
    },
    {
      'name': 'Ayesha',
      'cnic': '123-456 7891',
      'mobile': 'Production',
      'level': 'Proof Noto',
      "status": "InActive"
    },
    {
      'name': 'Saiman',
      'cnic': '123-456 7892',
      'mobile': 'Dispatch',
      'level': 'Photo Vioo',
      "status": "Active"
    },
    {
      'name': 'Nadia',
      'cnic': '123-456 7893',
      'mobile': 'Quality',
      'level': 'View',
      "status": "Active"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(defaultPadding),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0,),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                // Header(),
                  Text("User Details",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                  SizedBox(height: defaultPadding),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/images/profile_pic.png"),
                  ),
                  SizedBox(height: defaultPadding),
                  UserDetailsRow(title: "Name", value: "Rashid",),
                  UserDetailsRow(title: "CNIC", value: "123-456 7899",),
                  UserDetailsRow(title: "Mobile", value: "Plant",),
                  UserDetailsRow(title: "Incharge Level", value: "High",),
                  UserDetailsRow(title: "Status", value: "Active",),
              
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UserDetailsRow extends StatelessWidget {
  final String title;
  final String value;
  const UserDetailsRow({
    super.key, required this.title, required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      
          Expanded(
            flex: 5,
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
