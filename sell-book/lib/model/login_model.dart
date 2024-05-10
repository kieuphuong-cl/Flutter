
class LoginModel {
    bool? success;
    Data? data;
    String? error;

    LoginModel({this.success, this.data, this.error});

    LoginModel.fromJson(Map<String, dynamic> json) {
        if(json["success"] is bool) {
            success = json["success"];
        }
        if(json["data"] is Map) {
            data = json["data"] == null ? null : Data.fromJson(json["data"]);
        }
        if(json["error"] is String) {
            error = json["error"];
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["success"] = success;
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        _data["error"] = error;
        return _data;
    }
}

class Data {
    String? token;
    String? expiration;
    String? role;

    Data({this.token, this.expiration, this.role});

    Data.fromJson(Map<String, dynamic> json) {
        if(json["token"] is String) {
            token = json["token"];
        }
        if(json["expiration"] is String) {
            expiration = json["expiration"];
        }
        if(json["role"] is String) {
            role = json["role"];
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["token"] = token;
        _data["expiration"] = expiration;
        _data["role"] = role;
        return _data;
    }
}