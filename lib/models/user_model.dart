import 'dart:convert';

class UserModel {
  String? userId;
  String? email;
  String? name;
  String? imageUrl;
  UserModel({
     this.userId,
     this.email,
     this.name,
     this.imageUrl,
  });


  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      email: map['email'],
      name: map['name'],
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
