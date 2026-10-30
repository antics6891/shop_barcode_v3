// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) =>
    _EmployeeModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      uuid: json['uuid'] as String,
    );

Map<String, dynamic> _$EmployeeModelToJson(_EmployeeModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'uuid': instance.uuid,
    };
