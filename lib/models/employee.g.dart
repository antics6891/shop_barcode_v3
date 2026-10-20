// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Employee _$EmployeeFromJson(Map<String, dynamic> json) => _Employee(
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  uuid: json['uuid'] as String,
);

Map<String, dynamic> _$EmployeeToJson(_Employee instance) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'uuid': instance.uuid,
};
