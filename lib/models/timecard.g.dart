// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timecard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Timecard _$TimecardFromJson(Map<String, dynamic> json) => _Timecard(
  id: (json['id'] as num).toInt(),
  uuid: json['uuid'] as String,
  clock_in: json['clock_in'] == null
      ? null
      : DateTime.parse(json['clock_in'] as String),
  clock_out: json['clock_out'] == null
      ? null
      : DateTime.parse(json['clock_out'] as String),
  lunch_start: json['lunch_start'] == null
      ? null
      : DateTime.parse(json['lunch_start'] as String),
  lunch_end: json['lunch_end'] == null
      ? null
      : DateTime.parse(json['lunch_end'] as String),
);

Map<String, dynamic> _$TimecardToJson(_Timecard instance) => <String, dynamic>{
  'id': instance.id,
  'uuid': instance.uuid,
  'clock_in': instance.clock_in?.toIso8601String(),
  'clock_out': instance.clock_out?.toIso8601String(),
  'lunch_start': instance.lunch_start?.toIso8601String(),
  'lunch_end': instance.lunch_end?.toIso8601String(),
};
