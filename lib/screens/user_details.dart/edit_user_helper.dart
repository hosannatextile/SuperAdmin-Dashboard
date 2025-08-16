import 'package:admin/Modal/user_data.dart';
import 'package:flutter/material.dart';

class EditUserDialog {
  static Future<void> showEditDialog(BuildContext context, UserData userData, Function(UserData) onSave) async {
    final TextEditingController nameController = TextEditingController(text: userData.fullName);
    final TextEditingController cnicController = TextEditingController(text: userData.cnic);
    final TextEditingController passwordController = TextEditingController(text: userData.password);
    final TextEditingController mobileController = TextEditingController(text: userData.mobileNumber);
    final TextEditingController roleController = TextEditingController(text: userData.role);
    final TextEditingController statusController = TextEditingController(text: userData.status);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text("Edit User Details"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextField("Name", nameController),
                _buildTextField("CNIC", cnicController),
                _buildTextField("Password", passwordController),
                _buildTextField("Mobile", mobileController, keyboard: TextInputType.phone),
                _buildTextField("Role", roleController),
                _buildTextField("Status", statusController),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: const Text("Save"),
              onPressed: () {
                // update userData using copyWith
                final updatedUser = userData.copyWith(
                  fullName: nameController.text,
                  cnic: cnicController.text,
                  password: passwordController.text,
                  mobileNumber: mobileController.text,
                  role: roleController.text,
                  status: statusController.text,
                );

                Navigator.pop(context); // close dialog
                onSave(updatedUser); // pass updated user back
              },
            ),
          ],
        );
      },
    );
  }

  static Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType keyboard = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
