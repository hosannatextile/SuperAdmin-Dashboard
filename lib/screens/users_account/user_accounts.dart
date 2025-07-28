import 'package:admin/API/api.dart';
import 'package:admin/controllers/user_controller.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/header.dart';
import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:admin/screens/dashboard/components/recent_files.dart';
import 'package:admin/screens/dashboard/components/storage_details.dart';
import 'package:admin/screens/user_details.dart/user_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants.dart';

class UserAccountScreen extends StatefulWidget {
  @override
  State<UserAccountScreen> createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  UserController userController = Get.put(UserController());
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userController.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            Text(
              "User Accounts",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: defaultPadding),
            Card(
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // ───────── column 0 ─────────
                    Expanded(
                      flex: 2, // <- bigger/smaller numbers tweak width
                      child: Text(
                        'Name',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    // ───────── column 1 ─────────
                    Expanded(
                      flex: 3,
                      child: Text("CNIC"),
                    ),

                    // ───────── column 2 ─────────
                    Expanded(
                      flex: 3,
                      child: Text('Mobile'),
                    ),

                    // ───────── column 3 ─────────
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Role',
                        textAlign: TextAlign
                            .start, // right-align last column if you like
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Department',
                        textAlign: TextAlign
                            .start, // right-align last column if you like
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Status',
                        textAlign: TextAlign
                            .center, // right-align last column if you like
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Obx(() => Column(
                  children: userController.allUsers.map((entry) {
                    return InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UserDetailsScreen(userData: entry,))),
                      child: Card(
                        margin: EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // ───────── column 0 ─────────
                              Expanded(
                                flex:
                                    2, // <- bigger/smaller numbers tweak width
                                child: Text(
                                  entry.fullName ?? '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),

                              // ───────── column 1 ─────────
                              Expanded(
                                flex: 3,
                                child: Text(entry.cnic ?? ''),
                              ),

                              // ───────── column 2 ─────────
                              Expanded(
                                flex: 3,
                                child: Text(entry.mobileNumber ?? ''),
                              ),

                              // ───────── column 3 ─────────
                              Expanded(
                                flex: 2,
                                child: Text(
                                  entry.role ?? '',
                                  textAlign: TextAlign
                                      .start, // right-align last column if you like
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  entry.department ?? '',
                                  textAlign: TextAlign
                                      .start, // right-align last column if you like
                                ),
                              ),
                              // ───────── column 4 ─────────
                              Expanded(
                                flex: 2,
                                child: Switch(
                                    value: entry.status == "active",
                                    onChanged: (value) async {
                                      entry.status =
                                          value == true ? "active" : "inactive";
                                      setState(() {});
                                       int s=await userController.updateUserStatus(entry.sId!, entry.status!);
                                       if(s==200){
                                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Status Updated")));
                                       }
                                    }),
                              ),
                              // IconButton(onPressed: ()
                              // {
                              //   ApiHelper().deleteUserById(entry.sId!);
                              // }, icon: Icon(Icons.delete))
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )),
          ],
        ),
      ),
    );
  }
}
