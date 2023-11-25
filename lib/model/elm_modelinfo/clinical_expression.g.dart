// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinical_expression.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Retrieve _$RetrieveFromJson(Map<String, dynamic> json) => Retrieve(
      dataType: json['dataType'] as String,
      templateId: json['templateId'] as String?,
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

  writeNotNull('templateId', instance.templateId);
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

CodeSystemDef _$CodeSystemDefFromJson(Map<String, dynamic> json) =>
    CodeSystemDef(
      name: json['name'] as String,
      id: json['id'] as String,
      version: json['version'] as String?,
      accessLevel: json['accessLevel'] as String? ?? 'Public',
    );

Map<String, dynamic> _$CodeSystemDefToJson(CodeSystemDef instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('version', instance.version);
  val['accessLevel'] = instance.accessLevel;
  return val;
}

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

const _$AccessModifierEnumMap = {
  AccessModifier.Public: 'Public',
  AccessModifier.Private: 'Private',
};

CodeSystemRef _$CodeSystemRefFromJson(Map<String, dynamic> json) =>
    CodeSystemRef(
      name: json['name'] as String,
      id: json['id'] as String,
      version: json['version'] as String?,
      accessLevel: json['accessLevel'] as String? ?? 'Public',
    );

Map<String, dynamic> _$CodeSystemRefToJson(CodeSystemRef instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('version', instance.version);
  val['accessLevel'] = instance.accessLevel;
  return val;
}

ValueSetRef _$ValueSetRefFromJson(Map<String, dynamic> json) => ValueSetRef(
      name: json['name'] as String?,
      libraryName: json['libraryName'] as String?,
    );

Map<String, dynamic> _$ValueSetRefToJson(ValueSetRef instance) {
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

CodeRef _$CodeRefFromJson(Map<String, dynamic> json) => CodeRef(
      name: json['name'] as String?,
      libraryName: json['libraryName'] as String?,
    );

Map<String, dynamic> _$CodeRefToJson(CodeRef instance) {
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

ConceptRef _$ConceptRefFromJson(Map<String, dynamic> json) => ConceptRef(
      name: json['name'] as String?,
      libraryName: json['libraryName'] as String?,
    );

Map<String, dynamic> _$ConceptRefToJson(ConceptRef instance) {
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

InCodeSystem _$InCodeSystemFromJson(Map<String, dynamic> json) => InCodeSystem(
      code: Expression.fromJson(json['code'] as Map<String, dynamic>),
      codesystem:
          CodeSystemRef.fromJson(json['codesystem'] as Map<String, dynamic>),
    )..signature = (json['signature'] as List<dynamic>?)
        ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$InCodeSystemToJson(InCodeSystem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['code'] = instance.code.toJson();
  val['codesystem'] = instance.codesystem.toJson();
  return val;
}

AnyInCodeSystem _$AnyInCodeSystemFromJson(Map<String, dynamic> json) =>
    AnyInCodeSystem(
      codes: Expression.fromJson(json['codes'] as Map<String, dynamic>),
      codesystem:
          CodeSystemRef.fromJson(json['codesystem'] as Map<String, dynamic>),
    )..signature = (json['signature'] as List<dynamic>?)
        ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$AnyInCodeSystemToJson(AnyInCodeSystem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['codes'] = instance.codes.toJson();
  val['codesystem'] = instance.codesystem.toJson();
  return val;
}

InValueSet _$InValueSetFromJson(Map<String, dynamic> json) => InValueSet(
      code: Expression.fromJson(json['code'] as Map<String, dynamic>),
      valueset: ValueSetRef.fromJson(json['valueset'] as Map<String, dynamic>),
    )..signature = (json['signature'] as List<dynamic>?)
        ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$InValueSetToJson(InValueSet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['code'] = instance.code.toJson();
  val['valueset'] = instance.valueset.toJson();
  return val;
}

AnyInValueSet _$AnyInValueSetFromJson(Map<String, dynamic> json) =>
    AnyInValueSet(
      codes: Expression.fromJson(json['codes'] as Map<String, dynamic>),
      valueset: ValueSetRef.fromJson(json['valueset'] as Map<String, dynamic>),
    )..signature = (json['signature'] as List<dynamic>?)
        ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$AnyInValueSetToJson(AnyInValueSet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['codes'] = instance.codes.toJson();
  val['valueset'] = instance.valueset.toJson();
  return val;
}

Subsumes _$SubsumesFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return Subsumes(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$SubsumesToJson(Subsumes instance) {
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

SubsumedBy _$SubsumedByFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return SubsumedBy(
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$SubsumedByToJson(SubsumedBy instance) {
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

CalculateAge _$CalculateAgeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return CalculateAge(
    precision: $enumDecode(_$DateTimePrecisionEnumMap, json['precision']),
    operand: Expression.fromJson(json['operand'] as Map<String, dynamic>),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$CalculateAgeToJson(CalculateAge instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.toJson();
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

CalculateAgeAt _$CalculateAgeAtFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['operand'],
  );
  return CalculateAgeAt(
    precision: $enumDecode(_$DateTimePrecisionEnumMap, json['precision']),
    operand: (json['operand'] as List<dynamic>)
        .map((e) => Expression.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..signature = (json['signature'] as List<dynamic>?)
      ?.map((e) => TypeSpecifier.fromJson(e as Map<String, dynamic>))
      .toList();
}

Map<String, dynamic> _$CalculateAgeAtToJson(CalculateAgeAt instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'signature', instance.signature?.map((e) => e.toJson()).toList());
  val['operand'] = instance.operand.map((e) => e.toJson()).toList();
  val['precision'] = _$DateTimePrecisionEnumMap[instance.precision]!;
  return val;
}
