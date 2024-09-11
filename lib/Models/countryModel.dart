
class CountryModel {
  String? createdAt;
  String? country;
  String? flag;
  String? id;

  CountryModel({this.createdAt, this.country, this.flag, this.id});

  CountryModel.fromJson(Map<String, dynamic> json) {
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["country"] is String) {
      country = json["country"];
    }
    if(json["flag"] is String) {
      flag = json["flag"];
    }
    if(json["id"] is String) {
      id = json["id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["createdAt"] = createdAt;
    _data["country"] = country;
    _data["flag"] = flag;
    _data["id"] = id;
    return _data;
  }
}