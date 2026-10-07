import 'package:flutter/foundation.dart' show immutable;

@immutable
class User {
  final String empId;
  final String firstName;
  final String lastName;
  final bool isLead;

  const User({
    required this.empId,
    required this.firstName,
    required this.lastName,
    required this.isLead,
  });
  Map<String, dynamic> toMap() {
    return {
      "empId": empId,
      "firstName": firstName,
      "lastName": lastName,
      "lead": isLead,
    };
  }
}
