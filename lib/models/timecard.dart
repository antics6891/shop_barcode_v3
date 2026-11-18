// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timecard.freezed.dart';
part 'timecard.g.dart';

@freezed
abstract class TimecardModel with _$TimecardModel {
  const factory TimecardModel({
    required int id,
    required String uuid,
    required DateTime? clock_in,
    required DateTime? clock_out,
    required DateTime? lunch_start,
    required DateTime? lunch_end,
  }) = _Timecard;

  factory TimecardModel.fromJson(Map<String, dynamic> json) =>
      _$TimecardModelFromJson(json);
}
