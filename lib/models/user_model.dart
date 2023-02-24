class UserModel {
  String? driverid;
  String? userid;
  String? mobilenumber;
  String? email;
  String? profileimage;
  String? firstname;
  String? lastname;
  String? basecurrency;
  String? roleid;
  String? token;
  String? tokenType;

  UserModel({
    required this.driverid,
    required this.userid,
    required this.mobilenumber,
    required this.email,
    required this.profileimage,
    required this.firstname,
    required this.lastname,
    required this.basecurrency,
    required this.roleid,
    required this.token,
    required this.tokenType,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    driverid = json['driver_id'];
    userid = json['user_id'];
    mobilenumber = json['mobile_number'];
    profileimage = json['profile_image'];
    email = json['email'];
    firstname = json['first_name'];
    lastname = json['last_name'];
    basecurrency = json['base_currency'];
    roleid = json['role_id'];
    token = json['token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['driver_id'] = driverid;
    data['user_id'] = userid;
    data['mobile_number'] = mobilenumber;
    data['profile_image'] = profileimage;
    data['email'] = email;
    data['first_name'] = firstname;
    data['last_name'] = lastname;
    data['base_currency'] = basecurrency;
    data['role_id'] = roleid;
    data['token'] = token;
    data['token_type'] = tokenType;
    // ignore: unrelated_type_equality_checks

    return data;
  }
}
