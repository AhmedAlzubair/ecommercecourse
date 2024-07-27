class Users {
  String? userId;
  String? userName;
  String? userPassword;
  String? userEmail;
  String? userPhone;
  String? userVerfiycode;
  String? userApprove;
  String? userCreate;
  String? userType;

  Users(
      {this.userId,
      this.userName,
      this.userPassword,
      this.userEmail,
      this.userPhone,
      this.userVerfiycode,
      this.userApprove,
      this.userCreate,
      this.userType});

  Users.fromJson(Map json) {
    userId = json['user_id'].toString()  ;
    userName = json['user_name'];
    userPassword = json['user_password'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    userVerfiycode = json['user_verfiycode'].toString() ;
    userApprove = json['user_approve'].toString() ;
    userCreate = json['user_create'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_password'] = this.userPassword;
    data['user_email'] = this.userEmail;
    data['user_phone'] = this.userPhone;
    data['user_verfiycode'] = this.userVerfiycode;
    data['user_approve'] = this.userApprove;
    data['user_create'] = this.userCreate;
    return data;
  }
}
