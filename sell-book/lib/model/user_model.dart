class UserModel {
  String? idNumber;
  String? accountId;
  String? fullName;
  String? phoneNumber;
  dynamic imageUrl;
  String? birthDay;
  String? gender;
  String? schoolYear;
  String? schoolKey;
  String? dateCreated;
  bool? status;

  UserModel(
      {this.idNumber,
      this.accountId,
      this.fullName,
      this.phoneNumber,
      this.imageUrl,
      this.birthDay,
      this.gender,
      this.schoolYear,
      this.schoolKey,
      this.dateCreated,
      this.status});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json["idNumber"] is String) {
      idNumber = json["idNumber"];
    }
    if (json["accountID"] is String) {
      accountId = json["accountID"];
    }
    if (json["fullName"] is String) {
      fullName = json["fullName"];
    }
    if (json["phoneNumber"] is String) {
      phoneNumber = json["phoneNumber"];
    }
    imageUrl = json["imageURL"];
    if (json["birthDay"] is String) {
      birthDay = json["birthDay"];
    }
    if (json["gender"] is String) {
      gender = json["gender"];
    }
    if (json["schoolYear"] is String) {
      schoolYear = json["schoolYear"];
    }
    if (json["schoolKey"] is String) {
      schoolKey = json["schoolKey"];
    }
    if (json["dateCreated"] is String) {
      dateCreated = json["dateCreated"];
    }
    if (json["status"] is bool) {
      status = json["status"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["idNumber"] = idNumber;
    _data["accountID"] = accountId;
    _data["fullName"] = fullName;
    _data["phoneNumber"] = phoneNumber;
    _data["imageURL"] = imageUrl;
    _data["birthDay"] = birthDay;
    _data["gender"] = gender;
    _data["schoolYear"] = schoolYear;
    _data["schoolKey"] = schoolKey;
    _data["dateCreated"] = dateCreated;
    _data["status"] = status;
    return _data;
  }
}
