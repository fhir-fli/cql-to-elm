// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expression.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeSpecifier _$TypeSpecifierFromJson(Map<String, dynamic> json) =>
    TypeSpecifier(
      localId: json['localId'] as String?,
      locator: json['locator'] as String?,
      resultTypeName: json['resultTypeName'] as String?,
      annotation: (json['annotation'] as List<dynamic>?)
          ?.map((e) => Element.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultTypeSpecifier: json['resultTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['resultTypeSpecifier'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypeSpecifierToJson(TypeSpecifier instance) {
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
  return val;
}

TupleElementDefinition _$TupleElementDefinitionFromJson(
        Map<String, dynamic> json) =>
    TupleElementDefinition(
      name: json['name'] as String,
    )
      ..type = json['type'] == null
          ? null
          : TypeSpecifier.fromJson(json['type'] as Map<String, dynamic>)
      ..elementType = json['elementType'] == null
          ? null
          : TypeSpecifier.fromJson(json['elementType'] as Map<String, dynamic>);

Map<String, dynamic> _$TupleElementDefinitionToJson(
    TupleElementDefinition instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type?.toJson());
  writeNotNull('elementType', instance.elementType?.toJson());
  return val;
}

TupleTypeSpecifier _$TupleTypeSpecifierFromJson(Map<String, dynamic> json) =>
    TupleTypeSpecifier(
      element: (json['element'] as List<dynamic>?)
          ?.map(
              (e) => TupleElementDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..localId = json['localId'] as String?
      ..locator = json['locator'] as String?
      ..resultTypeName = json['resultTypeName'] as String?
      ..annotation = (json['annotation'] as List<dynamic>?)
          ?.map((e) => Element.fromJson(e as Map<String, dynamic>))
          .toList()
      ..resultTypeSpecifier = json['resultTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['resultTypeSpecifier'] as Map<String, dynamic>);

Map<String, dynamic> _$TupleTypeSpecifierToJson(TupleTypeSpecifier instance) {
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
  writeNotNull('element', instance.element?.map((e) => e.toJson()).toList());
  return val;
}

ChoiceTypeSpecifier _$ChoiceTypeSpecifierFromJson(Map<String, dynamic> json) =>
    ChoiceTypeSpecifier(
      type: (json['type'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      choice: (json['choice'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..localId = json['localId'] as String?
      ..locator = json['locator'] as String?
      ..resultTypeName = json['resultTypeName'] as String?
      ..annotation = (json['annotation'] as List<dynamic>?)
          ?.map((e) => Element.fromJson(e as Map<String, dynamic>))
          .toList()
      ..resultTypeSpecifier = json['resultTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['resultTypeSpecifier'] as Map<String, dynamic>);

Map<String, dynamic> _$ChoiceTypeSpecifierToJson(ChoiceTypeSpecifier instance) {
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
  writeNotNull('type', instance.type?.map((e) => e.toJson()).toList());
  writeNotNull('choice', instance.choice?.map((e) => e.toJson()).toList());
  return val;
}

Expression _$ExpressionFromJson(Map<String, dynamic> json) => Expression();

Map<String, dynamic> _$ExpressionToJson(Expression instance) =>
    <String, dynamic>{};

OperatorExpression _$OperatorExpressionFromJson(Map<String, dynamic> json) =>
    OperatorExpression(
      signature: (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OperatorExpressionToJson(OperatorExpression instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  return val;
}

UnaryExpression _$UnaryExpressionFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return UnaryExpression(
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$UnaryExpressionToJson(UnaryExpression instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.toJson();
  return val;
}

BinaryExpression _$BinaryExpressionFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return BinaryExpression(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$BinaryExpressionToJson(BinaryExpression instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  return val;
}

TernaryExpression _$TernaryExpressionFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return TernaryExpression(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$TernaryExpressionToJson(TernaryExpression instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  return val;
}

NaryExpression _$NaryExpressionFromJson(Map<String, dynamic> json) =>
    NaryExpression(
      operand: (json['operand'] as List<dynamic>?)
          ?.map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..signature = (json['signature'] as List<dynamic>?)
        ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$NaryExpressionToJson(NaryExpression instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.map((e) => e.toJson()).toList());
  return val;
}

ExpressionDef _$ExpressionDefFromJson(Map<String, dynamic> json) =>
    ExpressionDef(
      name: json['name'] as String?,
      expression: json['expression'] == null
          ? null
          : Expression.fromJson(json['expression'] as Map<String, dynamic>),
      context: json['context'] as String?,
      accessLevel:
          $enumDecodeNullable(_$AccessModifierEnumMap, json['accessLevel']) ??
              AccessModifier.Public,
    );

Map<String, dynamic> _$ExpressionDefToJson(ExpressionDef instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expression', instance.expression?.toJson());
  writeNotNull('name', instance.name);
  writeNotNull('context', instance.context);
  val['accessLevel'] = _$AccessModifierEnumMap[instance.accessLevel]!;
  return val;
}

const _$AccessModifierEnumMap = {
  AccessModifier.Public: 'Public',
  AccessModifier.Private: 'Private',
};

ParameterDef _$ParameterDefFromJson(Map<String, dynamic> json) => ParameterDef(
      name: json['name'] as String?,
      parameterType: json['parameterType'] as String?,
      accessLevel:
          $enumDecodeNullable(_$AccessModifierEnumMap, json['accessLevel']) ??
              AccessModifier.Public,
      defaultExpr: json['defaultExpr'] == null
          ? null
          : Expression.fromJson(json['defaultExpr'] as Map<String, dynamic>),
      parameterTypeSpecifier: json['parameterTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['parameterTypeSpecifier'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ParameterDefToJson(ParameterDef instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('parameterType', instance.parameterType);
  val['accessLevel'] = _$AccessModifierEnumMap[instance.accessLevel]!;
  writeNotNull('defaultExpr', instance.defaultExpr?.toJson());
  writeNotNull(
      'parameterTypeSpecifier', instance.parameterTypeSpecifier?.toJson());
  return val;
}

Interval _$IntervalFromJson(Map<String, dynamic> json) => Interval(
      low: json['low'],
      lowClosedExpression: json['lowClosedExpression'] == null
          ? null
          : Expression.fromJson(
              json['lowClosedExpression'] as Map<String, dynamic>),
      high: json['high'],
      highClosedExpression: json['highClosedExpression'] == null
          ? null
          : Expression.fromJson(
              json['highClosedExpression'] as Map<String, dynamic>),
      lowClosed: json['lowClosed'] as bool? ?? true,
      highClosed: json['highClosed'] as bool? ?? true,
    );

Map<String, dynamic> _$IntervalToJson(Interval instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('low', instance.low);
  writeNotNull('lowClosedExpression', instance.lowClosedExpression?.toJson());
  writeNotNull('high', instance.high);
  writeNotNull('highClosedExpression', instance.highClosedExpression?.toJson());
  val['lowClosed'] = instance.lowClosed;
  val['highClosed'] = instance.highClosed;
  return val;
}

IntegerInterval _$IntegerIntervalFromJson(Map<String, dynamic> json) =>
    IntegerInterval(
      low: json['low'] == null ? null : FhirInteger.fromJson(json['low']),
      high: json['high'] == null ? null : FhirInteger.fromJson(json['high']),
    )
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

  writeNotNull('low', instance.low);
  writeNotNull('lowClosedExpression', instance.lowClosedExpression?.toJson());
  writeNotNull('high', instance.high);
  writeNotNull('highClosedExpression', instance.highClosedExpression?.toJson());
  val['lowClosed'] = instance.lowClosed;
  val['highClosed'] = instance.highClosed;
  return val;
}

DecimalInterval _$DecimalIntervalFromJson(Map<String, dynamic> json) =>
    DecimalInterval(
      low: json['low'] == null ? null : FhirDecimal.fromJson(json['low']),
      high: json['high'] == null ? null : FhirDecimal.fromJson(json['high']),
    )
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

  writeNotNull('low', instance.low);
  writeNotNull('lowClosedExpression', instance.lowClosedExpression?.toJson());
  writeNotNull('high', instance.high);
  writeNotNull('highClosedExpression', instance.highClosedExpression?.toJson());
  val['lowClosed'] = instance.lowClosed;
  val['highClosed'] = instance.highClosed;
  return val;
}

QuantityInterval _$QuantityIntervalFromJson(Map<String, dynamic> json) =>
    QuantityInterval(
      low: json['low'] == null
          ? null
          : Quantity.fromJson(json['low'] as Map<String, dynamic>),
      high: json['high'] == null
          ? null
          : Quantity.fromJson(json['high'] as Map<String, dynamic>),
    )
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

Map<String, dynamic> _$QuantityIntervalToJson(QuantityInterval instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('low', instance.low);
  writeNotNull('lowClosedExpression', instance.lowClosedExpression?.toJson());
  writeNotNull('high', instance.high);
  writeNotNull('highClosedExpression', instance.highClosedExpression?.toJson());
  val['lowClosed'] = instance.lowClosed;
  val['highClosed'] = instance.highClosed;
  return val;
}

DateInterval _$DateIntervalFromJson(Map<String, dynamic> json) => DateInterval(
      low: json['low'] == null ? null : FhirDate.fromJson(json['low']),
      high: json['high'] == null ? null : FhirDate.fromJson(json['high']),
    )
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

  writeNotNull('low', instance.low);
  writeNotNull('lowClosedExpression', instance.lowClosedExpression?.toJson());
  writeNotNull('high', instance.high);
  writeNotNull('highClosedExpression', instance.highClosedExpression?.toJson());
  val['lowClosed'] = instance.lowClosed;
  val['highClosed'] = instance.highClosed;
  return val;
}

DateTimeInterval _$DateTimeIntervalFromJson(Map<String, dynamic> json) =>
    DateTimeInterval(
      low: json['low'] == null ? null : FhirDateTime.fromJson(json['low']),
      high: json['high'] == null ? null : FhirDateTime.fromJson(json['high']),
    )
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

  writeNotNull('low', instance.low);
  writeNotNull('lowClosedExpression', instance.lowClosedExpression?.toJson());
  writeNotNull('high', instance.high);
  writeNotNull('highClosedExpression', instance.highClosedExpression?.toJson());
  val['lowClosed'] = instance.lowClosed;
  val['highClosed'] = instance.highClosed;
  return val;
}

TimeInterval _$TimeIntervalFromJson(Map<String, dynamic> json) => TimeInterval(
      low: json['low'] == null ? null : FhirTime.fromJson(json['low']),
      high: json['high'] == null ? null : FhirTime.fromJson(json['high']),
    )
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

  writeNotNull('low', instance.low);
  writeNotNull('lowClosedExpression', instance.lowClosedExpression?.toJson());
  writeNotNull('high', instance.high);
  writeNotNull('highClosedExpression', instance.highClosedExpression?.toJson());
  val['lowClosed'] = instance.lowClosed;
  val['highClosed'] = instance.highClosed;
  return val;
}
