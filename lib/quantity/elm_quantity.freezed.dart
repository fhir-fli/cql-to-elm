// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'elm_quantity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ElmQuantity _$ElmQuantityFromJson(Map<String, dynamic> json) {
  return _ElmQuantity.fromJson(json);
}

/// @nodoc
mixin _$ElmQuantity {
  FhirDecimal? get value => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  FhirUri? get system => throw _privateConstructorUsedError;
  FhirCode? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElmQuantityCopyWith<ElmQuantity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElmQuantityCopyWith<$Res> {
  factory $ElmQuantityCopyWith(
          ElmQuantity value, $Res Function(ElmQuantity) then) =
      _$ElmQuantityCopyWithImpl<$Res, ElmQuantity>;
  @useResult
  $Res call(
      {FhirDecimal? value, String? unit, FhirUri? system, FhirCode? code});
}

/// @nodoc
class _$ElmQuantityCopyWithImpl<$Res, $Val extends ElmQuantity>
    implements $ElmQuantityCopyWith<$Res> {
  _$ElmQuantityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? unit = freezed,
    Object? system = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as FhirDecimal?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as FhirUri?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as FhirCode?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ElmQuantityImplCopyWith<$Res>
    implements $ElmQuantityCopyWith<$Res> {
  factory _$$ElmQuantityImplCopyWith(
          _$ElmQuantityImpl value, $Res Function(_$ElmQuantityImpl) then) =
      __$$ElmQuantityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FhirDecimal? value, String? unit, FhirUri? system, FhirCode? code});
}

/// @nodoc
class __$$ElmQuantityImplCopyWithImpl<$Res>
    extends _$ElmQuantityCopyWithImpl<$Res, _$ElmQuantityImpl>
    implements _$$ElmQuantityImplCopyWith<$Res> {
  __$$ElmQuantityImplCopyWithImpl(
      _$ElmQuantityImpl _value, $Res Function(_$ElmQuantityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? unit = freezed,
    Object? system = freezed,
    Object? code = freezed,
  }) {
    return _then(_$ElmQuantityImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as FhirDecimal?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as FhirUri?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as FhirCode?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ElmQuantityImpl extends _ElmQuantity {
  _$ElmQuantityImpl({this.value, this.unit, this.system, this.code})
      : super._();

  factory _$ElmQuantityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ElmQuantityImplFromJson(json);

  @override
  final FhirDecimal? value;
  @override
  final String? unit;
  @override
  final FhirUri? system;
  @override
  final FhirCode? code;

  @override
  String toString() {
    return 'ElmQuantity(value: $value, unit: $unit, system: $system, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElmQuantityImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.system, system) || other.system == system) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, unit, system, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ElmQuantityImplCopyWith<_$ElmQuantityImpl> get copyWith =>
      __$$ElmQuantityImplCopyWithImpl<_$ElmQuantityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ElmQuantityImplToJson(
      this,
    );
  }
}

abstract class _ElmQuantity extends ElmQuantity {
  factory _ElmQuantity(
      {final FhirDecimal? value,
      final String? unit,
      final FhirUri? system,
      final FhirCode? code}) = _$ElmQuantityImpl;
  _ElmQuantity._() : super._();

  factory _ElmQuantity.fromJson(Map<String, dynamic> json) =
      _$ElmQuantityImpl.fromJson;

  @override
  FhirDecimal? get value;
  @override
  String? get unit;
  @override
  FhirUri? get system;
  @override
  FhirCode? get code;
  @override
  @JsonKey(ignore: true)
  _$$ElmQuantityImplCopyWith<_$ElmQuantityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
