// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmployeeModel implements DiagnosticableTreeMixin {

 String get firstName; String get lastName; String get uuid;
/// Create a copy of EmployeeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeModelCopyWith<EmployeeModel> get copyWith => _$EmployeeModelCopyWithImpl<EmployeeModel>(this as EmployeeModel, _$identity);

  /// Serializes this EmployeeModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as EmployeeModel;
  properties
    ..add(DiagnosticsProperty('type', 'EmployeeModel'))
    ..add(DiagnosticsProperty('firstName', _this.firstName))..add(DiagnosticsProperty('lastName', _this.lastName))..add(DiagnosticsProperty('uuid', _this.uuid));
}

@override
bool operator ==(Object other) {
  final _this = this as EmployeeModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeModel&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.uuid, _this.uuid) || other.uuid == _this.uuid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EmployeeModel;
  return Object.hash(runtimeType,_this.firstName,_this.lastName,_this.uuid);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as EmployeeModel;
  return 'EmployeeModel(firstName: ${_this.firstName}, lastName: ${_this.lastName}, uuid: ${_this.uuid})';
}


}

/// @nodoc
abstract mixin class $EmployeeModelCopyWith<$Res>  {
  factory $EmployeeModelCopyWith(EmployeeModel value, $Res Function(EmployeeModel) _then) = _$EmployeeModelCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName, String uuid
});




}
/// @nodoc
class _$EmployeeModelCopyWithImpl<$Res>
    implements $EmployeeModelCopyWith<$Res> {
  _$EmployeeModelCopyWithImpl(this._self, this._then);

  final EmployeeModel _self;
  final $Res Function(EmployeeModel) _then;

/// Create a copy of EmployeeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? uuid = null,}) {
  return _then(EmployeeModel(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EmployeeModel].
extension EmployeeModelPatterns on EmployeeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmployeeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmployeeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmployeeModel value)  $default,){
final _that = this;
switch (_that) {
case _EmployeeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmployeeModel value)?  $default,){
final _that = this;
switch (_that) {
case _EmployeeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String uuid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmployeeModel() when $default != null:
return $default(_that.firstName,_that.lastName,_that.uuid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String uuid)  $default,) {final _that = this;
switch (_that) {
case _EmployeeModel():
return $default(_that.firstName,_that.lastName,_that.uuid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstName,  String lastName,  String uuid)?  $default,) {final _that = this;
switch (_that) {
case _EmployeeModel() when $default != null:
return $default(_that.firstName,_that.lastName,_that.uuid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmployeeModel with DiagnosticableTreeMixin implements EmployeeModel {
  const _EmployeeModel({required this.firstName, required this.lastName, required this.uuid});
  factory _EmployeeModel.fromJson(Map<String, dynamic> json) => _$EmployeeModelFromJson(json);

@override final  String firstName;
@override final  String lastName;
@override final  String uuid;

/// Create a copy of EmployeeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeModelCopyWith<_EmployeeModel> get copyWith => __$EmployeeModelCopyWithImpl<_EmployeeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmployeeModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'EmployeeModel'))
    ..add(DiagnosticsProperty('firstName', firstName))..add(DiagnosticsProperty('lastName', lastName))..add(DiagnosticsProperty('uuid', uuid));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.uuid, uuid) || other.uuid == uuid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,firstName,lastName,uuid);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'EmployeeModel(firstName: $firstName, lastName: $lastName, uuid: $uuid)';
}


}

/// @nodoc
abstract mixin class _$EmployeeModelCopyWith<$Res> implements $EmployeeModelCopyWith<$Res> {
  factory _$EmployeeModelCopyWith(_EmployeeModel value, $Res Function(_EmployeeModel) _then) = __$EmployeeModelCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String lastName, String uuid
});




}
/// @nodoc
class __$EmployeeModelCopyWithImpl<$Res>
    implements _$EmployeeModelCopyWith<$Res> {
  __$EmployeeModelCopyWithImpl(this._self, this._then);

  final _EmployeeModel _self;
  final $Res Function(_EmployeeModel) _then;

/// Create a copy of EmployeeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? uuid = null,}) {
  return _then(_EmployeeModel(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
