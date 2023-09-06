class User {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? id;
  String? role, createdAt, updatedAt;
  num? v;

  User(
      {this.name,
      this.email,
      this.phone,
      this.password,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.role,
      this.v});

  Map<String, dynamic> toJson() {
    return {
      'name': (name != null) ? this.name : null,
      'email': (this.email != null) ? this.email : null,
      'phone': (this.phone != null) ? this.phone : null,
      'password': (this.password != null) ? this.password : null,
      'id': (this.id != null) ? this.password : null,
      'createdAt': (this.createdAt != null) ? this.createdAt : null,
      'updatedAt': (this.updatedAt != null) ? this.updatedAt : null,
      'role': (this.role != null) ? this.role : null,
      'v': (this.v != null) ? this.v : null,
    };
  }

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    id = json['id'];
    // createdAt = json['createdAt'];
    // updatedAt = json['updatedAt'];
    // role = json['role'];
    // v = json["__v"];
  }
}
