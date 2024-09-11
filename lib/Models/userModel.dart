class UserModel {
  String? createdAt;
  String? name;
  String? avatar;
  String? emailId;
  String? mobile;
  String? country;
  String? state;
  String? district;
  String? id;
  String? email;

  UserModel({
    this.createdAt,
    this.name,
    this.avatar,
    this.emailId,
    this.mobile,
    this.country,
    this.state,
    this.district,
    this.id,
    this.email,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["avatar"] is String) {
      avatar = json["avatar"];
    }
    if (json["emailId"] is String) {
      emailId = json["emailId"];
    }
    if (json["mobile"] is String) {
      mobile = json["mobile"];
    }
    if (json["country"] is String) {
      country = json["country"];
    }
    if (json["state"] is String) {
      state = json["state"];
    }
    if (json["district"] is String) {
      district = json["district"];
    }
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["createdAt"] = createdAt;
    _data["name"] = name;
    _data["avatar"] = avatar;
    _data["emailId"] = emailId;
    _data["mobile"] = mobile;
    _data["country"] = country;
    _data["state"] = state;
    _data["district"] = district;
    _data["id"] = id;
    _data["email"] = email;
    return _data;
  }
}
