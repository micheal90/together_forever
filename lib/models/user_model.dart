import 'dart:convert';

class UserModel {
  String? userId;
  String? email;
  String? name;
  String? imageUrl;
  String? address;
  UserModel({
    this.userId,
    this.email,
    this.name,
    this.imageUrl,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'imageUrl': imageUrl,
      'address': address,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] != null ? map['userId'] : null,
      email: map['email'] != null ? map['email'] : null,
      name: map['name'] != null ? map['name'] : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] : null,
      address: map['address'] != null ? map['address'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
