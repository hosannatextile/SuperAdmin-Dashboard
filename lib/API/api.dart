import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:html' as html;

import 'package:admin/API/api_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiHelper{

 Future<http.Response> login(String cnic, String password) async {
   try {
    // Async code that might fail
    final response = await http.post(
      Uri.parse(ApiConstant.loginUrl),
      body: jsonEncode({
        'email': cnic,
        'password': password,
        'role': 'Super Admin',
        'fcm_token':""
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    print(response.body);

    return response;
  } catch (e, stackTrace) {
    print("Caught an error: $e");
    print("Stack trace: $stackTrace");
    return http.Response('Error', 500);
  }
    
  }


Future<html.HttpRequest> createUser(
  html.File profileImage,
  String? fullName,
  String? phoneNo,
  String? cnic,
  String? email,
  String? department,
  String? role,
  String? password,
  String? username,
) async {
  Future<html.HttpRequest> sendRequest(String accessToken) async {
    final Uri uri = Uri.parse(ApiConstant.getAllUsers); // Fix this endpoint
    final Map<String, String> headers = {
      'Authorization': 'Bearer $accessToken',
    };

    final formData = html.FormData();
    if (fullName != null) formData.append('fullName', fullName);
    if (phoneNo != null) formData.append('mobileNumber', phoneNo);
    if (cnic != null) formData.append('cnic', cnic);
    if (email != null) formData.append('email', email);
    if (department != null) formData.append('department', department);
    if (role != null) formData.append('role', role);
    if (username != null) formData.append('username', username);
    if (password != null) formData.append('password', password);
    formData.append('status', "active");
    formData.appendBlob('profilePhoto', profileImage);

    final request = html.HttpRequest();
    request.open('POST', uri.toString());

    for (var key in headers.keys) {
      request.setRequestHeader(key, headers[key]!);
    }

    request.timeout = 30000;
    final completer = Completer<html.HttpRequest>();

    request.onLoadEnd.listen((event) {
      if (request.status == 200 || request.status == 201) {
        completer.complete(request);
      } else {
        completer.completeError({
          'status': request.status,
          'response': request.responseText,
        });
      }
    });

    request.onTimeout.listen((event) {
      completer.completeError({'status': 408, 'response': 'Request timeout'});
    });

    request.onError.listen((event) {
      completer.completeError({'status': 500, 'response': 'Network error'});
    });

    request.send(formData);

    return completer.future;
  }

  try {
    return await sendRequest(ApiConstant.loginData!.accessToken!);
  } catch (error) {
    if (error is Map<String, dynamic> && error['status'] == 403) {
      // Attempt token refresh
      final refreshResponse = await html.HttpRequest.request(
        ApiConstant.refreshUrl,
        method: 'POST',
        requestHeaders: {'Content-Type': 'application/json'},
        sendData: jsonEncode({
          'refreshToken': ApiConstant.loginData?.refreshToken,
        }),
      );

      if (refreshResponse.status == 200) {
        final data = jsonDecode(refreshResponse.responseText!);
        ApiConstant.loginData?.accessToken = data['accessToken'];

        return await sendRequest(data['accessToken']);
      } else {
        throw 'Token refresh failed. Status: ${refreshResponse.status}';
      }
    } else {
      throw 'Failed to create user. Error: $error';
    }
  }
}

 Future<http.Response> getAllUsers() async {
    final response = await http.get(
      Uri.parse("${ApiConstant.getAllUsers}"),
      
      headers: {
        'Content-Type': 'application/json',
          "authorization": "Bearer ${ApiConstant.loginData!.accessToken!}",
      },
    );

    print(response.body);
    
    return response;
  }

 getTicketByUserId(String userId) async {
    final response = await http.get(
      Uri.parse("${ApiConstant.getTicketByUserId}$userId"),
      
      headers: {
        'Content-Type': 'application/json',
      },
    );

    print(response.body);

    return response;
  }
  getTicketByUserIdnstatus(String userId,String status) async {
    final response = await http.get(
      Uri.parse("${ApiConstant.getTicketByUserIdnstatus}user_id=$userId&status=$status"),
      
      headers: {
        'Content-Type': 'application/json',
      },
    );

    print(response.body);

    return response;
  }

 getProofByUserId(String userId) async {
    final response = await http.get(
      Uri.parse("${ApiConstant.createProof}/$userId"),
      
      headers: {
        'Content-Type': 'application/json',
      },
    );

    print(response.body);

    return response;
  }


//  Future<http.Response> getUsersByRole(String role) async {
//     final response = await http.get(
//       Uri.parse("${ApiConstant.getAllUsers}?role=$role"),
      
//       headers: {
//         'Content-Type': 'application/json',
//         "authorization": "Bearer ${ApiConstant.loginData!.accessToken!}",
//       },
//     );

//     print(response.body);

//     return response;
//   }

Future<http.Response> uploadProof(
  File voiceNote,
  File video,
  File image,
  String? userId,
  String? ticketId,
  String? recipientId,
  
  String? recipientName,
 
 
) async {
  final Map<String, String> defaultHeaders = {
   // 'Authorization': 'Bearer ${ApiConstant.loginData!.accessToken!}',
  };

  // Function to handle the API request
  Future<http.Response> sendRequest() async {
    // Create the multipart request
    var uri = Uri.parse(ApiConstant.createProof);
    var request = http.MultipartRequest('POST', uri);

    // Add the form fields (non-file data)
    request.fields['user_id'] = userId!;
    request.fields['recipient_id'] = recipientId!;
    request.fields['recipient_name'] = recipientName!;
    request.fields['ticket'] = ticketId!;
    
    
 
    
    request.headers.addAll(defaultHeaders);

    // Add files to the request (multipart form data)
    request.files.add(await http.MultipartFile.fromPath('voice_note', voiceNote.path));
    request.files.add(await http.MultipartFile.fromPath('video', video.path));
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    // Send the request
    var response = await request.send();
    print(response);
    // Read the response
    return await http.Response.fromStream(response);
  }

  // Send initial request
  var response = await sendRequest();
print(response);
  // //If unauthorized, try refreshing the token and retry the request
  // if (response.statusCode == 401) {
  //   var refreshResponse = await http.post(
  //     Uri.parse(ApiConstant.refreshDeviceToken),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode({
  //       'refresh_token': ApiConstant.loginData?.refreshToken,
  //     }),
  //   );

  //   if (refreshResponse.statusCode == 200) {
  //     // Update token
  //     var data = jsonDecode(refreshResponse.body);
  //     ApiConstant.loginData?.accessToken = data['access_token'];
  //     ApiConstant.loginData?.refreshToken = data['refresh_token'];

  //     // Retry the original request with new token
  //     response = await sendRequest();
  //     return response;
  //   } else {
     
  //   }
  //}

  // Return original or last response
  return response;
}

getWorkInstructionByUserId(String userId) async {
    final response = await http.get(
      Uri.parse("${ApiConstant.createWorkInstructions}/$userId"),
      
      headers: {
        'Content-Type': 'application/json',
      },
    );

    print(response.body);

    return response;
  }

Future<http.Response> updateUserStatus(String userId, String status) async {
  // Validate status before sending the request
 

  final url = Uri.parse('${ApiConstant.getAllUsers}/$userId/status');
  final headers = {
    'Content-Type': 'application/json',
   "authorization": "Bearer ${ApiConstant.loginData!.accessToken!}",
  };

  // Prepare the body of the request
  final body = jsonEncode({'status': status});

  try {
    final response = await http.put(
      url,
      headers: headers,
      body: body,
    );

      
      return response;
   
  } catch (e) {
    print('Error occurred: $e');
    return http.Response('', 500);
  }
}

Future<html.HttpRequest> deleteUserById(String userId) async {
  final Uri uri = Uri.parse('${ApiConstant.baseUrl}users/users/$userId');

  final Map<String, String> headers = {
    'Authorization': 'Bearer ${ApiConstant.loginData!.accessToken!}',
    'Content-Type': 'application/json',
  };

  final request = html.HttpRequest();
  request.open('DELETE', uri.toString());

  for (var key in headers.keys) {
    request.setRequestHeader(key, headers[key]!);
  }

  request.timeout = 15000; // optional timeout

  final completer = Completer<html.HttpRequest>();

  request.onLoadEnd.listen((event) {
    if (request.status == 200) {
      completer.complete(request);
    
    } else {
      completer.completeError('Failed to delete user. Status: ${request.status}, Response: ${request.responseText}');
    }
  });

  request.onError.listen((event) {
    completer.completeError('Network error occurred');
  });

  request.onTimeout.listen((event) {
    completer.completeError('Request timeout');
  });

  request.send(); // DELETE requests usually have no body

  return completer.future;
}

}