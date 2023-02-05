// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    this.id,
    this.firstname,
    this.lastname,
    this.address,
    this.mobilenumber,
    this.email,
    this.emailVerifiedAt,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? firstname;
  String? lastname;
  String? address;
  String? mobilenumber;
  String? email;
  dynamic emailVerifiedAt;
  int? active;
  DateTime? createdAt;
  DateTime? updatedAt;

  Users copyWith({
    int? id,
    String? firstname,
    String? lastname,
    String? address,
    String? mobilenumber,
    String? email,
    dynamic emailVerifiedAt,
    int? active,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Users(
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        address: address ?? this.address,
        mobilenumber: mobilenumber ?? this.mobilenumber,
        email: email ?? this.email,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        active: active ?? this.active,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        address: json["address"],
        mobilenumber: json["mobilenumber"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        active: json["active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "address": address,
        "mobilenumber": mobilenumber,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "active": active,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
