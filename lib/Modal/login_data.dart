class LoginData {
  String? message;
  String? accessToken;
  String? refreshToken;
  User? user;

  LoginData({this.message, this.accessToken, this.refreshToken, this.user});

  LoginData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? fullName;
  String? cnic;
  String? email;
  String? role;
  String? username;
  String ? profilePhoto;

  User(
      {this.id,
      this.fullName,
      this.cnic,
      this.email,
      this.role,
      this.username,
      this.profilePhoto
      });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    cnic = json['cnic'];
    email = json['email'];
    role = json['role'];
    username = json['username'];
    profilePhoto = json['profilePhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['cnic'] = this.cnic;
    data['email'] = this.email;
    data['role'] = this.role;
    data['username'] = this.username;
    data['profilePhoto'] = this.profilePhoto;
    return data;
  }
}
