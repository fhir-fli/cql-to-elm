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
          ?.map((e) => CqlToElmBase.fromJson(e as Map<String, dynamic>))
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
      ..type = json['type'] == null
          ? null
          : TypeSpecifier.fromJson(json['type'] as Map<String, dynamic>)
      ..elementType = json['elementType'] == null
          ? null
          : TypeSpecifier.fromJson(json['elementType'] as Map<String, dynamic>);

Map<String, dynamic> _$TupleElementDefinitionToJson(
    TupleElementDefinition instance) {
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
  val['name'] = instance.name;
  writeNotNull('type', instance.type?.toJson());
  writeNotNull('elementType', instance.elementType?.toJson());
  return val;
}

Expression _$ExpressionFromJson(Map<String, dynamic> json) => Expression(
      json['value'],
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

Map<String, dynamic> _$ExpressionToJson(Expression instance) {
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
  return val;
}

OperatorExpression _$OperatorExpressionFromJson(Map<String, dynamic> json) =>
    OperatorExpression(
      signature: (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      ..value = json['value'];

Map<String, dynamic> _$OperatorExpressionToJson(OperatorExpression instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  return val;
}

UnaryExpression _$UnaryExpressionFromJson(Map<String, dynamic> json) =>
    UnaryExpression(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$UnaryExpressionToJson(UnaryExpression instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

BinaryExpression _$BinaryExpressionFromJson(Map<String, dynamic> json) =>
    BinaryExpression(
      operand: (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$BinaryExpressionToJson(BinaryExpression instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  return val;
}

TernaryExpression _$TernaryExpressionFromJson(Map<String, dynamic> json) =>
    TernaryExpression(
      operand: (json['operand'] as List<dynamic>?)
          ?.map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$TernaryExpressionToJson(TernaryExpression instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.map((e) => e.toJson()).toList());
  return val;
}

NaryExpression _$NaryExpressionFromJson(Map<String, dynamic> json) =>
    NaryExpression(
      operand: (json['operand'] as List<dynamic>?)
          ?.map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$NaryExpressionToJson(NaryExpression instance) {
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

Map<String, dynamic> _$ExpressionDefToJson(ExpressionDef instance) {
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

Map<String, dynamic> _$FunctionDefToJson(FunctionDef instance) {
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
      ..value = json['value'];

Map<String, dynamic> _$ExpressionRefToJson(ExpressionRef instance) {
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
      ..value = json['value'];

Map<String, dynamic> _$FunctionRefToJson(FunctionRef instance) {
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

Map<String, dynamic> _$ParameterDefToJson(ParameterDef instance) {
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
      ..value = json['value'];

Map<String, dynamic> _$ParameterRefToJson(ParameterRef instance) {
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
      ..value = json['value'];

Map<String, dynamic> _$OperandRefToJson(OperandRef instance) {
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
  writeNotNull('name', instance.name);
  return val;
}

IdentifierRef _$IdentifierRefFromJson(Map<String, dynamic> json) =>
    IdentifierRef(
      name: json['name'] as String?,
      libraryName: json['libraryName'] as String?,
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
      ..value = json['value'];

Map<String, dynamic> _$IdentifierRefToJson(IdentifierRef instance) {
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
  writeNotNull('name', instance.name);
  writeNotNull('libraryName', instance.libraryName);
  return val;
}

Literal _$LiteralFromJson(Map<String, dynamic> json) => Literal(
      valueType: QName.fromJson(json['valueType'] as Map<String, dynamic>),
      value: json['value'],
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

Map<String, dynamic> _$LiteralToJson(Literal instance) {
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
  val['valueType'] = instance.valueType.toJson();
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
      ..value = json['value'];

Map<String, dynamic> _$TupleToJson(Tuple instance) {
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
  val['element'] = instance.element.map((e) => e.toJson()).toList();
  return val;
}

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
      ..value = json['value'];

Map<String, dynamic> _$InstanceToJson(Instance instance) {
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
  val['classType'] = instance.classType.toJson();
  val['element'] = instance.element.map((e) => e.toJson()).toList();
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
      ..value = json['value'];

Map<String, dynamic> _$IntervalToJson(Interval instance) {
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
  writeNotNull('low', instance.low);
  writeNotNull('lowClosedExpression', instance.lowClosedExpression?.toJson());
  writeNotNull('high', instance.high);
  writeNotNull('highClosedExpression', instance.highClosedExpression?.toJson());
  val['lowClosed'] = instance.lowClosed;
  val['highClosed'] = instance.highClosed;
  return val;
}

ElmList _$ElmListFromJson(Map<String, dynamic> json) => ElmList(
      typeSpecifier: json['typeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['typeSpecifier'] as Map<String, dynamic>),
      element: (json['element'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      ..value = json['value'];

Map<String, dynamic> _$ElmListToJson(ElmList instance) {
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
  writeNotNull('typeSpecifier', instance.typeSpecifier?.toJson());
  val['element'] = instance.element.map((e) => e.toJson()).toList();
  return val;
}

And _$AndFromJson(Map<String, dynamic> json) => And(
      arg1: json['arg1'],
      arg2: json['arg2'],
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AndToJson(And instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  return val;
}

Or _$OrFromJson(Map<String, dynamic> json) => Or(
      arg1: json['arg1'],
      arg2: json['arg2'],
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$OrToJson(Or instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  return val;
}

Xor _$XorFromJson(Map<String, dynamic> json) => Xor(
      arg1: json['arg1'],
      arg2: json['arg2'],
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$XorToJson(Xor instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  return val;
}

Implies _$ImpliesFromJson(Map<String, dynamic> json) => Implies(
      arg1: json['arg1'],
      arg2: json['arg2'],
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ImpliesToJson(Implies instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  return val;
}

Not _$NotFromJson(Map<String, dynamic> json) => Not(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$NotToJson(Not instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

If _$IfFromJson(Map<String, dynamic> json) => If(
      Expression.fromJson(json['condition'] as Map<String, dynamic>),
      Expression.fromJson(json['then'] as Map<String, dynamic>),
      Expression.fromJson(json['elseClause'] as Map<String, dynamic>),
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
      ..value = json['value'];

Map<String, dynamic> _$IfToJson(If instance) {
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
  val['condition'] = instance.condition.toJson();
  val['then'] = instance.then.toJson();
  val['elseClause'] = instance.elseClause.toJson();
  return val;
}

CaseItem _$CaseItemFromJson(Map<String, dynamic> json) => CaseItem(
      when: Expression.fromJson(json['when'] as Map<String, dynamic>),
      then: Expression.fromJson(json['then'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CaseItemToJson(CaseItem instance) => <String, dynamic>{
      'when': instance.when.toJson(),
      'then': instance.then.toJson(),
    };

Case _$CaseFromJson(Map<String, dynamic> json) => Case(
      (json['caseItems'] as List<dynamic>)
          .map((e) => CaseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      Expression.fromJson(json['elseClause'] as Map<String, dynamic>),
      comparand: json['comparand'] == null
          ? null
          : Expression.fromJson(json['comparand'] as Map<String, dynamic>),
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
      ..value = json['value'];

Map<String, dynamic> _$CaseToJson(Case instance) {
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
  writeNotNull('comparand', instance.comparand?.toJson());
  val['caseItems'] = instance.caseItems.map((e) => e.toJson()).toList();
  val['elseClause'] = instance.elseClause.toJson();
  return val;
}

NullOperator _$NullOperatorFromJson(Map<String, dynamic> json) => NullOperator(
      valueType: json['valueType'] as String?,
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
      ..value = json['value'];

Map<String, dynamic> _$NullOperatorToJson(NullOperator instance) {
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
  writeNotNull('valueType', instance.valueType);
  return val;
}

IsNull _$IsNullFromJson(Map<String, dynamic> json) => IsNull()
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
  ..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList()
  ..operand = json['operand'] == null
      ? null
      : Expression.fromJson(json['operand'] as Map<String, dynamic>);

Map<String, dynamic> _$IsNullToJson(IsNull instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ToBoolean _$ToBooleanFromJson(Map<String, dynamic> json) => ToBoolean(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ToBooleanToJson(ToBoolean instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ConvertsToBoolean _$ConvertsToBooleanFromJson(Map<String, dynamic> json) =>
    ConvertsToBoolean(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ConvertsToBooleanToJson(ConvertsToBoolean instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ToConcept _$ToConceptFromJson(Map<String, dynamic> json) => ToConcept(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ToConceptToJson(ToConcept instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ConvertsToDate _$ConvertsToDateFromJson(Map<String, dynamic> json) =>
    ConvertsToDate(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ConvertsToDateToJson(ConvertsToDate instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ToDate _$ToDateFromJson(Map<String, dynamic> json) => ToDate(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ToDateToJson(ToDate instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ConvertsToDateTime _$ConvertsToDateTimeFromJson(Map<String, dynamic> json) =>
    ConvertsToDateTime(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ConvertsToDateTimeToJson(ConvertsToDateTime instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ToDateTime _$ToDateTimeFromJson(Map<String, dynamic> json) => ToDateTime(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ToDateTimeToJson(ToDateTime instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ConvertsToDecimal _$ConvertsToDecimalFromJson(Map<String, dynamic> json) =>
    ConvertsToDecimal(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ConvertsToDecimalToJson(ConvertsToDecimal instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ToDecimal _$ToDecimalFromJson(Map<String, dynamic> json) => ToDecimal(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ToDecimalToJson(ToDecimal instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ConvertsToInteger _$ConvertsToIntegerFromJson(Map<String, dynamic> json) =>
    ConvertsToInteger(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ConvertsToIntegerToJson(ConvertsToInteger instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ToInteger _$ToIntegerFromJson(Map<String, dynamic> json) => ToInteger(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ToIntegerToJson(ToInteger instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ConvertsToLong _$ConvertsToLongFromJson(Map<String, dynamic> json) =>
    ConvertsToLong(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ConvertsToLongToJson(ConvertsToLong instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ToLong _$ToLongFromJson(Map<String, dynamic> json) => ToLong(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ToLongToJson(ToLong instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ConvertsToQuantity _$ConvertsToQuantityFromJson(Map<String, dynamic> json) =>
    ConvertsToQuantity(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ConvertsToQuantityToJson(ConvertsToQuantity instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ToQuantity _$ToQuantityFromJson(Map<String, dynamic> json) => ToQuantity(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ToQuantityToJson(ToQuantity instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ConvertsToRatio _$ConvertsToRatioFromJson(Map<String, dynamic> json) =>
    ConvertsToRatio(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ConvertsToRatioToJson(ConvertsToRatio instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ToRatio _$ToRatioFromJson(Map<String, dynamic> json) => ToRatio(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ToRatioToJson(ToRatio instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ToList _$ToListFromJson(Map<String, dynamic> json) => ToList(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ToListToJson(ToList instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ToChars _$ToCharsFromJson(Map<String, dynamic> json) => ToChars(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ToCharsToJson(ToChars instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ConvertsToString _$ConvertsToStringFromJson(Map<String, dynamic> json) =>
    ConvertsToString(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ConvertsToStringToJson(ConvertsToString instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ToString _$ToStringFromJson(Map<String, dynamic> json) => ToString(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ToStringToJson(ToString instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ConvertsToTime _$ConvertsToTimeFromJson(Map<String, dynamic> json) =>
    ConvertsToTime(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ConvertsToTimeToJson(ConvertsToTime instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

ToTime _$ToTimeFromJson(Map<String, dynamic> json) => ToTime(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ToTimeToJson(ToTime instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

CanConvertQuantity _$CanConvertQuantityFromJson(Map<String, dynamic> json) =>
    CanConvertQuantity(
      arg1: json['arg1'],
      arg2: json['arg2'],
      targetUnit: json['targetUnit'] as String?,
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$CanConvertQuantityToJson(CanConvertQuantity instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  writeNotNull('targetUnit', instance.targetUnit);
  return val;
}

ConvertQuantity _$ConvertQuantityFromJson(Map<String, dynamic> json) =>
    ConvertQuantity(
      arg1: json['arg1'],
      arg2: json['arg2'],
      targetUnit: json['targetUnit'] as String?,
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ConvertQuantityToJson(ConvertQuantity instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  writeNotNull('targetUnit', instance.targetUnit);
  return val;
}

Equal _$EqualFromJson(Map<String, dynamic> json) => Equal(
      arg1: json['arg1'],
      arg2: json['arg2'],
      targetUnit: json['targetUnit'] as String?,
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$EqualToJson(Equal instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  writeNotNull('targetUnit', instance.targetUnit);
  return val;
}

Equivalent _$EquivalentFromJson(Map<String, dynamic> json) => Equivalent(
      operand: (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$EquivalentToJson(Equivalent instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  return val;
}

NotEqual _$NotEqualFromJson(Map<String, dynamic> json) => NotEqual(
      operand: (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$NotEqualToJson(NotEqual instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  return val;
}

Less _$LessFromJson(Map<String, dynamic> json) => Less(
      operand: (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$LessToJson(Less instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  return val;
}

Greater _$GreaterFromJson(Map<String, dynamic> json) => Greater(
      operand: (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GreaterToJson(Greater instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  return val;
}

LessOrEqual _$LessOrEqualFromJson(Map<String, dynamic> json) => LessOrEqual(
      operand: (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$LessOrEqualToJson(LessOrEqual instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  return val;
}

GreaterOrEqual _$GreaterOrEqualFromJson(Map<String, dynamic> json) =>
    GreaterOrEqual(
      operand: (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
      binaryExpression: BinaryExpression.fromJson(
          json['binaryExpression'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GreaterOrEqualToJson(GreaterOrEqual instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  val['binaryExpression'] = instance.binaryExpression.toJson();
  return val;
}

Add _$AddFromJson(Map<String, dynamic> json) => Add(
      operand: (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
      binaryExpression: BinaryExpression.fromJson(
          json['binaryExpression'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AddToJson(Add instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  val['binaryExpression'] = instance.binaryExpression.toJson();
  return val;
}

Subtract _$SubtractFromJson(Map<String, dynamic> json) => Subtract(
      arg1: json['arg1'],
      arg2: json['arg2'],
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SubtractToJson(Subtract instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  return val;
}

Multiply _$MultiplyFromJson(Map<String, dynamic> json) => Multiply(
      arg1: json['arg1'],
      arg2: json['arg2'],
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$MultiplyToJson(Multiply instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  return val;
}

Divide _$DivideFromJson(Map<String, dynamic> json) => Divide(
      arg1: json['arg1'],
      arg2: json['arg2'],
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$DivideToJson(Divide instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  return val;
}

TruncatedDivide _$TruncatedDivideFromJson(Map<String, dynamic> json) =>
    TruncatedDivide(
      arg1: json['arg1'],
      arg2: json['arg2'],
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$TruncatedDivideToJson(TruncatedDivide instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  return val;
}

Modulo _$ModuloFromJson(Map<String, dynamic> json) => Modulo(
      arg1: json['arg1'],
      arg2: json['arg2'],
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ModuloToJson(Modulo instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  return val;
}

Ceiling _$CeilingFromJson(Map<String, dynamic> json) => Ceiling(
      UnaryExpression.fromJson(json['unaryExpression'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>);

Map<String, dynamic> _$CeilingToJson(Ceiling instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  val['unaryExpression'] = instance.unaryExpression.toJson();
  return val;
}

Floor _$FloorFromJson(Map<String, dynamic> json) => Floor(
      UnaryExpression.fromJson(json['unaryExpression'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>);

Map<String, dynamic> _$FloorToJson(Floor instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  val['unaryExpression'] = instance.unaryExpression.toJson();
  return val;
}

Truncate _$TruncateFromJson(Map<String, dynamic> json) => Truncate(
      UnaryExpression.fromJson(json['unaryExpression'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>);

Map<String, dynamic> _$TruncateToJson(Truncate instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  val['unaryExpression'] = instance.unaryExpression.toJson();
  return val;
}

Abs _$AbsFromJson(Map<String, dynamic> json) => Abs(
      UnaryExpression.fromJson(json['unaryExpression'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>);

Map<String, dynamic> _$AbsToJson(Abs instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  val['unaryExpression'] = instance.unaryExpression.toJson();
  return val;
}

Negate _$NegateFromJson(Map<String, dynamic> json) => Negate(
      UnaryExpression.fromJson(json['unaryExpression'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>);

Map<String, dynamic> _$NegateToJson(Negate instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  val['unaryExpression'] = instance.unaryExpression.toJson();
  return val;
}

Round _$RoundFromJson(Map<String, dynamic> json) => Round(
      operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
      precision: json['precision'] == null
          ? null
          : Expression.fromJson(json['precision'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$RoundToJson(Round instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.toJson();
  writeNotNull('precision', instance.precision?.toJson());
  return val;
}

Ln _$LnFromJson(Map<String, dynamic> json) => Ln(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$LnToJson(Ln instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

Exp _$ExpFromJson(Map<String, dynamic> json) => Exp(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ExpToJson(Exp instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

Log _$LogFromJson(Map<String, dynamic> json) => Log(
      arg1: json['arg1'],
      arg2: json['arg2'],
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$LogToJson(Log instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  return val;
}

Power _$PowerFromJson(Map<String, dynamic> json) => Power(
      arg1: json['arg1'],
      arg2: json['arg2'],
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PowerToJson(Power instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  return val;
}

Successor _$SuccessorFromJson(Map<String, dynamic> json) => Successor(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SuccessorToJson(Successor instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

Predecessor _$PredecessorFromJson(Map<String, dynamic> json) => Predecessor(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PredecessorToJson(Predecessor instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

MinValue _$MinValueFromJson(Map<String, dynamic> json) => MinValue(
      json['valueType'] as String,
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
      ..value = json['value'];

Map<String, dynamic> _$MinValueToJson(MinValue instance) {
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
  val['valueType'] = instance.valueType;
  return val;
}

MaxValue _$MaxValueFromJson(Map<String, dynamic> json) => MaxValue(
      json['valueType'] as String,
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
      ..value = json['value'];

Map<String, dynamic> _$MaxValueToJson(MaxValue instance) {
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
  val['valueType'] = instance.valueType;
  return val;
}

Precision _$PrecisionFromJson(Map<String, dynamic> json) => Precision(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PrecisionToJson(Precision instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

LowBoundary _$LowBoundaryFromJson(Map<String, dynamic> json) => LowBoundary(
      arg1: json['arg1'],
      arg2: json['arg2'],
      precision: json['precision'] as int?,
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$LowBoundaryToJson(LowBoundary instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  writeNotNull('precision', instance.precision);
  return val;
}

HighBoundary _$HighBoundaryFromJson(Map<String, dynamic> json) => HighBoundary(
      arg1: json['arg1'],
      arg2: json['arg2'],
      precision: json['precision'] as int?,
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$HighBoundaryToJson(HighBoundary instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  writeNotNull('precision', instance.precision);
  return val;
}

Concatenate _$ConcatenateFromJson(Map<String, dynamic> json) => Concatenate(
      arguments: (json['arguments'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>?)
          ?.map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ConcatenateToJson(Concatenate instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.map((e) => e.toJson()).toList());
  val['arguments'] = instance.arguments.map((e) => e.toJson()).toList();
  return val;
}

Combine _$CombineFromJson(Map<String, dynamic> json) => Combine(
      source: Expression.fromJson(json['source'] as Map<String, dynamic>),
      separator: json['separator'] == null
          ? null
          : Expression.fromJson(json['separator'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$CombineToJson(Combine instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['source'] = instance.source.toJson();
  writeNotNull('separator', instance.separator?.toJson());
  return val;
}

Split _$SplitFromJson(Map<String, dynamic> json) => Split(
      stringToSplit:
          Expression.fromJson(json['stringToSplit'] as Map<String, dynamic>),
      separator: Expression.fromJson(json['separator'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SplitToJson(Split instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['stringToSplit'] = instance.stringToSplit.toJson();
  val['separator'] = instance.separator.toJson();
  return val;
}

SplitOnMatches _$SplitOnMatchesFromJson(Map<String, dynamic> json) =>
    SplitOnMatches(
      stringToSplit:
          Expression.fromJson(json['stringToSplit'] as Map<String, dynamic>),
      separatorPattern:
          Expression.fromJson(json['separatorPattern'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SplitOnMatchesToJson(SplitOnMatches instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['stringToSplit'] = instance.stringToSplit.toJson();
  val['separatorPattern'] = instance.separatorPattern.toJson();
  return val;
}

Length _$LengthFromJson(Map<String, dynamic> json) => Length(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$LengthToJson(Length instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

Upper _$UpperFromJson(Map<String, dynamic> json) => Upper(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$UpperToJson(Upper instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

Lower _$LowerFromJson(Map<String, dynamic> json) => Lower()
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
  ..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList()
  ..operand = json['operand'] == null
      ? null
      : Expression.fromJson(json['operand'] as Map<String, dynamic>);

Map<String, dynamic> _$LowerToJson(Lower instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

Indexer _$IndexerFromJson(Map<String, dynamic> json) => Indexer(
      arg1: json['arg1'],
      arg2: json['arg2'],
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$IndexerToJson(Indexer instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  return val;
}

PositionOf _$PositionOfFromJson(Map<String, dynamic> json) => PositionOf(
      Expression.fromJson(json['pattern'] as Map<String, dynamic>),
      Expression.fromJson(json['string'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PositionOfToJson(PositionOf instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['pattern'] = instance.pattern.toJson();
  val['string'] = instance.string.toJson();
  return val;
}

LastPositionOf _$LastPositionOfFromJson(Map<String, dynamic> json) =>
    LastPositionOf(
      pattern: Expression.fromJson(json['pattern'] as Map<String, dynamic>),
      string: Expression.fromJson(json['string'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$LastPositionOfToJson(LastPositionOf instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['pattern'] = instance.pattern.toJson();
  val['string'] = instance.string.toJson();
  return val;
}

Substring _$SubstringFromJson(Map<String, dynamic> json) => Substring(
      stringToSub:
          Expression.fromJson(json['stringToSub'] as Map<String, dynamic>),
      startIndex:
          Expression.fromJson(json['startIndex'] as Map<String, dynamic>),
      length: json['length'] == null
          ? null
          : Expression.fromJson(json['length'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SubstringToJson(Substring instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['stringToSub'] = instance.stringToSub.toJson();
  val['startIndex'] = instance.startIndex.toJson();
  writeNotNull('length', instance.length?.toJson());
  return val;
}

StartsWith _$StartsWithFromJson(Map<String, dynamic> json) => StartsWith(
      arg1: json['arg1'],
      arg2: json['arg2'],
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$StartsWithToJson(StartsWith instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  return val;
}

EndsWith _$EndsWithFromJson(Map<String, dynamic> json) => EndsWith(
      arg1: json['arg1'],
      arg2: json['arg2'],
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$EndsWithToJson(EndsWith instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  return val;
}

Matches _$MatchesFromJson(Map<String, dynamic> json) => Matches(
      arg1: json['arg1'],
      arg2: json['arg2'],
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$MatchesToJson(Matches instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  return val;
}

ReplaceMatches _$ReplaceMatchesFromJson(Map<String, dynamic> json) =>
    ReplaceMatches(
      pattern: Expression.fromJson(json['pattern'] as Map<String, dynamic>),
      string: Expression.fromJson(json['string'] as Map<String, dynamic>),
      substitution:
          Expression.fromJson(json['substitution'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>?)
          ?.map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ReplaceMatchesToJson(ReplaceMatches instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.map((e) => e.toJson()).toList());
  val['pattern'] = instance.pattern.toJson();
  val['string'] = instance.string.toJson();
  val['substitution'] = instance.substitution.toJson();
  return val;
}

DurationBetween _$DurationBetweenFromJson(Map<String, dynamic> json) =>
    DurationBetween(
      arg1: json['arg1'],
      arg2: json['arg2'],
      precision:
          $enumDecodeNullable(_$DateTimePrecisionEnumMap, json['precision']),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$DurationBetweenToJson(DurationBetween instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  writeNotNull('precision', _$DateTimePrecisionEnumMap[instance.precision]);
  return val;
}

const _$DateTimePrecisionEnumMap = {
  DateTimePrecision.Year: 'Year',
  DateTimePrecision.Month: 'Month',
  DateTimePrecision.Week: 'Week',
  DateTimePrecision.Day: 'Day',
  DateTimePrecision.Hour: 'Hour',
  DateTimePrecision.Minute: 'Minute',
  DateTimePrecision.Second: 'Second',
  DateTimePrecision.Millisecond: 'Millisecond',
};

DifferenceBetween _$DifferenceBetweenFromJson(Map<String, dynamic> json) =>
    DifferenceBetween(
      arg1: json['arg1'],
      arg2: json['arg2'],
      precision:
          $enumDecodeNullable(_$DateTimePrecisionEnumMap, json['precision']),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$DifferenceBetweenToJson(DifferenceBetween instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  writeNotNull('precision', _$DateTimePrecisionEnumMap[instance.precision]);
  return val;
}

DateFrom _$DateFromFromJson(Map<String, dynamic> json) => DateFrom(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$DateFromToJson(DateFrom instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

TimeFrom _$TimeFromFromJson(Map<String, dynamic> json) => TimeFrom(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$TimeFromToJson(TimeFrom instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

TimezoneFrom _$TimezoneFromFromJson(Map<String, dynamic> json) => TimezoneFrom(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$TimezoneFromToJson(TimezoneFrom instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

TimezoneOffsetFrom _$TimezoneOffsetFromFromJson(Map<String, dynamic> json) =>
    TimezoneOffsetFrom(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$TimezoneOffsetFromToJson(TimezoneOffsetFrom instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

DateTimeComponentFrom _$DateTimeComponentFromFromJson(
        Map<String, dynamic> json) =>
    DateTimeComponentFrom(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
      precision:
          $enumDecodeNullable(_$DateTimePrecisionEnumMap, json['precision']),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$DateTimeComponentFromToJson(
    DateTimeComponentFrom instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  writeNotNull('precision', _$DateTimePrecisionEnumMap[instance.precision]);
  return val;
}

TimeOfDay _$TimeOfDayFromJson(Map<String, dynamic> json) => TimeOfDay()
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
  ..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$TimeOfDayToJson(TimeOfDay instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  return val;
}

Today _$TodayFromJson(Map<String, dynamic> json) => Today()
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
  ..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$TodayToJson(Today instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  return val;
}

Now _$NowFromJson(Map<String, dynamic> json) => Now()
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
  ..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$NowToJson(Now instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  return val;
}

DateTimeOperator _$DateTimeOperatorFromJson(Map<String, dynamic> json) =>
    DateTimeOperator(
      year: Expression.fromJson(json['year'] as Map<String, dynamic>),
      month: json['month'] == null
          ? null
          : Expression.fromJson(json['month'] as Map<String, dynamic>),
      day: json['day'] == null
          ? null
          : Expression.fromJson(json['day'] as Map<String, dynamic>),
      hour: json['hour'] == null
          ? null
          : Expression.fromJson(json['hour'] as Map<String, dynamic>),
      minute: json['minute'] == null
          ? null
          : Expression.fromJson(json['minute'] as Map<String, dynamic>),
      second: json['second'] == null
          ? null
          : Expression.fromJson(json['second'] as Map<String, dynamic>),
      millisecond: json['millisecond'] == null
          ? null
          : Expression.fromJson(json['millisecond'] as Map<String, dynamic>),
      timezoneOffset: json['timezoneOffset'] == null
          ? null
          : Expression.fromJson(json['timezoneOffset'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$DateTimeOperatorToJson(DateTimeOperator instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['year'] = instance.year.toJson();
  writeNotNull('month', instance.month?.toJson());
  writeNotNull('day', instance.day?.toJson());
  writeNotNull('hour', instance.hour?.toJson());
  writeNotNull('minute', instance.minute?.toJson());
  writeNotNull('second', instance.second?.toJson());
  writeNotNull('millisecond', instance.millisecond?.toJson());
  writeNotNull('timezoneOffset', instance.timezoneOffset?.toJson());
  return val;
}

SameAs _$SameAsFromJson(Map<String, dynamic> json) => SameAs(
      arg1: json['arg1'],
      arg2: json['arg2'],
      precision:
          $enumDecodeNullable(_$DateTimePrecisionEnumMap, json['precision']),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SameAsToJson(SameAs instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  writeNotNull('precision', _$DateTimePrecisionEnumMap[instance.precision]);
  return val;
}

SameOrBefore _$SameOrBeforeFromJson(Map<String, dynamic> json) => SameOrBefore(
      arg1: json['arg1'],
      arg2: json['arg2'],
      precision:
          $enumDecodeNullable(_$DateTimePrecisionEnumMap, json['precision']),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SameOrBeforeToJson(SameOrBefore instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  writeNotNull('precision', _$DateTimePrecisionEnumMap[instance.precision]);
  return val;
}

SameOrAfter _$SameOrAfterFromJson(Map<String, dynamic> json) => SameOrAfter(
      arg1: json['arg1'],
      arg2: json['arg2'],
      precision:
          $enumDecodeNullable(_$DateTimePrecisionEnumMap, json['precision']),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList()
      ..operand = (json['operand'] as List<dynamic>)
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SameOrAfterToJson(SameOrAfter instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  writeNotNull('arg1', instance.arg1);
  writeNotNull('arg2', instance.arg2);
  writeNotNull('precision', _$DateTimePrecisionEnumMap[instance.precision]);
  return val;
}

PointFrom _$PointFromFromJson(Map<String, dynamic> json) => PointFrom(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PointFromToJson(PointFrom instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

Width _$WidthFromJson(Map<String, dynamic> json) => Width(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$WidthToJson(Width instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

Size _$SizeFromJson(Map<String, dynamic> json) => Size(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SizeToJson(Size instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

Start _$StartFromJson(Map<String, dynamic> json) => Start(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$StartToJson(Start instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

End _$EndFromJson(Map<String, dynamic> json) => End(
      operand: json['operand'] == null
          ? null
          : Expression.fromJson(json['operand'] as Map<String, dynamic>),
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
      ..signature = (json['signature'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$EndToJson(End instance) {
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
  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  writeNotNull('operand', instance.operand?.toJson());
  return val;
}

Property _$PropertyFromJson(Map<String, dynamic> json) => Property(
      path: json['path'] as String,
      scope: json['scope'] as String?,
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
      ..value = json['value'];

Map<String, dynamic> _$PropertyToJson(Property instance) {
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
  val['path'] = instance.path;
  writeNotNull('scope', instance.scope);
  return val;
}
