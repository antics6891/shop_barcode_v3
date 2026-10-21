// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timecard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
TimecardModel _$TimecardModelFromJson(
  Map<String, dynamic> json
) {
    return _Timecard.fromJson(
      json
    );
}

/// @nodoc
mixin _$TimecardModel implements DiagnosticableTreeMixin {

 int get id; String get uuid; DateTime? get clock_in; DateTime? get clock_out; DateTime? get lunch_start; DateTime? get lunch_end;
/// Create a copy of TimecardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimecardModelCopyWith<TimecardModel> get copyWith => _$TimecardModelCopyWithImpl<TimecardModel>(this as TimecardModel, _$identity);

  /// Serializes this TimecardModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as TimecardModel;
  properties
    ..add(DiagnosticsProperty('type', 'TimecardModel'))
    ..add(DiagnosticsProperty('id', _this.id))..add(DiagnosticsProperty('uuid', _this.uuid))..add(DiagnosticsProperty('clock_in', _this.clock_in))..add(DiagnosticsProperty('clock_out', _this.clock_out))..add(DiagnosticsProperty('lunch_start', _this.lunch_start))..add(DiagnosticsProperty('lunch_end', _this.lunch_end));
}

@override
bool operator ==(Object other) {
  final _this = this as TimecardModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimecardModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.uuid, _this.uuid) || other.uuid == _this.uuid)&&(identical(other.clock_in, _this.clock_in) || other.clock_in == _this.clock_in)&&(identical(other.clock_out, _this.clock_out) || other.clock_out == _this.clock_out)&&(identical(other.lunch_start, _this.lunch_start) || other.lunch_start == _this.lunch_start)&&(identical(other.lunch_end, _this.lunch_end) || other.lunch_end == _this.lunch_end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TimecardModel;
  return Object.hash(runtimeType,_this.id,_this.uuid,_this.clock_in,_this.clock_out,_this.lunch_start,_this.lunch_end);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as TimecardModel;
  return 'TimecardModel(id: ${_this.id}, uuid: ${_this.uuid}, clock_in: ${_this.clock_in}, clock_out: ${_this.clock_out}, lunch_start: ${_this.lunch_start}, lunch_end: ${_this.lunch_end})';
}


}

/// @nodoc
abstract mixin class $TimecardModelCopyWith<$Res>  {
  factory $TimecardModelCopyWith(TimecardModel value, $Res Function(TimecardModel) _then) = _$TimecardModelCopyWithImpl;
@useResult
$Res call({
 int id, String uuid, DateTime? clock_in, DateTime? clock_out, DateTime? lunch_start, DateTime? lunch_end
});




}
/// @nodoc
class _$TimecardModelCopyWithImpl<$Res>
    implements $TimecardModelCopyWith<$Res> {
  _$TimecardModelCopyWithImpl(this._self, this._then);

  final TimecardModel _self;
  final $Res Function(TimecardModel) _then;

/// Create a copy of TimecardModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uuid = null,Object? clock_in = freezed,Object? clock_out = freezed,Object? lunch_start = freezed,Object? lunch_end = freezed,}) {
  return _then(TimecardModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,clock_in: freezed == clock_in ? _self.clock_in : clock_in // ignore: cast_nullable_to_non_nullable
as DateTime?,clock_out: freezed == clock_out ? _self.clock_out : clock_out // ignore: cast_nullable_to_non_nullable
as DateTime?,lunch_start: freezed == lunch_start ? _self.lunch_start : lunch_start // ignore: cast_nullable_to_non_nullable
as DateTime?,lunch_end: freezed == lunch_end ? _self.lunch_end : lunch_end // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TimecardModel].
extension TimecardModelPatterns on TimecardModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Timecard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Timecard() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Timecard value)  $default,){
final _that = this;
switch (_that) {
case _Timecard():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Timecard value)?  $default,){
final _that = this;
switch (_that) {
case _Timecard() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uuid,  DateTime? clock_in,  DateTime? clock_out,  DateTime? lunch_start,  DateTime? lunch_end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Timecard() when $default != null:
return $default(_that.id,_that.uuid,_that.clock_in,_that.clock_out,_that.lunch_start,_that.lunch_end);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uuid,  DateTime? clock_in,  DateTime? clock_out,  DateTime? lunch_start,  DateTime? lunch_end)  $default,) {final _that = this;
switch (_that) {
case _Timecard():
return $default(_that.id,_that.uuid,_that.clock_in,_that.clock_out,_that.lunch_start,_that.lunch_end);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uuid,  DateTime? clock_in,  DateTime? clock_out,  DateTime? lunch_start,  DateTime? lunch_end)?  $default,) {final _that = this;
switch (_that) {
case _Timecard() when $default != null:
return $default(_that.id,_that.uuid,_that.clock_in,_that.clock_out,_that.lunch_start,_that.lunch_end);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Timecard with DiagnosticableTreeMixin implements TimecardModel {
  const _Timecard({required this.id, required this.uuid, this.clock_in, this.clock_out, this.lunch_start, this.lunch_end});
  factory _Timecard.fromJson(Map<String, dynamic> json) => _$TimecardFromJson(json);

@override final  int id;
@override final  String uuid;
@override final  DateTime? clock_in;
@override final  DateTime? clock_out;
@override final  DateTime? lunch_start;
@override final  DateTime? lunch_end;

/// Create a copy of TimecardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimecardCopyWith<_Timecard> get copyWith => __$TimecardCopyWithImpl<_Timecard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimecardToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'TimecardModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('uuid', uuid))..add(DiagnosticsProperty('clock_in', clock_in))..add(DiagnosticsProperty('clock_out', clock_out))..add(DiagnosticsProperty('lunch_start', lunch_start))..add(DiagnosticsProperty('lunch_end', lunch_end));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Timecard&&(identical(other.id, id) || other.id == id)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.clock_in, clock_in) || other.clock_in == clock_in)&&(identical(other.clock_out, clock_out) || other.clock_out == clock_out)&&(identical(other.lunch_start, lunch_start) || other.lunch_start == lunch_start)&&(identical(other.lunch_end, lunch_end) || other.lunch_end == lunch_end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,uuid,clock_in,clock_out,lunch_start,lunch_end);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'TimecardModel(id: $id, uuid: $uuid, clock_in: $clock_in, clock_out: $clock_out, lunch_start: $lunch_start, lunch_end: $lunch_end)';
}


}

/// @nodoc
abstract mixin class _$TimecardCopyWith<$Res> implements $TimecardModelCopyWith<$Res> {
  factory _$TimecardCopyWith(_Timecard value, $Res Function(_Timecard) _then) = __$TimecardCopyWithImpl;
@override @useResult
$Res call({
 int id, String uuid, DateTime? clock_in, DateTime? clock_out, DateTime? lunch_start, DateTime? lunch_end
});




}
/// @nodoc
class __$TimecardCopyWithImpl<$Res>
    implements _$TimecardCopyWith<$Res> {
  __$TimecardCopyWithImpl(this._self, this._then);

  final _Timecard _self;
  final $Res Function(_Timecard) _then;

/// Create a copy of TimecardModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uuid = null,Object? clock_in = freezed,Object? clock_out = freezed,Object? lunch_start = freezed,Object? lunch_end = freezed,}) {
  return _then(_Timecard(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,clock_in: freezed == clock_in ? _self.clock_in : clock_in // ignore: cast_nullable_to_non_nullable
as DateTime?,clock_out: freezed == clock_out ? _self.clock_out : clock_out // ignore: cast_nullable_to_non_nullable
as DateTime?,lunch_start: freezed == lunch_start ? _self.lunch_start : lunch_start // ignore: cast_nullable_to_non_nullable
as DateTime?,lunch_end: freezed == lunch_end ? _self.lunch_end : lunch_end // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
