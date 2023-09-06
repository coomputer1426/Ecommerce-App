import 'error.dart';

// import 'ResponseErrorNew.dart';
import 'User.dart';

class LoginResponse {
  User? user;
  String? token;

  // List<Error>? errors;
  Error? errors;

  String? statusMsg;

  // success or other fail
  String? message;

  LoginResponse({this.user, this.token, this.statusMsg, this.message});

  Map<String?, dynamic> toJson() {
    return {
      'data': (user != null) ? this.user : null,
      'message': (message != null) ? this.message : null,
      'token': (token != null) ? this.token : null,
      "statusMsg": (statusMsg != null) ? this.statusMsg : null,
      // "errors" : (errors != null) ? errors?.map((v) => v.toJson()).toList(): null
      "errors": (errors != null) ? this.errors : null
    };
  }

  String mergeErrors() {
    String messages = message!.toUpperCase();
    // errors?.forEach((element) {
    //   messages += "${element.msg!}\n";
    // });
    messages += (statusMsg == "fail" || message != "success")
        ? "\n ${errors?.msg ?? ""} "
        : "";
    return messages;
  }

  var tt = {
    "errors": [
      {
        "value": "nabil1@route.com",
        "msg": "Email already Existed",
        "param": "email",
        "location": "body"
      }
    ]
  };

  LoginResponse.fromJson(dynamic json) {
    // debugPrint("Error Message $json.errors.msg");

    user = json['data'] != null ? User.fromJson(json["data"]) : null;

    token = json['token'] != null ? json["token"] : null;
    message = json['message'] != null ? json["message"] : null;
    statusMsg = json['statusMsg'] != null ? json["statusMsg"] : null;
    // errors = json['errors'] != null? json["errors"]: null;
    errors = json['errors'] != null ? Error.fromJson(json["errors"]) : null;
    // if (json['errors'] != null) {
    //   var errorsPart = json["errors"];
    //   if(errorsPart["msg"] != null){
    //
    //   }
    // else if(errors.){
    //   List <Error> errorsList = [];
    //   json['errorsList'].forEach((v) {
    //     errorsList?.add(Error.fromJson(v));
    //   });
    // }
// }
  }
}
