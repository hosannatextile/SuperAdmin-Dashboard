class UserData {
  String? sId;
  String? fullName;
  String? mobileNumber;
  String? cnic;
  String? email;
  String? profilePhoto;
  String? department;
  String? role;
  String? username;
  String? password;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserData(
      {this.sId,
      this.fullName,
      this.mobileNumber,
      this.cnic,
      this.email,
      this.profilePhoto,
      this.department,
      this.role,
      this.username,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.iV});

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    mobileNumber = json['mobileNumber'];
    cnic = json['cnic'];
    email = json['email'];
    profilePhoto = json['profilePhoto'];
    department = json['department'];
    role = json['role'];
    username = json['username'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status=json['status'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fullName'] = this.fullName;
    data['mobileNumber'] = this.mobileNumber;
    data['cnic'] = this.cnic;
    data['email'] = this.email;
    data['profilePhoto'] = this.profilePhoto;
    data['department'] = this.department;
    data['role'] = this.role;
    data['username'] = this.username;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['status'] = this.status;
    return data;
  }
}
