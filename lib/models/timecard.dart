import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timecard.freezed.dart';
part 'timecard.g.dart';

@freezed
abstract class TimecardModel with _$TimecardModel {
  const factory TimecardModel({
    required int id,
    required String uuid,
    DateTime? clock_in,
    DateTime? clock_out,
    DateTime? lunch_start,
    DateTime? lunch_end,
  }) = _Timecard;

  factory TimecardModel.fromJson(Map<String, dynamic> json) =>
      _$TimecardModelFromJson(json);
}
