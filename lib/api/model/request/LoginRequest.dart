/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutti@gmail.com"
/// password : "Ahmed@123"
/// repassword : "Ahmed@123"
/// phone : "01010700700"

class LoginRequest {
  LoginRequest({
    // this.name,
    this.email,
    this.password,
    // this.rePassword,
    // this.phone,
  });

  LoginRequest.fromJson(dynamic json) {
    // name = json['name'];
    email = json['email'];
    password = json['password'];
    // rePassword = json['rePassword'];
    // phone = json['phone'];
  }

  // String? name;
  String? email;
  String? password;

  // String? rePassword;
  // String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    // map['rePassword'] = rePassword;
    // map['phone'] = phone;
    return map;
  }
}
//   Successful request
// {"message":"success","user":{"name":"Khalid Ahmed","email":"hh@mm.com","role":"user"},
// "token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZGJiYmQ5MThiMWQ5YTExMDhjYWMxZiIsIm5hbWUiOiJLaGFsaWQgQWhtZWQiLCJyb2xlIjoidXNlciIsImlhdCI6MTY5MjEyMjA3NCwiZXhwIjoxNjk5ODk4MDc0fQ.te_NXA43vnmmuoErRw-2RZWwjbBaY-XS6JV969lzp2I"}

//   Failed Request
// {
//     "statusMsg": "fail",
//     "message": "Incorrect email or password"
// }
