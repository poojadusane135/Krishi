import 'package:flutter/foundation.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final String fieldArea;
  final String email;
  // Add other fields as needed

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.fieldArea,
    required this.email,
    // Add other fields as needed
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      fieldArea: json['fieldArea'] ?? '',
      email: json['email'] ?? '',
      // Add other fields as needed
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'fieldArea': fieldArea,
      'email': email,
      // Add other fields as needed
    };
  }
}
