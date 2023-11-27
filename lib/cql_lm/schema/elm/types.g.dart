// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vocabulary _$VocabularyFromJson(Map<String, dynamic> json) => Vocabulary(
      json['id'] as String,
      version: json['version'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$VocabularyToJson(Vocabulary instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('version', instance.version);
  writeNotNull('name', instance.name);
  return val;
}

ValueSet _$ValueSetFromJson(Map<String, dynamic> json) => ValueSet(
      json['id'] as String,
      version: json['version'] as String?,
      name: json['name'] as String?,
      codeSystem: (json['codeSystem'] as List<dynamic>?)
          ?.map((e) => CodeSystem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ValueSetToJson(ValueSet instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('version', instance.version);
  writeNotNull('name', instance.name);
  writeNotNull(
      'codeSystem', instance.codeSystem?.map((e) => e.toJson()).toList());
  return val;
}

CodeSystem _$CodeSystemFromJson(Map<String, dynamic> json) => CodeSystem(
      json['id'] as String,
      version: json['version'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CodeSystemToJson(CodeSystem instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('version', instance.version);
  writeNotNull('name', instance.name);
  return val;
}

IntegerInterval _$IntegerIntervalFromJson(Map<String, dynamic> json) =>
    IntegerInterval(
      low: json['low'] == null ? null : FhirInteger.fromJson(json['low']),
      high: json['high'] == null ? null : FhirInteger.fromJson(json['high']),
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
              json['resultTypeSpecifier'] as Map<String, dynamic>)
      ..value = json['value']
      ..lowClosedExpression = json['lowClosedExpression'] == null
          ? null
          : Expression.fromJson(
              json['lowClosedExpression'] as Map<String, dynamic>)
      ..highClosedExpression = json['highClosedExpression'] == null
          ? null
          : Expression.fromJson(
              json['highClosedExpression'] as Map<String, dynamic>)
      ..lowClosed = json['lowClosed'] as bool
      ..highClosed = json['highClosed'] as bool;

Map<String, dynamic> _$IntegerIntervalToJson(IntegerInterval instance) {
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
  writeNotNull('value', instance.value);
  writeNotNull('lowClosedExpression', instance.lowClosedExpression?.toJson());
  writeNotNull('highClosedExpression', instance.highClosedExpression?.toJson());
  val['lowClosed'] = instance.lowClosed;
  val['highClosed'] = instance.highClosed;
  writeNotNull('low', instance.low?.toJson());
  writeNotNull('high', instance.high?.toJson());
  return val;
}

DecimalInterval _$DecimalIntervalFromJson(Map<String, dynamic> json) =>
    DecimalInterval(
      low: json['low'] == null ? null : FhirDecimal.fromJson(json['low']),
      high: json['high'] == null ? null : FhirDecimal.fromJson(json['high']),
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
              json['resultTypeSpecifier'] as Map<String, dynamic>)
      ..value = json['value']
      ..lowClosedExpression = json['lowClosedExpression'] == null
          ? null
          : Expression.fromJson(
              json['lowClosedExpression'] as Map<String, dynamic>)
      ..highClosedExpression = json['highClosedExpression'] == null
          ? null
          : Expression.fromJson(
              json['highClosedExpression'] as Map<String, dynamic>)
      ..lowClosed = json['lowClosed'] as bool
      ..highClosed = json['highClosed'] as bool;

Map<String, dynamic> _$DecimalIntervalToJson(DecimalInterval instance) {
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
  writeNotNull('value', instance.value);
  writeNotNull('lowClosedExpression', instance.lowClosedExpression?.toJson());
  writeNotNull('highClosedExpression', instance.highClosedExpression?.toJson());
  val['lowClosed'] = instance.lowClosed;
  val['highClosed'] = instance.highClosed;
  writeNotNull('low', instance.low?.toJson());
  writeNotNull('high', instance.high?.toJson());
  return val;
}

DateInterval _$DateIntervalFromJson(Map<String, dynamic> json) => DateInterval(
      low: json['low'] == null ? null : FhirDate.fromJson(json['low']),
      high: json['high'] == null ? null : FhirDate.fromJson(json['high']),
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
              json['resultTypeSpecifier'] as Map<String, dynamic>)
      ..value = json['value']
      ..lowClosedExpression = json['lowClosedExpression'] == null
          ? null
          : Expression.fromJson(
              json['lowClosedExpression'] as Map<String, dynamic>)
      ..highClosedExpression = json['highClosedExpression'] == null
          ? null
          : Expression.fromJson(
              json['highClosedExpression'] as Map<String, dynamic>)
      ..lowClosed = json['lowClosed'] as bool
      ..highClosed = json['highClosed'] as bool;

Map<String, dynamic> _$DateIntervalToJson(DateInterval instance) {
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
  writeNotNull('value', instance.value);
  writeNotNull('lowClosedExpression', instance.lowClosedExpression?.toJson());
  writeNotNull('highClosedExpression', instance.highClosedExpression?.toJson());
  val['lowClosed'] = instance.lowClosed;
  val['highClosed'] = instance.highClosed;
  writeNotNull('low', instance.low?.toJson());
  writeNotNull('high', instance.high?.toJson());
  return val;
}

DateTimeInterval _$DateTimeIntervalFromJson(Map<String, dynamic> json) =>
    DateTimeInterval(
      low: json['low'] == null ? null : FhirDateTime.fromJson(json['low']),
      high: json['high'] == null ? null : FhirDateTime.fromJson(json['high']),
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
              json['resultTypeSpecifier'] as Map<String, dynamic>)
      ..value = json['value']
      ..lowClosedExpression = json['lowClosedExpression'] == null
          ? null
          : Expression.fromJson(
              json['lowClosedExpression'] as Map<String, dynamic>)
      ..highClosedExpression = json['highClosedExpression'] == null
          ? null
          : Expression.fromJson(
              json['highClosedExpression'] as Map<String, dynamic>)
      ..lowClosed = json['lowClosed'] as bool
      ..highClosed = json['highClosed'] as bool;

Map<String, dynamic> _$DateTimeIntervalToJson(DateTimeInterval instance) {
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
  writeNotNull('value', instance.value);
  writeNotNull('lowClosedExpression', instance.lowClosedExpression?.toJson());
  writeNotNull('highClosedExpression', instance.highClosedExpression?.toJson());
  val['lowClosed'] = instance.lowClosed;
  val['highClosed'] = instance.highClosed;
  writeNotNull('low', instance.low?.toJson());
  writeNotNull('high', instance.high?.toJson());
  return val;
}

TimeInterval _$TimeIntervalFromJson(Map<String, dynamic> json) => TimeInterval(
      low: json['low'] == null ? null : FhirTime.fromJson(json['low']),
      high: json['high'] == null ? null : FhirTime.fromJson(json['high']),
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
              json['resultTypeSpecifier'] as Map<String, dynamic>)
      ..value = json['value']
      ..lowClosedExpression = json['lowClosedExpression'] == null
          ? null
          : Expression.fromJson(
              json['lowClosedExpression'] as Map<String, dynamic>)
      ..highClosedExpression = json['highClosedExpression'] == null
          ? null
          : Expression.fromJson(
              json['highClosedExpression'] as Map<String, dynamic>)
      ..lowClosed = json['lowClosed'] as bool
      ..highClosed = json['highClosed'] as bool;

Map<String, dynamic> _$TimeIntervalToJson(TimeInterval instance) {
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
  writeNotNull('value', instance.value);
  writeNotNull('lowClosedExpression', instance.lowClosedExpression?.toJson());
  writeNotNull('highClosedExpression', instance.highClosedExpression?.toJson());
  val['lowClosed'] = instance.lowClosed;
  val['highClosed'] = instance.highClosed;
  writeNotNull('low', instance.low?.toJson());
  writeNotNull('high', instance.high?.toJson());
  return val;
}
