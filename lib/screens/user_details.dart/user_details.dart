import 'package:admin/API/api_constant.dart';
import 'package:admin/Modal/user_data.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/header.dart';
import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:admin/screens/dashboard/components/recent_files.dart';
import 'package:admin/screens/dashboard/components/storage_details.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class UserDetailsScreen extends StatefulWidget {
  final UserData userData;

  const UserDetailsScreen({Key? key, required this.userData}) : super(key: key);
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
               widget.userData.profilePhoto != null ?    CircleAvatar(
               child: ClipOval(
                 child: FadeInImage(
                       placeholder: AssetImage("assets/images/person1.png"),
                       image: NetworkImage("${ApiConstant.baseUrl}ticket/getmedia/${widget.userData.profilePhoto!.split("/").last}"),
                       imageErrorBuilder: (context, error, stackTrace) {
                         return Image.asset("assets/images/person1.png");
                       },
                     
                 ),
               ),
                radius: 25,// Replace with your asset
            ):CircleAvatar(
               child: ClipOval(
                 child: Image.asset("assets/images/person1.png"),
               ),
                radius: 25,// Replace with your asset 
            ),
               // CircleAvatar(
               //   child: ClipOval(
               //     child: Image.asset("assets/images/person1.png"),
               //   ),
               //   radius: 25,// Replace with your asset
            
                  SizedBox(height: defaultPadding),
                  UserDetailsRow(title: "Name", value: "${widget.userData.fullName}",),
                  UserDetailsRow(title: "CNIC", value: "${widget.userData.cnic}",),
                  UserDetailsRow(title: "Mobile", value: "${widget.userData.mobileNumber}",),
                  UserDetailsRow(title: "Role", value: "${widget.userData.role}",),
                  UserDetailsRow(title: "Status", value: "${widget.userData.status}",),
              
                 
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
