import 'dart:convert';
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:admin/API/api.dart';
import 'package:admin/Modal/user_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  RxString fileName = "".obs;
  Uint8List? imageBytes;
  String department = "Select Department";
  String role = "Select Role";

  RxList<UserData> allUsers=<UserData>[].obs;
  
  Future<html.HttpRequest> createUser() async {
    // Validate required fields
    if (nameController.text.isEmpty ||
        phoneNoController.text.isEmpty ||
        cnicController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        usernameController.text.isEmpty ||
        department == "Select Department" ||
        role == "Select Role" ||
        imageBytes == null ||
        fileName.value.isEmpty) {
      throw Exception("All fields are required");
    }

    // Create html.File from Uint8List for web
    final htmlFile = html.File([imageBytes!], fileName.value);
    
    var res = await ApiHelper().createUser(
      htmlFile,
      nameController.text,
      phoneNoController.text,
      cnicController.text,
      emailController.text,
      department,
      role,
      passwordController.text,
      usernameController.text,
    );
    
    return res;
  }
  
  // Helper method to clear form
  void clearForm() {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    cnicController.clear();
    roleController.clear();
    usernameController.clear();
    departmentController.clear();
    phoneNoController.clear();
    fileName.value = "";
    imageBytes = null;
    department = "Select Department";
    role = "Select Role";
  }
getAllUsers() async {
  var res = await ApiHelper().getAllUsers();
  if (res.statusCode == 200) {
    var decodedList = jsonDecode(res.body);
    allUsers.value = List<UserData>.from(decodedList.map((e) => UserData.fromJson(e)));
    print(res.body);
  }
}

Future<int> updateUserStatus(String userId, String status) async {
   if (status != 'active' && status != 'inactive') {
    print('Invalid status value');
    return 500;
  }

  var res = await ApiHelper().updateUserStatus(userId, status);
  print(res.body);
  if (res.statusCode == 200) {
    getAllUsers();
    return res.statusCode;
  }else{
    return res.statusCode;
  }
 
}

}