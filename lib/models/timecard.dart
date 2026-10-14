import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timecard.freezed.dart';
part 'timecard.g.dart';

@freezed
abstract class Timecard with _$Timecard {
  const factory Timecard({required String first, required String last}) =
      _Timecard;

  factory Timecard.fromJson(Map<String, dynamic> json) =>
      _$TimecardFromJson(json);
}
