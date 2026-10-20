import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
abstract class Employee with _$Employee {
  const factory Employee({
    required String firstName,
    required String lastName,
    required String uuid,
  }) = _Employee;

  factory Employee.fromJson(Map<String, Object?> json) =>
      _$EmployeeFromJson(json);
}
