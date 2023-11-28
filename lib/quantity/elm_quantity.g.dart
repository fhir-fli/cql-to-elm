// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elm_quantity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ElmQuantityImpl _$$ElmQuantityImplFromJson(Map<String, dynamic> json) =>
    _$ElmQuantityImpl(
      value: json['value'] == null ? null : FhirDecimal.fromJson(json['value']),
      unit: json['unit'] as String?,
      system: json['system'] == null ? null : FhirUri.fromJson(json['system']),
      code: json['code'] == null ? null : FhirCode.fromJson(json['code']),
    )
      ..localId = json['localId'] as String?
      ..locator = json['locator'] as String?
      ..resultTypeName = json['resultTypeName'] as String?
      ..annotation = (json['annotation'] as List<dynamic>?)
          ?.map((e) => CqlToElmBase.fromJson(e as Map<String, dynamic>))
          .toList()
      ..resultTypeSpecifier = json['resultTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['resultTypeSpecifier'] as Map<String, dynamic>);

Map<String, dynamic> _$$ElmQuantityImplToJson(_$ElmQuantityImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('localId', instance.localId);
  writeNotNull('locator', instance.locator);
  writeNotNull('resultTypeName', instance.resultTypeName);
  writeNotNull(
      'annotation', instance.annotation?.map((e) => e.toJson()).toList());
  writeNotNull('resultTypeSpecifier', instance.resultTypeSpecifier?.toJson());
  writeNotNull('value', instance.value?.toJson());
  writeNotNull('unit', instance.unit);
  writeNotNull('system', instance.system?.toJson());
  writeNotNull('code', instance.code?.toJson());
  return val;
}
