// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinical_expression.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeFilterElement _$CodeFilterElementFromJson(Map<String, dynamic> json) =>
    CodeFilterElement(
      property: json['property'] as String?,
      valueSetProperty: json['valueSetProperty'] as String?,
      search: json['search'] as String?,
      comparator: json['comparator'] as String,
      value: Expression.fromJson(json['value'] as Map<String, dynamic>),
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

Map<String, dynamic> _$CodeFilterElementToJson(CodeFilterElement instance) {
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
  writeNotNull('property', instance.property);
  writeNotNull('valueSetProperty', instance.valueSetProperty);
  writeNotNull('search', instance.search);
  val['comparator'] = instance.comparator;
  val['value'] = instance.value.toJson();
  return val;
}

DateFilterElement _$DateFilterElementFromJson(Map<String, dynamic> json) =>
    DateFilterElement(
      property: json['property'] as String?,
      lowProperty: json['lowProperty'] as String?,
      highProperty: json['highProperty'] as String?,
      search: json['search'] as String?,
      value: Expression.fromJson(json['value'] as Map<String, dynamic>),
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

Map<String, dynamic> _$DateFilterElementToJson(DateFilterElement instance) {
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
  writeNotNull('property', instance.property);
  writeNotNull('lowProperty', instance.lowProperty);
  writeNotNull('highProperty', instance.highProperty);
  writeNotNull('search', instance.search);
  val['value'] = instance.value.toJson();
  return val;
}

OtherFilterElement _$OtherFilterElementFromJson(Map<String, dynamic> json) =>
    OtherFilterElement(
      property: json['property'] as String?,
      search: json['search'] as String?,
      comparator: json['comparator'] as String,
      value: Expression.fromJson(json['value'] as Map<String, dynamic>),
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

Map<String, dynamic> _$OtherFilterElementToJson(OtherFilterElement instance) {
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
  writeNotNull('property', instance.property);
  writeNotNull('search', instance.search);
  val['comparator'] = instance.comparator;
  val['value'] = instance.value.toJson();
  return val;
}

IncludeElement _$IncludeElementFromJson(Map<String, dynamic> json) =>
    IncludeElement(
      includeFrom: json['includeFrom'] as String?,
      redDataType: json['redDataType'] as String,
      redProperty: json['redProperty'] as String?,
      redSearch: json['redSearch'] as String?,
      isReverse: json['isReverse'] as bool?,
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

Map<String, dynamic> _$IncludeElementToJson(IncludeElement instance) {
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
  writeNotNull('includeFrom', instance.includeFrom);
  val['redDataType'] = instance.redDataType;
  writeNotNull('redProperty', instance.redProperty);
  writeNotNull('redSearch', instance.redSearch);
  writeNotNull('isReverse', instance.isReverse);
  return val;
}

Retrieve _$RetrieveFromJson(Map<String, dynamic> json) => Retrieve(
      dataType: json['dataType'] as String,
      tempId: json['tempId'] as String?,
      idProperty: json['idProperty'] as String?,
      codeProperty: json['codeProperty'] as String?,
      valueSetProperty: json['valueSetProperty'] as String?,
      dateProperty: json['dateProperty'] as String?,
      dateLowProperty: json['dateLowProperty'] as String?,
      dateHighProperty: json['dateHighProperty'] as String?,
      codes: json['codes'] == null
          ? null
          : Expression.fromJson(json['codes'] as Map<String, dynamic>),
      dateRange: json['dateRange'] == null
          ? null
          : Expression.fromJson(json['dateRange'] as Map<String, dynamic>),
      context: json['context'] == null
          ? null
          : Expression.fromJson(json['context'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RetrieveToJson(Retrieve instance) {
  final val = <String, dynamic>{
    'dataType': instance.dataType,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tempId', instance.tempId);
  writeNotNull('idProperty', instance.idProperty);
  writeNotNull('codeProperty', instance.codeProperty);
  writeNotNull('valueSetProperty', instance.valueSetProperty);
  writeNotNull('dateProperty', instance.dateProperty);
  writeNotNull('dateLowProperty', instance.dateLowProperty);
  writeNotNull('dateHighProperty', instance.dateHighProperty);
  writeNotNull('codes', instance.codes?.toJson());
  writeNotNull('dateRange', instance.dateRange?.toJson());
  writeNotNull('context', instance.context?.toJson());
  return val;
}

Search _$SearchFromJson(Map<String, dynamic> json) => Search(
      path: json['path'] as String,
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

Map<String, dynamic> _$SearchToJson(Search instance) {
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
  return val;
}

CodeSystemDef _$CodeSystemDefFromJson(Map<String, dynamic> json) =>
    CodeSystemDef(
      name: json['name'] as String,
      id: json['id'] as String,
      version: json['version'] as String?,
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

Map<String, dynamic> _$CodeSystemDefToJson(CodeSystemDef instance) {
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
  val['id'] = instance.id;
  writeNotNull('version', instance.version);
  val['accessLevel'] = _$AccessModifierEnumMap[instance.accessLevel]!;
  return val;
}

const _$AccessModifierEnumMap = {
  AccessModifier.Public: 'Public',
  AccessModifier.Private: 'Private',
};

ValueSetDef _$ValueSetDefFromJson(Map<String, dynamic> json) => ValueSetDef(
      codeSystem: (json['codeSystem'] as List<dynamic>?)
          ?.map((e) => CodeSystemRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      id: json['id'] as String,
      version: json['version'] as String?,
      accessLevel: json['accessLevel'] as String? ?? 'Public',
    );

Map<String, dynamic> _$ValueSetDefToJson(ValueSetDef instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'codeSystem', instance.codeSystem?.map((e) => e.toJson()).toList());
  writeNotNull('name', instance.name);
  val['id'] = instance.id;
  writeNotNull('version', instance.version);
  val['accessLevel'] = instance.accessLevel;
  return val;
}

CodeDef _$CodeDefFromJson(Map<String, dynamic> json) => CodeDef(
      codeSystem: json['codeSystem'] == null
          ? null
          : CodeSystemRef.fromJson(json['codeSystem'] as Map<String, dynamic>),
      name: json['name'] as String,
      id: json['id'] as String,
      display: json['display'] as String?,
      accessLevel: json['accessLevel'] as String? ?? 'Public',
    );

Map<String, dynamic> _$CodeDefToJson(CodeDef instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('codeSystem', instance.codeSystem?.toJson());
  val['name'] = instance.name;
  val['id'] = instance.id;
  writeNotNull('display', instance.display);
  val['accessLevel'] = instance.accessLevel;
  return val;
}

ConceptDef _$ConceptDefFromJson(Map<String, dynamic> json) => ConceptDef(
      name: json['name'] as String,
      display: json['display'] as String?,
      accessLevel:
          $enumDecodeNullable(_$AccessModifierEnumMap, json['accessLevel']) ??
              AccessModifier.Public,
      code: (json['code'] as List<dynamic>)
          .map((e) => CodeRef.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConceptDefToJson(ConceptDef instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('display', instance.display);
  val['accessLevel'] = _$AccessModifierEnumMap[instance.accessLevel]!;
  val['code'] = instance.code.map((e) => e.toJson()).toList();
  return val;
}

CodeSystemRef _$CodeSystemRefFromJson(Map<String, dynamic> json) =>
    CodeSystemRef(
      name: json['name'] as String,
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

Map<String, dynamic> _$CodeSystemRefToJson(CodeSystemRef instance) {
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
  val['name'] = instance.name;
  writeNotNull('libraryName', instance.libraryName);
  return val;
}

ValueSetRef _$ValueSetRefFromJson(Map<String, dynamic> json) => ValueSetRef(
      name: json['name'] as String,
      libraryName: json['libraryName'] as String?,
      preserve: json['preserve'] as bool?,
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

Map<String, dynamic> _$ValueSetRefToJson(ValueSetRef instance) {
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
  val['name'] = instance.name;
  writeNotNull('libraryName', instance.libraryName);
  writeNotNull('preserve', instance.preserve);
  return val;
}

CodeRef _$CodeRefFromJson(Map<String, dynamic> json) => CodeRef(
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

Map<String, dynamic> _$CodeRefToJson(CodeRef instance) {
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

ConceptRef _$ConceptRefFromJson(Map<String, dynamic> json) => ConceptRef(
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

Map<String, dynamic> _$ConceptRefToJson(ConceptRef instance) {
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

ElmCode _$ElmCodeFromJson(Map<String, dynamic> json) => ElmCode(
      code: json['code'] as String,
      display: json['display'] as String?,
      system: json['system'] == null
          ? null
          : CodeSystemRef.fromJson(json['system'] as Map<String, dynamic>),
      version: json['version'] as String?,
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

Map<String, dynamic> _$ElmCodeToJson(ElmCode instance) {
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
  val['code'] = instance.code;
  writeNotNull('display', instance.display);
  writeNotNull('system', instance.system?.toJson());
  writeNotNull('version', instance.version);
  return val;
}

Concept _$ConceptFromJson(Map<String, dynamic> json) => Concept(
      code: (json['code'] as List<dynamic>)
          .map((e) => ElmCode.fromJson(e as Map<String, dynamic>))
          .toList(),
      display: json['display'] as String?,
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

Map<String, dynamic> _$ConceptToJson(Concept instance) {
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
  val['code'] = instance.code.map((e) => e.toJson()).toList();
  writeNotNull('display', instance.display);
  return val;
}

InCodeSystem _$InCodeSystemFromJson(Map<String, dynamic> json) => InCodeSystem(
      code: Expression.fromJson(json['code'] as Map<String, dynamic>),
      codesystem: json['codesystem'] == null
          ? null
          : CodeSystemRef.fromJson(json['codesystem'] as Map<String, dynamic>),
      codesystemExpression: json['codesystemExpression'] == null
          ? null
          : Expression.fromJson(
              json['codesystemExpression'] as Map<String, dynamic>),
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

Map<String, dynamic> _$InCodeSystemToJson(InCodeSystem instance) {
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
  val['code'] = instance.code.toJson();
  writeNotNull('codesystem', instance.codesystem?.toJson());
  writeNotNull('codesystemExpression', instance.codesystemExpression?.toJson());
  return val;
}

AnyInCodeSystem _$AnyInCodeSystemFromJson(Map<String, dynamic> json) =>
    AnyInCodeSystem(
      code: Expression.fromJson(json['code'] as Map<String, dynamic>),
      codesystem: json['codesystem'] == null
          ? null
          : CodeSystemRef.fromJson(json['codesystem'] as Map<String, dynamic>),
      codesystemExpression: json['codesystemExpression'] == null
          ? null
          : Expression.fromJson(
              json['codesystemExpression'] as Map<String, dynamic>),
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

Map<String, dynamic> _$AnyInCodeSystemToJson(AnyInCodeSystem instance) {
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
  val['code'] = instance.code.toJson();
  writeNotNull('codesystem', instance.codesystem?.toJson());
  writeNotNull('codesystemExpression', instance.codesystemExpression?.toJson());
  return val;
}

InValueSet _$InValueSetFromJson(Map<String, dynamic> json) => InValueSet(
      code: Expression.fromJson(json['code'] as Map<String, dynamic>),
      valueset: json['valueset'] == null
          ? null
          : ValueSetRef.fromJson(json['valueset'] as Map<String, dynamic>),
      valuesetExpression: json['valuesetExpression'] == null
          ? null
          : Expression.fromJson(
              json['valuesetExpression'] as Map<String, dynamic>),
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

Map<String, dynamic> _$InValueSetToJson(InValueSet instance) {
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
  val['code'] = instance.code.toJson();
  writeNotNull('valueset', instance.valueset?.toJson());
  writeNotNull('valuesetExpression', instance.valuesetExpression?.toJson());
  return val;
}

AnyInValueSet _$AnyInValueSetFromJson(Map<String, dynamic> json) =>
    AnyInValueSet(
      codes: Expression.fromJson(json['codes'] as Map<String, dynamic>),
      valueset: json['valueset'] == null
          ? null
          : ValueSetRef.fromJson(json['valueset'] as Map<String, dynamic>),
      valuesetExpression: json['valuesetExpression'] == null
          ? null
          : Expression.fromJson(
              json['valuesetExpression'] as Map<String, dynamic>),
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

Map<String, dynamic> _$AnyInValueSetToJson(AnyInValueSet instance) {
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
  val['codes'] = instance.codes.toJson();
  writeNotNull('valueset', instance.valueset?.toJson());
  writeNotNull('valuesetExpression', instance.valuesetExpression?.toJson());
  return val;
}

ExpandValueSet _$ExpandValueSetFromJson(Map<String, dynamic> json) =>
    ExpandValueSet(
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

Map<String, dynamic> _$ExpandValueSetToJson(ExpandValueSet instance) {
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

Subsumes _$SubsumesFromJson(Map<String, dynamic> json) => Subsumes(
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

Map<String, dynamic> _$SubsumesToJson(Subsumes instance) {
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

SubsumedBy _$SubsumedByFromJson(Map<String, dynamic> json) => SubsumedBy(
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

Map<String, dynamic> _$SubsumedByToJson(SubsumedBy instance) {
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

CalculateAge _$CalculateAgeFromJson(Map<String, dynamic> json) => CalculateAge(
      precision: $enumDecode(_$DateTimePrecisionEnumMap, json['precision']),
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

Map<String, dynamic> _$CalculateAgeToJson(CalculateAge instance) {
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
  val['precision'] = _$DateTimePrecisionEnumMap[instance.precision]!;
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

CalculateAgeAt _$CalculateAgeAtFromJson(Map<String, dynamic> json) =>
    CalculateAgeAt(
      precision: $enumDecode(_$DateTimePrecisionEnumMap, json['precision']),
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

Map<String, dynamic> _$CalculateAgeAtToJson(CalculateAgeAt instance) {
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
  val['precision'] = _$DateTimePrecisionEnumMap[instance.precision]!;
  return val;
}
