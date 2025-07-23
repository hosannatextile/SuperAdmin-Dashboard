

import 'package:admin/Modal/login_data.dart';

class ApiConstant {
//  static String baseUrl="http://192.168.18.19:3000/api/";
 static String baseUrl="https://desk-production.up.railway.app/api/";

 static String loginUrl="${baseUrl}login";
 static String createTicket="${baseUrl}ticket";
 static String createProof="${baseUrl}proof";
 static String getTicketByUserId="${baseUrl}ticket/summary/";
 static String getTicketByUserIdnstatus="${baseUrl}ticket/filter?";
 static String createWorkInstructions="${baseUrl}workinstruction";
 static String getAllUsers="${baseUrl}users";
 static String mediaAccess="${baseUrl}ticket/getmedia/";

  static LoginData? loginData;
}