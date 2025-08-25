import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:admin/API/api.dart';
import 'package:admin/API/api_constant.dart';
import 'package:admin/Modal/login_data.dart';
import 'package:admin/controllers/user_controller.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/header.dart';
import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:admin/screens/dashboard/components/recent_files.dart';
import 'package:admin/screens/dashboard/components/storage_details.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants.dart';

class AddUserScreen extends StatefulWidget {
  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  UserController userController = Get.put(UserController());

  //String? _fileName;
 

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true, // Needed for web to get the file bytes
    );

    if (result != null && result.files.single.bytes != null) {
      setState(() {
        userController.imageBytes = result.files.single.bytes!;
        userController.fileName.value = result.files.single.name;
        userController.update();
      });

      // You can now upload `_imageBytes` to a server or store locally.
    }
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
              "Add User",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: _pickImage,
                  icon: Icon(Icons.upload_file),
                  label: Text("Upload Profile Photo"),
                ),
                const SizedBox(width: 20),
             
                  userController.imageBytes != null?Column(
                        children: [
                          CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  MemoryImage(userController.imageBytes!)),
                        ],
                      ):SizedBox()
              ],
            ),
            SizedBox(height: defaultPadding),
            TextFormField(
              controller: userController.nameController,
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Full Name',
            )),
            SizedBox(height: defaultPadding),
            TextFormField(
              controller: userController.phoneNoController,
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Mobile Number',
            )),
            SizedBox(height: defaultPadding),
            TextFormField(
              controller: userController.cnicController,
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'CNIC',
            )),
            SizedBox(height: defaultPadding),
            TextFormField(
              controller: userController.emailController,
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email Address',
            )),
            SizedBox(height: defaultPadding),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: userController.department,
                underline: SizedBox(),
                style: TextStyle(fontSize: 20, color: Colors.grey),
                items: [
                  DropdownMenuItem(
                    value: "Select Department",
                    child: Text("Select Department"),
                  ),
                  DropdownMenuItem(
                    value: "IT",
                    child: Text("IT"),
                  ),
                  DropdownMenuItem(
                    value: "Admin",
                    child: Text("Admin"),
                  ),
                  DropdownMenuItem(
                    value: "HR",
                    child: Text("HR"),
                  ),
                  DropdownMenuItem(
                    value: "Finance",
                    child: Text("Finance"),
                  ),
                  DropdownMenuItem(
                    value: "Management",
                    child: Text("Management"),
                  ),
                  DropdownMenuItem(
                    value: "Operations",
                    child: Text("Operations"),
                  ),
                  DropdownMenuItem(
                    value: "Folding",
                    child: Text("Folding"),
                  ),
                  DropdownMenuItem(
                    value: "Dispatch",
                    child: Text("Dispatch"),
                  ),
                  DropdownMenuItem(
                    value: "Gate",
                    child: Text("Gate"),
                  ),
                  DropdownMenuItem(
                    value: "Jigger",
                    child: Text("Jigger"),
                  ),
                  DropdownMenuItem(
                    value: "Maintainance",
                    child: Text("Maintainance"),
                  ),
                  DropdownMenuItem(
                    value: "Shade Band",
                    child: Text("Shade Band"),
                  ),
                  
                  DropdownMenuItem(
                    value: "Store",
                    child: Text("Store"),
                  ),
                  DropdownMenuItem(
                    value: "Electrical",
                    child: Text("Electrical"),
                  ),
                  
                  DropdownMenuItem(
                    value: "Finishing",
                    child: Text("Finishing"),
                  ),
                  
                  DropdownMenuItem(
                    value: "Accounts",
                    child: Text("Accounts"),
                  ),
                  DropdownMenuItem(
                    value: "Greigh",
                    child: Text("Greigh"),
                  ),
                  
                ],
                onChanged: (value) {
                  

                  setState(() {
                    userController.department = value!;
                  });
                  print(value);
                },
              ),
            ),
            SizedBox(height: defaultPadding),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: userController.role,
                underline: SizedBox(),
                style: TextStyle(fontSize: 20, color: Colors.grey),
                items: [
                  DropdownMenuItem(
                    value: "Select Role",
                    child: Text("Select Role"),
                  ),
                  DropdownMenuItem(
                    value: "IT",
                    child: Text("IT"),
                  ),
                  DropdownMenuItem(
                    value: "Super Admin",
                    child: Text("Super Admin"),
                  ),
                  DropdownMenuItem(
                    value: "Management",
                    child: Text("Management"),
                  ),
                  DropdownMenuItem(
                    value: "Admin",
                    child: Text("Admin"),
                  ),
                  DropdownMenuItem(
                    value: "Incharge",
                    child: Text("Incharge"),
                  ),
                  DropdownMenuItem(
                    value: "Supervisor",
                    child: Text("Supervisor"),
                  ),
                ],
                onChanged: (value) {
                  
                  setState(() {
                    userController.role = value!;
                  });
                  print(value);
                },
              ),
            ),
            SizedBox(height: defaultPadding),
            TextFormField(
              controller: userController.usernameController,
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            )),
            SizedBox(height: defaultPadding),
            TextFormField(
              controller: userController.passwordController,
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            )),
            SizedBox(height: defaultPadding),
            ElevatedButton(
             onPressed: () async {
  try {
    // Show loading indicator
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Creating user...")));
    
    var res = await userController.createUser();
    
    // Check for status 200 (not 201) as per your API method
    if (res.status == 201) {
      // Clear form on success
      userController.clearForm();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("User Added Successfully"),
          backgroundColor: Colors.green,
        ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to create user. Status: ${res.status}"),
          backgroundColor: Colors.red,
        ));
    }
  } catch (e) {
    // Handle validation errors and other exceptions
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Error: ${e.toString()}"),
        backgroundColor: Colors.red,
      ));
  }
},
              child: Text("Add User"),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
                  textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 20)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))),
            )
          ],
        ),
      ),
    );
  }
}
