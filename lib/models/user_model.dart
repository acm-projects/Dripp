import 'package:flutter/material.dart';

class UserModel {
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.uid,
  });

  String firstName;
  String lastName;
  String email;
  String uid;
  //String? image;

  Map<String, dynamic> toJson() => {
        'first name': firstName,
        'last name': lastName,
        'email': email,
        'uid': uid,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json['first name'],
        lastName: json['last name'],
        email: json['email'],
        uid: json['uid'],
      );
}
