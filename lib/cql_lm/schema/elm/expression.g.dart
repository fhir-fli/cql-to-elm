// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expression.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElmElement _$ElmElementFromJson(Map<String, dynamic> json) => ElmElement(
      localId: json['localId'] as String?,
      locator: json['locator'] as String?,
      resultTypeName: json['resultTypeName'] as String?,
      annotation: (json['annotation'] as List<dynamic>?)
          ?.map((e) => CqlToElmBase.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultTypeSpecifier: json['resultTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['resultTypeSpecifier'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ElmElementToJson(ElmElement instance) {
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

FunctionDef _$FunctionDefFromJson(Map<String, dynamic> json) => FunctionDef(
      name: json['name'] as String?,
      context: json['context'] as String?,
      accessLevel:
          $enumDecodeNullable(_$AccessModifierEnumMap, json['accessLevel']) ??
              AccessModifier.Public,
      expression: json['expression'] == null
          ? null
          : Expression.fromJson(json['expression'] as Map<String, dynamic>),
      external: json['external'] as bool?,
      operand: (json['operand'] as List<dynamic>?)
          ?.map((e) => OperandDef.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FunctionDefToJson(FunctionDef instance) {
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
  writeNotNull('external', instance.external);
  writeNotNull('operand', instance.operand?.map((e) => e.toJson()).toList());
  return val;
}

ExpressionRef _$ExpressionRefFromJson(Map<String, dynamic> json) =>
    ExpressionRef(
      name: json['name'] as String?,
      libraryName: json['libraryName'] as String?,
    );

Map<String, dynamic> _$ExpressionRefToJson(ExpressionRef instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('libraryName', instance.libraryName);
  return val;
}

FunctionRef _$FunctionRefFromJson(Map<String, dynamic> json) => FunctionRef(
      name: json['name'] as String?,
      libraryName: json['libraryName'] as String?,
      signature: (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      operand: (json['operand'] as List<dynamic>?)
          ?.map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FunctionRefToJson(FunctionRef instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('libraryName', instance.libraryName);
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.map((e) => e.toJson()).toList());
  return val;
}

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

ParameterRef _$ParameterRefFromJson(Map<String, dynamic> json) => ParameterRef(
      name: json['name'] as String?,
      libraryName: json['libraryName'] as String?,
    );

Map<String, dynamic> _$ParameterRefToJson(ParameterRef instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('libraryName', instance.libraryName);
  return val;
}

OperandDef _$OperandDefFromJson(Map<String, dynamic> json) => OperandDef(
      name: json['name'] as String?,
      operandType: json['operandType'] as String?,
      operandTypeSpecifier: json['operandTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['operandTypeSpecifier'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OperandDefToJson(OperandDef instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('operandType', instance.operandType);
  writeNotNull('operandTypeSpecifier', instance.operandTypeSpecifier?.toJson());
  return val;
}

OperandRef _$OperandRefFromJson(Map<String, dynamic> json) => OperandRef(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$OperandRefToJson(OperandRef instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  return val;
}

IdentifierRef _$IdentifierRefFromJson(Map<String, dynamic> json) =>
    IdentifierRef(
      name: json['name'] as String?,
      libraryName: json['libraryName'] as String?,
    );

Map<String, dynamic> _$IdentifierRefToJson(IdentifierRef instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('libraryName', instance.libraryName);
  return val;
}

Literal _$LiteralFromJson(Map<String, dynamic> json) => Literal(
      valueType: QName.fromJson(json['valueType'] as Map<String, dynamic>),
      value: json['value'],
    );

Map<String, dynamic> _$LiteralToJson(Literal instance) {
  final val = <String, dynamic>{
    'valueType': instance.valueType.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('value', instance.value);
  return val;
}

TupleElement _$TupleElementFromJson(Map<String, dynamic> json) => TupleElement(
      name: json['name'] as String,
      value: Expression.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TupleElementToJson(TupleElement instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value.toJson(),
    };

Tuple _$TupleFromJson(Map<String, dynamic> json) => Tuple(
      element: (json['element'] as List<dynamic>)
          .map((e) => TupleElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TupleToJson(Tuple instance) => <String, dynamic>{
      'element': instance.element.map((e) => e.toJson()).toList(),
    };

InstanceElement _$InstanceElementFromJson(Map<String, dynamic> json) =>
    InstanceElement(
      name: json['name'] as String,
      value: Expression.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InstanceElementToJson(InstanceElement instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value.toJson(),
    };

Instance _$InstanceFromJson(Map<String, dynamic> json) => Instance(
      classType: QName.fromJson(json['classType'] as Map<String, dynamic>),
      element: (json['element'] as List<dynamic>)
          .map((e) => InstanceElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InstanceToJson(Instance instance) => <String, dynamic>{
      'classType': instance.classType.toJson(),
      'element': instance.element.map((e) => e.toJson()).toList(),
    };

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

ListSelector _$ListSelectorFromJson(Map<String, dynamic> json) => ListSelector(
      typeSpecifier: json['typeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['typeSpecifier'] as Map<String, dynamic>),
      element: (json['element'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListSelectorToJson(ListSelector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('typeSpecifier', instance.typeSpecifier?.toJson());
  val['element'] = instance.element.map((e) => e.toJson()).toList();
  return val;
}

And _$AndFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return And(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$AndToJson(And instance) {
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

Or _$OrFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Or(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$OrToJson(Or instance) {
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

Xor _$XorFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Xor(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$XorToJson(Xor instance) {
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

Implies _$ImpliesFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Implies(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$ImpliesToJson(Implies instance) {
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

Not _$NotFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Not(
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$NotToJson(Not instance) {
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

If _$IfFromJson(Map<String, dynamic> json) => If(
      condition: Expression.fromJson(json['condition'] as Map<String, dynamic>),
      then: Expression.fromJson(json['then'] as Map<String, dynamic>),
      elseExpression:
          Expression.fromJson(json['elseExpression'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IfToJson(If instance) => <String, dynamic>{
      'condition': instance.condition.toJson(),
      'then': instance.then.toJson(),
      'elseExpression': instance.elseExpression.toJson(),
    };

CaseItem _$CaseItemFromJson(Map<String, dynamic> json) => CaseItem(
      when: Expression.fromJson(json['when'] as Map<String, dynamic>),
      then: Expression.fromJson(json['then'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CaseItemToJson(CaseItem instance) => <String, dynamic>{
      'when': instance.when.toJson(),
      'then': instance.then.toJson(),
    };

Case _$CaseFromJson(Map<String, dynamic> json) => Case(
      comparand: json['comparand'] == null
          ? null
          : Expression.fromJson(json['comparand'] as Map<String, dynamic>),
      caseItems: (json['caseItems'] as List<dynamic>)
          .map((e) => CaseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      elseExpression:
          Expression.fromJson(json['elseExpression'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CaseToJson(Case instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('comparand', instance.comparand?.toJson());
  val['caseItems'] = instance.caseItems.map((e) => e.toJson()).toList();
  val['elseExpression'] = instance.elseExpression.toJson();
  return val;
}

Null _$NullFromJson(Map<String, dynamic> json) => Null(
      valueType: json['valueType'] == null
          ? null
          : QName.fromJson(json['valueType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NullToJson(Null instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('valueType', instance.valueType?.toJson());
  return val;
}

IsNull _$IsNullFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return IsNull(
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$IsNullToJson(IsNull instance) {
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

IsTrue _$IsTrueFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return IsTrue(
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$IsTrueToJson(IsTrue instance) {
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

IsFalse _$IsFalseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return IsFalse(
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$IsFalseToJson(IsFalse instance) {
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

Coalesce _$CoalesceFromJson(Map<String, dynamic> json) => Coalesce()
  ..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList()
  ..operand = (json['operand'] as List<dynamic>?)
      ?.map((e) => Expression.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$CoalesceToJson(Coalesce instance) {
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

Is _$IsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Is(
    isTypeSpecifier: json['isTypeSpecifier'] == null
        ? null
        : TypeSpecifier.fromJson(
            json['isTypeSpecifier'] as Map<String, dynamic>),
    isType: json['isType'] == null
        ? null
        : QName.fromJson(json['isType'] as Map<String, dynamic>),
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$IsToJson(Is instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.toJson();
  writeNotNull('isTypeSpecifier', instance.isTypeSpecifier?.toJson());
  writeNotNull('isType', instance.isType?.toJson());
  return val;
}

As _$AsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return As(
    asTypeSpecifier: json['asTypeSpecifier'] == null
        ? null
        : TypeSpecifier.fromJson(
            json['asTypeSpecifier'] as Map<String, dynamic>),
    asType: json['asType'] == null
        ? null
        : QName.fromJson(json['asType'] as Map<String, dynamic>),
    strict: json['strict'] as bool? ?? false,
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$AsToJson(As instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.toJson();
  writeNotNull('asTypeSpecifier', instance.asTypeSpecifier?.toJson());
  writeNotNull('asType', instance.asType?.toJson());
  val['strict'] = instance.strict;
  return val;
}

Convert _$ConvertFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Convert(
    toTypeSpecifier: json['toTypeSpecifier'] == null
        ? null
        : TypeSpecifier.fromJson(
            json['toTypeSpecifier'] as Map<String, dynamic>),
    toType: json['toType'] == null
        ? null
        : QName.fromJson(json['toType'] as Map<String, dynamic>),
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$ConvertToJson(Convert instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.toJson();
  writeNotNull('toTypeSpecifier', instance.toTypeSpecifier?.toJson());
  writeNotNull('toType', instance.toType?.toJson());
  return val;
}

CanConvert _$CanConvertFromJson(Map<String, dynamic> json) => CanConvert();

Map<String, dynamic> _$CanConvertToJson(CanConvert instance) =>
    <String, dynamic>{};

ConvertsToString _$ConvertsToStringFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return ConvertsToString(
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$ConvertsToStringToJson(ConvertsToString instance) {
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

ToString _$ToStringFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return ToString(
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$ToStringToJson(ToString instance) {
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

ConvertsToTime _$ConvertsToTimeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return ConvertsToTime(
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$ConvertsToTimeToJson(ConvertsToTime instance) {
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

ToTime _$ToTimeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return ToTime(
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$ToTimeToJson(ToTime instance) {
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

CanConvertQuantity _$CanConvertQuantityFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return CanConvertQuantity(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$CanConvertQuantityToJson(CanConvertQuantity instance) {
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

ConvertQuantity _$ConvertQuantityFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return ConvertQuantity(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$ConvertQuantityToJson(ConvertQuantity instance) {
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

Equal _$EqualFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Equal(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$EqualToJson(Equal instance) {
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

Equivalent _$EquivalentFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Equivalent(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$EquivalentToJson(Equivalent instance) {
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

NotEqual _$NotEqualFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return NotEqual(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$NotEqualToJson(NotEqual instance) {
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

Less _$LessFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Less(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$LessToJson(Less instance) {
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

Greater _$GreaterFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Greater(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$GreaterToJson(Greater instance) {
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

LessOrEqual _$LessOrEqualFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return LessOrEqual(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$LessOrEqualToJson(LessOrEqual instance) {
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

GreaterOrEqual _$GreaterOrEqualFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return GreaterOrEqual(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$GreaterOrEqualToJson(GreaterOrEqual instance) {
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

Add _$AddFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Add(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$AddToJson(Add instance) {
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

Subtract _$SubtractFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Subtract(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$SubtractToJson(Subtract instance) {
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

Multiply _$MultiplyFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Multiply(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$MultiplyToJson(Multiply instance) {
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

Divide _$DivideFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Divide(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$DivideToJson(Divide instance) {
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

TruncatedDivide _$TruncatedDivideFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return TruncatedDivide(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$TruncatedDivideToJson(TruncatedDivide instance) {
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

Modulo _$ModuloFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Modulo(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$ModuloToJson(Modulo instance) {
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

Ceiling _$CeilingFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Ceiling(
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$CeilingToJson(Ceiling instance) {
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

Floor _$FloorFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Floor(
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$FloorToJson(Floor instance) {
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

Truncate _$TruncateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Truncate(
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$TruncateToJson(Truncate instance) {
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

Abs _$AbsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Abs(
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$AbsToJson(Abs instance) {
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

Negate _$NegateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Negate(
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$NegateToJson(Negate instance) {
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

Round _$RoundFromJson(Map<String, dynamic> json) => Round(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
      precision: json['precision'] == null
          ? null
          : Expression.fromJson(json['precision'] as Map<String, dynamic>),
    )..signature = (json['signature'] as List<dynamic>?)
        ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$RoundToJson(Round instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  writeNotNull('precision', instance.precision?.toJson());
  return val;
}

Ln _$LnFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Ln(
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$LnToJson(Ln instance) {
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

Exp _$ExpFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Exp(
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$ExpToJson(Exp instance) {
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

Log _$LogFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Log(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$LogToJson(Log instance) {
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

Power _$PowerFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Power(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$PowerToJson(Power instance) {
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

Successor _$SuccessorFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Successor(
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$SuccessorToJson(Successor instance) {
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

Predecessor _$PredecessorFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Predecessor(
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$PredecessorToJson(Predecessor instance) {
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

MinValue _$MinValueFromJson(Map<String, dynamic> json) => MinValue(
      valueType: json['valueType'] as String,
    );

Map<String, dynamic> _$MinValueToJson(MinValue instance) => <String, dynamic>{
      'valueType': instance.valueType,
    };

MaxValue _$MaxValueFromJson(Map<String, dynamic> json) => MaxValue(
      QName.fromJson(json['valueType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MaxValueToJson(MaxValue instance) => <String, dynamic>{
      'valueType': instance.valueType.toJson(),
    };

Precision _$PrecisionFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Precision(
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$PrecisionToJson(Precision instance) {
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

LowBoundary _$LowBoundaryFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return LowBoundary(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$LowBoundaryToJson(LowBoundary instance) {
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
