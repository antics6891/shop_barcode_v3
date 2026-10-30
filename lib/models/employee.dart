import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
abstract class EmployeeModel with _$EmployeeModel {
  const factory EmployeeModel({
    required String firstName,
    required String lastName,
    required String uuid,
  }) = _EmployeeModel;

  factory EmployeeModel.fromJson(Map<String, Object?> json) =>
      _$EmployeeModelFromJson(json);
}
