/// statusMsg : "fail"
/// message : "Account Already Exists"

class ServerError {
  ServerError({
    this.statusMsg,
    this.message,
  });

  ServerError.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
  }

  String? statusMsg;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    return map;
  }
}
