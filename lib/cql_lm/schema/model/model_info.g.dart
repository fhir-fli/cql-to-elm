// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContextInfo _$ContextInfoFromJson(Map<String, dynamic> json) => ContextInfo(
      contextType: json['contextType'] == null
          ? null
          : NamedTypeSpecifier.fromJson(
              json['contextType'] as Map<String, dynamic>),
      name: json['name'] as String?,
      keyElement: json['keyElement'] as String?,
      birthDateElement: json['birthDateElement'] as String?,
    );

Map<String, dynamic> _$ContextInfoToJson(ContextInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('contextType', instance.contextType?.toJson());
  writeNotNull('name', instance.name);
  writeNotNull('keyElement', instance.keyElement);
  writeNotNull('birthDateElement', instance.birthDateElement);
  return val;
}

RelationshipInfo _$RelationshipInfoFromJson(Map<String, dynamic> json) =>
    RelationshipInfo(
      context: json['context'] as String,
      relatedKeyElement: json['relatedKeyElement'] as String?,
    );

Map<String, dynamic> _$RelationshipInfoToJson(RelationshipInfo instance) {
  final val = <String, dynamic>{
    'context': instance.context,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('relatedKeyElement', instance.relatedKeyElement);
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

ModelInfo _$ModelInfoFromJson(Map<String, dynamic> json) => ModelInfo(
      requiredModelInfo: (json['requiredModelInfo'] as List<dynamic>?)
          ?.map((e) => ModelSpecifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      typeInfo: (json['typeInfo'] as List<dynamic>?)
          ?.map((e) => TypeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      conversionInfo: (json['conversionInfo'] as List<dynamic>?)
          ?.map((e) => ConversionInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      contextInfo: (json['contextInfo'] as List<dynamic>?)
          ?.map((e) => ContextInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      version: json['version'] as String?,
      url: json['url'] as String?,
      schemaLocation: json['schemaLocation'] as String?,
      patientClassName: json['patientClassName'] as String?,
      patientClassIdentifier: json['patientClassIdentifier'] as String?,
      patientBirthDatePropertyName:
          json['patientBirthDatePropertyName'] as String?,
      caseSensitive: json['caseSensitive'] as bool?,
      strictRetrieveTyping: json['strictRetrieveTyping'] as bool?,
    )
      ..targetUrl = json['targetUrl'] as String?
      ..targetVersion = json['targetVersion'] as String?
      ..targetQualifier = json['targetQualifier'] as String?
      ..caseSensitiveSpecified = json['caseSensitiveSpecified'] as bool?
      ..strictRetrieveTypingSpecified =
          json['strictRetrieveTypingSpecified'] as bool?
      ..defaultContext = json['defaultContext'] as String?;

Map<String, dynamic> _$ModelInfoToJson(ModelInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('requiredModelInfo',
      instance.requiredModelInfo?.map((e) => e.toJson()).toList());
  writeNotNull('typeInfo', instance.typeInfo?.map((e) => e.toJson()).toList());
  writeNotNull('conversionInfo',
      instance.conversionInfo?.map((e) => e.toJson()).toList());
  writeNotNull(
      'contextInfo', instance.contextInfo?.map((e) => e.toJson()).toList());
  writeNotNull('name', instance.name);
  writeNotNull('version', instance.version);
  writeNotNull('url', instance.url);
  writeNotNull('targetUrl', instance.targetUrl);
  writeNotNull('targetVersion', instance.targetVersion);
  writeNotNull('schemaLocation', instance.schemaLocation);
  writeNotNull('targetQualifier', instance.targetQualifier);
  writeNotNull('patientClassName', instance.patientClassName);
  writeNotNull('patientClassIdentifier', instance.patientClassIdentifier);
  writeNotNull(
      'patientBirthDatePropertyName', instance.patientBirthDatePropertyName);
  writeNotNull('caseSensitive', instance.caseSensitive);
  writeNotNull('caseSensitiveSpecified', instance.caseSensitiveSpecified);
  writeNotNull('strictRetrieveTyping', instance.strictRetrieveTyping);
  writeNotNull(
      'strictRetrieveTypingSpecified', instance.strictRetrieveTypingSpecified);
  writeNotNull('defaultContext', instance.defaultContext);
  return val;
}

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

ClassInfoElement _$ClassInfoElementFromJson(Map<String, dynamic> json) =>
    ClassInfoElement(
      typeSpecifier: json['typeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['typeSpecifier'] as Map<String, dynamic>),
      elementTypeSpecifier: json['elementTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['elementTypeSpecifier'] as Map<String, dynamic>),
      binding: json['binding'] == null
          ? null
          : BindingInfo.fromJson(json['binding'] as Map<String, dynamic>),
      constraint: (json['constraint'] as List<dynamic>?)
          ?.map((e) => ConstraintInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      type: json['type'] as String?,
      elementType: json['elementType'] as String?,
      prohibited: json['prohibited'] as bool? ?? false,
      prohibitedSpecified: json['prohibitedSpecified'] as bool? ?? false,
      oneBased: json['oneBased'] as bool? ?? false,
      oneBasedSpecified: json['oneBasedSpecified'] as bool? ?? false,
      target: json['target'] as String?,
      label: json['label'] as String?,
      description: json['description'] as String?,
      definition: json['definition'] as String?,
      comment: json['comment'] as String?,
      min: json['min'] as int? ?? 0,
      minSpecified: json['minSpecified'] as bool? ?? false,
      max: json['max'] as String?,
      mustSupport: json['mustSupport'] as bool? ?? false,
      mustSupportSpecified: json['mustSupportSpecified'] as bool? ?? false,
    );

Map<String, dynamic> _$ClassInfoElementToJson(ClassInfoElement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('typeSpecifier', instance.typeSpecifier?.toJson());
  writeNotNull('elementTypeSpecifier', instance.elementTypeSpecifier?.toJson());
  writeNotNull('binding', instance.binding?.toJson());
  writeNotNull(
      'constraint', instance.constraint?.map((e) => e.toJson()).toList());
  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type);
  writeNotNull('elementType', instance.elementType);
  val['prohibited'] = instance.prohibited;
  val['prohibitedSpecified'] = instance.prohibitedSpecified;
  val['oneBased'] = instance.oneBased;
  val['oneBasedSpecified'] = instance.oneBasedSpecified;
  writeNotNull('target', instance.target);
  writeNotNull('label', instance.label);
  writeNotNull('description', instance.description);
  writeNotNull('definition', instance.definition);
  writeNotNull('comment', instance.comment);
  val['min'] = instance.min;
  val['minSpecified'] = instance.minSpecified;
  writeNotNull('max', instance.max);
  val['mustSupport'] = instance.mustSupport;
  val['mustSupportSpecified'] = instance.mustSupportSpecified;
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

ClassInfo _$ClassInfoFromJson(Map<String, dynamic> json) => ClassInfo(
      parameter: (json['parameter'] as List<dynamic>?)
          ?.map((e) => TypeParameterInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      element: (json['element'] as List<dynamic>?)
          ?.map((e) => ClassInfoElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      contextRelationship: (json['contextRelationship'] as List<dynamic>?)
          ?.map((e) => RelationshipInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      targetContextRelationship:
          (json['targetContextRelationship'] as List<dynamic>?)
              ?.map((e) => RelationshipInfo.fromJson(e as Map<String, dynamic>))
              .toList(),
      search: (json['search'] as List<dynamic>?)
          ?.map((e) => SearchInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      inferenceExpression: (json['inferenceExpression'] as List<dynamic>?)
          ?.map((e) => ExpressionInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      constraint: (json['constraint'] as List<dynamic>?)
          ?.map((e) => ConstraintInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      namespace: json['namespace'] as String?,
      name: json['name'] as String?,
      identifier: json['identifier'] as String?,
      label: json['label'] as String?,
      description: json['description'] as String?,
      definition: json['definition'] as String?,
      comment: json['comment'] as String?,
      target: json['target'] as String?,
      retrievable: json['retrievable'] as bool? ?? false,
      primaryCodePath: json['primaryCodePath'] as String?,
      primaryValueSetPath: json['primaryValueSetPath'] as String?,
    )
      ..baseTypeSpecifier = json['baseTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['baseTypeSpecifier'] as Map<String, dynamic>)
      ..baseType = json['baseType'] as String?;

Map<String, dynamic> _$ClassInfoToJson(ClassInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('baseTypeSpecifier', instance.baseTypeSpecifier?.toJson());
  writeNotNull('baseType', instance.baseType);
  writeNotNull(
      'parameter', instance.parameter?.map((e) => e.toJson()).toList());
  writeNotNull('element', instance.element?.map((e) => e.toJson()).toList());
  writeNotNull('contextRelationship',
      instance.contextRelationship?.map((e) => e.toJson()).toList());
  writeNotNull('targetContextRelationship',
      instance.targetContextRelationship?.map((e) => e.toJson()).toList());
  writeNotNull('search', instance.search?.map((e) => e.toJson()).toList());
  writeNotNull('inferenceExpression',
      instance.inferenceExpression?.map((e) => e.toJson()).toList());
  writeNotNull(
      'constraint', instance.constraint?.map((e) => e.toJson()).toList());
  writeNotNull('namespace', instance.namespace);
  writeNotNull('name', instance.name);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('label', instance.label);
  writeNotNull('description', instance.description);
  writeNotNull('definition', instance.definition);
  writeNotNull('comment', instance.comment);
  writeNotNull('target', instance.target);
  val['retrievable'] = instance.retrievable;
  writeNotNull('primaryCodePath', instance.primaryCodePath);
  writeNotNull('primaryValueSetPath', instance.primaryValueSetPath);
  return val;
}

TypeInfo _$TypeInfoFromJson(Map<String, dynamic> json) => TypeInfo(
      baseTypeSpecifier: json['baseTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['baseTypeSpecifier'] as Map<String, dynamic>),
      baseType: json['baseType'] as String?,
    );

Map<String, dynamic> _$TypeInfoToJson(TypeInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('baseTypeSpecifier', instance.baseTypeSpecifier?.toJson());
  writeNotNull('baseType', instance.baseType);
  return val;
}

SimpleTypeInfo _$SimpleTypeInfoFromJson(Map<String, dynamic> json) =>
    SimpleTypeInfo(
      namespace: json['namespace'] as String?,
      name: json['name'] as String?,
      target: json['target'] as String?,
    )
      ..baseTypeSpecifier = json['baseTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['baseTypeSpecifier'] as Map<String, dynamic>)
      ..baseType = json['baseType'] as String?;

Map<String, dynamic> _$SimpleTypeInfoToJson(SimpleTypeInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('baseTypeSpecifier', instance.baseTypeSpecifier?.toJson());
  writeNotNull('baseType', instance.baseType);
  writeNotNull('namespace', instance.namespace);
  writeNotNull('name', instance.name);
  writeNotNull('target', instance.target);
  return val;
}

IntervalTypeInfo _$IntervalTypeInfoFromJson(Map<String, dynamic> json) =>
    IntervalTypeInfo(
      pointTypeSpecifier: json['pointTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['pointTypeSpecifier'] as Map<String, dynamic>),
      pointType: json['pointType'] as String?,
    )
      ..baseTypeSpecifier = json['baseTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['baseTypeSpecifier'] as Map<String, dynamic>)
      ..baseType = json['baseType'] as String?;

Map<String, dynamic> _$IntervalTypeInfoToJson(IntervalTypeInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('baseTypeSpecifier', instance.baseTypeSpecifier?.toJson());
  writeNotNull('baseType', instance.baseType);
  writeNotNull('pointTypeSpecifier', instance.pointTypeSpecifier?.toJson());
  writeNotNull('pointType', instance.pointType);
  return val;
}

ListTypeInfo _$ListTypeInfoFromJson(Map<String, dynamic> json) => ListTypeInfo(
      elementTypeSpecifier: json['elementTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['elementTypeSpecifier'] as Map<String, dynamic>),
      elementType: json['elementType'] as String?,
    )
      ..baseTypeSpecifier = json['baseTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['baseTypeSpecifier'] as Map<String, dynamic>)
      ..baseType = json['baseType'] as String?;

Map<String, dynamic> _$ListTypeInfoToJson(ListTypeInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('baseTypeSpecifier', instance.baseTypeSpecifier?.toJson());
  writeNotNull('baseType', instance.baseType);
  writeNotNull('elementTypeSpecifier', instance.elementTypeSpecifier?.toJson());
  writeNotNull('elementType', instance.elementType);
  return val;
}

TupleTypeInfoElement _$TupleTypeInfoElementFromJson(
        Map<String, dynamic> json) =>
    TupleTypeInfoElement(
      typeSpecifier: json['typeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['typeSpecifier'] as Map<String, dynamic>),
      elementTypeSpecifier: json['elementTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['elementTypeSpecifier'] as Map<String, dynamic>),
      name: json['name'] as String?,
      type: json['type'] as String?,
      elementType: json['elementType'] as String?,
      prohibited: json['prohibited'] as bool?,
      prohibitedSpecified: json['prohibitedSpecified'] as bool?,
      oneBased: json['oneBased'] as bool?,
      oneBasedSpecified: json['oneBasedSpecified'] as bool?,
    );

Map<String, dynamic> _$TupleTypeInfoElementToJson(
    TupleTypeInfoElement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('typeSpecifier', instance.typeSpecifier?.toJson());
  writeNotNull('elementTypeSpecifier', instance.elementTypeSpecifier?.toJson());
  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type);
  writeNotNull('elementType', instance.elementType);
  writeNotNull('prohibited', instance.prohibited);
  writeNotNull('prohibitedSpecified', instance.prohibitedSpecified);
  writeNotNull('oneBased', instance.oneBased);
  writeNotNull('oneBasedSpecified', instance.oneBasedSpecified);
  return val;
}

TupleTypeInfo _$TupleTypeInfoFromJson(Map<String, dynamic> json) =>
    TupleTypeInfo(
      element: (json['element'] as List<dynamic>?)
          ?.map((e) => TupleTypeInfoElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..baseTypeSpecifier = json['baseTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['baseTypeSpecifier'] as Map<String, dynamic>)
      ..baseType = json['baseType'] as String?;

Map<String, dynamic> _$TupleTypeInfoToJson(TupleTypeInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('baseTypeSpecifier', instance.baseTypeSpecifier?.toJson());
  writeNotNull('baseType', instance.baseType);
  writeNotNull('element', instance.element?.map((e) => e.toJson()).toList());
  return val;
}

ProfileInfo _$ProfileInfoFromJson(Map<String, dynamic> json) => ProfileInfo()
  ..baseTypeSpecifier = json['baseTypeSpecifier'] == null
      ? null
      : TypeSpecifier.fromJson(
          json['baseTypeSpecifier'] as Map<String, dynamic>)
  ..baseType = json['baseType'] as String?
  ..parameter = (json['parameter'] as List<dynamic>?)
      ?.map((e) => TypeParameterInfo.fromJson(e as Map<String, dynamic>))
      .toList()
  ..element = (json['element'] as List<dynamic>?)
      ?.map((e) => ClassInfoElement.fromJson(e as Map<String, dynamic>))
      .toList()
  ..contextRelationship = (json['contextRelationship'] as List<dynamic>?)
      ?.map((e) => RelationshipInfo.fromJson(e as Map<String, dynamic>))
      .toList()
  ..targetContextRelationship =
      (json['targetContextRelationship'] as List<dynamic>?)
          ?.map((e) => RelationshipInfo.fromJson(e as Map<String, dynamic>))
          .toList()
  ..search = (json['search'] as List<dynamic>?)
      ?.map((e) => SearchInfo.fromJson(e as Map<String, dynamic>))
      .toList()
  ..inferenceExpression = (json['inferenceExpression'] as List<dynamic>?)
      ?.map((e) => ExpressionInfo.fromJson(e as Map<String, dynamic>))
      .toList()
  ..constraint = (json['constraint'] as List<dynamic>?)
      ?.map((e) => ConstraintInfo.fromJson(e as Map<String, dynamic>))
      .toList()
  ..namespace = json['namespace'] as String?
  ..name = json['name'] as String?
  ..identifier = json['identifier'] as String?
  ..label = json['label'] as String?
  ..description = json['description'] as String?
  ..definition = json['definition'] as String?
  ..comment = json['comment'] as String?
  ..target = json['target'] as String?
  ..retrievable = json['retrievable'] as bool
  ..primaryCodePath = json['primaryCodePath'] as String?
  ..primaryValueSetPath = json['primaryValueSetPath'] as String?;

Map<String, dynamic> _$ProfileInfoToJson(ProfileInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('baseTypeSpecifier', instance.baseTypeSpecifier?.toJson());
  writeNotNull('baseType', instance.baseType);
  writeNotNull(
      'parameter', instance.parameter?.map((e) => e.toJson()).toList());
  writeNotNull('element', instance.element?.map((e) => e.toJson()).toList());
  writeNotNull('contextRelationship',
      instance.contextRelationship?.map((e) => e.toJson()).toList());
  writeNotNull('targetContextRelationship',
      instance.targetContextRelationship?.map((e) => e.toJson()).toList());
  writeNotNull('search', instance.search?.map((e) => e.toJson()).toList());
  writeNotNull('inferenceExpression',
      instance.inferenceExpression?.map((e) => e.toJson()).toList());
  writeNotNull(
      'constraint', instance.constraint?.map((e) => e.toJson()).toList());
  writeNotNull('namespace', instance.namespace);
  writeNotNull('name', instance.name);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('label', instance.label);
  writeNotNull('description', instance.description);
  writeNotNull('definition', instance.definition);
  writeNotNull('comment', instance.comment);
  writeNotNull('target', instance.target);
  val['retrievable'] = instance.retrievable;
  writeNotNull('primaryCodePath', instance.primaryCodePath);
  writeNotNull('primaryValueSetPath', instance.primaryValueSetPath);
  return val;
}

ConversionInfo _$ConversionInfoFromJson(Map<String, dynamic> json) =>
    ConversionInfo(
      fromTypeSpecifier: json['fromTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['fromTypeSpecifier'] as Map<String, dynamic>),
      toTypeSpecifier: json['toTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['toTypeSpecifier'] as Map<String, dynamic>),
      functionName: json['functionName'] as String?,
      fromType: json['fromType'] as String?,
      toType: json['toType'] as String?,
    );

Map<String, dynamic> _$ConversionInfoToJson(ConversionInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fromTypeSpecifier', instance.fromTypeSpecifier?.toJson());
  writeNotNull('toTypeSpecifier', instance.toTypeSpecifier?.toJson());
  writeNotNull('functionName', instance.functionName);
  writeNotNull('fromType', instance.fromType);
  writeNotNull('toType', instance.toType);
  return val;
}

ChoiceTypeInfo _$ChoiceTypeInfoFromJson(Map<String, dynamic> json) =>
    ChoiceTypeInfo(
      type: (json['type'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      choice: (json['choice'] as List<dynamic>?)
          ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..baseTypeSpecifier = json['baseTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['baseTypeSpecifier'] as Map<String, dynamic>)
      ..baseType = json['baseType'] as String?;

Map<String, dynamic> _$ChoiceTypeInfoToJson(ChoiceTypeInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('baseTypeSpecifier', instance.baseTypeSpecifier?.toJson());
  writeNotNull('baseType', instance.baseType);
  writeNotNull('type', instance.type?.map((e) => e.toJson()).toList());
  writeNotNull('choice', instance.choice?.map((e) => e.toJson()).toList());
  return val;
}

ModelSpecifier _$ModelSpecifierFromJson(Map<String, dynamic> json) =>
    ModelSpecifier(
      url: json['url'] as String?,
      name: json['name'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$ModelSpecifierToJson(ModelSpecifier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('name', instance.name);
  writeNotNull('version', instance.version);
  return val;
}

TypeSpecifier _$TypeSpecifierFromJson(Map<String, dynamic> json) =>
    TypeSpecifier()
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

NamedTypeSpecifier _$NamedTypeSpecifierFromJson(Map<String, dynamic> json) =>
    NamedTypeSpecifier(
      modelName: json['modelName'] as String?,
      namespace: json['namespace'] as String?,
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
              json['resultTypeSpecifier'] as Map<String, dynamic>);

Map<String, dynamic> _$NamedTypeSpecifierToJson(NamedTypeSpecifier instance) {
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
  writeNotNull('modelName', instance.modelName);
  writeNotNull('namespace', instance.namespace);
  val['name'] = instance.name;
  return val;
}

ListTypeSpecifier _$ListTypeSpecifierFromJson(Map<String, dynamic> json) =>
    ListTypeSpecifier()
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
      ..elementTypeSpecifier = json['elementTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['elementTypeSpecifier'] as Map<String, dynamic>)
      ..elementType = json['elementType'] as String?;

Map<String, dynamic> _$ListTypeSpecifierToJson(ListTypeSpecifier instance) {
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
  writeNotNull('elementTypeSpecifier', instance.elementTypeSpecifier?.toJson());
  writeNotNull('elementType', instance.elementType);
  return val;
}

IntervalTypeSpecifier _$IntervalTypeSpecifierFromJson(
        Map<String, dynamic> json) =>
    IntervalTypeSpecifier(
      pointTypeSpecifier: json['pointTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['pointTypeSpecifier'] as Map<String, dynamic>),
      pointType: json['pointType'] as String?,
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

Map<String, dynamic> _$IntervalTypeSpecifierToJson(
    IntervalTypeSpecifier instance) {
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
  writeNotNull('pointTypeSpecifier', instance.pointTypeSpecifier?.toJson());
  writeNotNull('pointType', instance.pointType);
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
          ?.map((e) => CqlToElmBase.fromJson(e as Map<String, dynamic>))
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

ParameterTypeSpecifier _$ParameterTypeSpecifierFromJson(
        Map<String, dynamic> json) =>
    ParameterTypeSpecifier(
      name: json['name'] as String,
      constraint: json['constraint'] as String,
      constraintType: json['constraintType'] as String?,
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

Map<String, dynamic> _$ParameterTypeSpecifierToJson(
    ParameterTypeSpecifier instance) {
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
  val['constraint'] = instance.constraint;
  writeNotNull('constraintType', instance.constraintType);
  return val;
}

BoundParameterTypeSpecifier _$BoundParameterTypeSpecifierFromJson(
        Map<String, dynamic> json) =>
    BoundParameterTypeSpecifier(
      parameterName: json['parameterName'] as String,
      boundType: json['boundType'] as String,
      elementTypeSpecifier: json['elementTypeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['elementTypeSpecifier'] as Map<String, dynamic>),
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

Map<String, dynamic> _$BoundParameterTypeSpecifierToJson(
    BoundParameterTypeSpecifier instance) {
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
  val['parameterName'] = instance.parameterName;
  val['boundType'] = instance.boundType;
  writeNotNull('elementTypeSpecifier', instance.elementTypeSpecifier?.toJson());
  return val;
}

TypeParameterInfo _$TypeParameterInfoFromJson(Map<String, dynamic> json) =>
    TypeParameterInfo(
      typeSpecifier: json['typeSpecifier'] == null
          ? null
          : TypeSpecifier.fromJson(
              json['typeSpecifier'] as Map<String, dynamic>),
      name: json['name'] as String,
      constraint: json['constraint'] as String,
      constraintType: json['constraintType'] as String?,
    );

Map<String, dynamic> _$TypeParameterInfoToJson(TypeParameterInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('typeSpecifier', instance.typeSpecifier?.toJson());
  val['name'] = instance.name;
  val['constraint'] = instance.constraint;
  writeNotNull('constraintType', instance.constraintType);
  return val;
}

TupleTypeSpecifierElement _$TupleTypeSpecifierElementFromJson(
        Map<String, dynamic> json) =>
    TupleTypeSpecifierElement(
      elementType:
          TypeSpecifier.fromJson(json['elementType'] as Map<String, dynamic>),
      name: json['name'] as String,
    );

Map<String, dynamic> _$TupleTypeSpecifierElementToJson(
        TupleTypeSpecifierElement instance) =>
    <String, dynamic>{
      'elementType': instance.elementType.toJson(),
      'name': instance.name,
    };

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
          ?.map((e) => CqlToElmBase.fromJson(e as Map<String, dynamic>))
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
