// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BindingInfo _$BindingInfoFromJson(Map<String, dynamic> json) => BindingInfo(
      name: json['name'] as String?,
      description: json['description'] as String?,
      strength: $enumDecodeNullable(_$BindingStrengthEnumMap, json['strength']),
      valueSet: json['valueSet'] as String?,
    );

Map<String, dynamic> _$BindingInfoToJson(BindingInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('strength', _$BindingStrengthEnumMap[instance.strength]);
  writeNotNull('valueSet', instance.valueSet);
  return val;
}

const _$BindingStrengthEnumMap = {
  BindingStrength.required: 'Required',
  BindingStrength.extensible: 'Extensible',
  BindingStrength.preferred: 'Preferred',
  BindingStrength.example: 'Example',
};

ConstraintInfo _$ConstraintInfoFromJson(Map<String, dynamic> json) =>
    ConstraintInfo(
      expression: (json['expression'] as List<dynamic>?)
          ?.map((e) => ExpressionInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      severity: json['severity'] as String?,
      description: json['description'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ConstraintInfoToJson(ConstraintInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'expression', instance.expression?.map((e) => e.toJson()).toList());
  writeNotNull('name', instance.name);
  writeNotNull('severity', instance.severity);
  writeNotNull('description', instance.description);
  writeNotNull('message', instance.message);
  return val;
}

ExpressionInfo _$ExpressionInfoFromJson(Map<String, dynamic> json) =>
    ExpressionInfo(
      language: json['language'] as String?,
      expression: json['expression'] as String?,
    );

Map<String, dynamic> _$ExpressionInfoToJson(ExpressionInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('language', instance.language);
  writeNotNull('expression', instance.expression);
  return val;
}

SearchInfo _$SearchInfoFromJson(Map<String, dynamic> json) => SearchInfo(
      typeSpecifier: json['typeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['typeSpecifier'] as Map<String, dynamic>),
      name: json['name'] as String?,
      path: json['path'] as String?,
      type: json['type'] as String?,
      label: json['label'] as String?,
      description: json['description'] as String?,
      definition: json['definition'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$SearchInfoToJson(SearchInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('typeSpecifier', instance.typeSpecifier?.toJson());
  writeNotNull('name', instance.name);
  writeNotNull('path', instance.path);
  writeNotNull('type', instance.type);
  writeNotNull('label', instance.label);
  writeNotNull('description', instance.description);
  writeNotNull('definition', instance.definition);
  writeNotNull('comment', instance.comment);
  return val;
}
