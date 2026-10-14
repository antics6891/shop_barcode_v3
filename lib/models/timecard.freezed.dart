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

/// @nodoc
mixin _$Timecard implements DiagnosticableTreeMixin {

 String get first; String get last;
/// Create a copy of Timecard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimecardCopyWith<Timecard> get copyWith => _$TimecardCopyWithImpl<Timecard>(this as Timecard, _$identity);

  /// Serializes this Timecard to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as Timecard;
  properties
    ..add(DiagnosticsProperty('type', 'Timecard'))
    ..add(DiagnosticsProperty('first', _this.first))..add(DiagnosticsProperty('last', _this.last));
}

@override
bool operator ==(Object other) {
  final _this = this as Timecard;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Timecard&&(identical(other.first, _this.first) || other.first == _this.first)&&(identical(other.last, _this.last) || other.last == _this.last));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Timecard;
  return Object.hash(runtimeType,_this.first,_this.last);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as Timecard;
  return 'Timecard(first: ${_this.first}, last: ${_this.last})';
}


}

/// @nodoc
abstract mixin class $TimecardCopyWith<$Res>  {
  factory $TimecardCopyWith(Timecard value, $Res Function(Timecard) _then) = _$TimecardCopyWithImpl;
@useResult
$Res call({
 String first, String last
});




}
/// @nodoc
class _$TimecardCopyWithImpl<$Res>
    implements $TimecardCopyWith<$Res> {
  _$TimecardCopyWithImpl(this._self, this._then);

  final Timecard _self;
  final $Res Function(Timecard) _then;

/// Create a copy of Timecard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? first = null,Object? last = null,}) {
  return _then(Timecard(
first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as String,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Timecard].
extension TimecardPatterns on Timecard {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String first,  String last)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Timecard() when $default != null:
return $default(_that.first,_that.last);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String first,  String last)  $default,) {final _that = this;
switch (_that) {
case _Timecard():
return $default(_that.first,_that.last);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String first,  String last)?  $default,) {final _that = this;
switch (_that) {
case _Timecard() when $default != null:
return $default(_that.first,_that.last);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Timecard with DiagnosticableTreeMixin implements Timecard {
  const _Timecard({required this.first, required this.last});
  factory _Timecard.fromJson(Map<String, dynamic> json) => _$TimecardFromJson(json);

@override final  String first;
@override final  String last;

/// Create a copy of Timecard
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
    ..add(DiagnosticsProperty('type', 'Timecard'))
    ..add(DiagnosticsProperty('first', first))..add(DiagnosticsProperty('last', last));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Timecard&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,first,last);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'Timecard(first: $first, last: $last)';
}


}

/// @nodoc
abstract mixin class _$TimecardCopyWith<$Res> implements $TimecardCopyWith<$Res> {
  factory _$TimecardCopyWith(_Timecard value, $Res Function(_Timecard) _then) = __$TimecardCopyWithImpl;
@override @useResult
$Res call({
 String first, String last
});




}
/// @nodoc
class __$TimecardCopyWithImpl<$Res>
    implements _$TimecardCopyWith<$Res> {
  __$TimecardCopyWithImpl(this._self, this._then);

  final _Timecard _self;
  final $Res Function(_Timecard) _then;

/// Create a copy of Timecard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? first = null,Object? last = null,}) {
  return _then(_Timecard(
first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as String,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
