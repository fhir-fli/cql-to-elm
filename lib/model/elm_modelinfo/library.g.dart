// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionedIdentifier _$VersionedIdentifierFromJson(Map<String, dynamic> json) =>
    VersionedIdentifier(
      id: json['id'] as String?,
      system: json['system'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$VersionedIdentifierToJson(VersionedIdentifier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('system', instance.system);
  writeNotNull('version', instance.version);
  return val;
}

UsingDef _$UsingDefFromJson(Map<String, dynamic> json) => UsingDef(
      localIdentifier: json['localIdentifier'] as String,
      uri: json['uri'] as String,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$UsingDefToJson(UsingDef instance) {
  final val = <String, dynamic>{
    'localIdentifier': instance.localIdentifier,
    'uri': instance.uri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('version', instance.version);
  return val;
}

IncludeDef _$IncludeDefFromJson(Map<String, dynamic> json) => IncludeDef(
      localIdentifier: json['localIdentifier'] as String,
      mediaType: json['mediaType'] as String? ?? 'application/elm+xml',
      path: json['path'] as String,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$IncludeDefToJson(IncludeDef instance) {
  final val = <String, dynamic>{
    'localIdentifier': instance.localIdentifier,
    'mediaType': instance.mediaType,
    'path': instance.path,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('version', instance.version);
  return val;
}

Library _$LibraryFromJson(Map<String, dynamic> json) => Library(
      identifier: json['identifier'] == null
          ? null
          : VersionedIdentifier.fromJson(
              json['identifier'] as Map<String, dynamic>),
      schemaIdentifier: json['schemaIdentifier'] == null
          ? null
          : VersionedIdentifier.fromJson(
              json['schemaIdentifier'] as Map<String, dynamic>),
      usings: (json['usings'] as List<dynamic>?)
          ?.map((e) => UsingDef.fromJson(e as Map<String, dynamic>))
          .toList(),
      includes: (json['includes'] as List<dynamic>?)
          ?.map((e) => IncludeDef.fromJson(e as Map<String, dynamic>))
          .toList(),
      parameters: (json['parameters'] as List<dynamic>?)
          ?.map((e) => ParameterDef.fromJson(e as Map<String, dynamic>))
          .toList(),
      codeSystems: (json['codeSystems'] as List<dynamic>?)
          ?.map((e) => CodeSystemDef.fromJson(e as Map<String, dynamic>))
          .toList(),
      valueSets: (json['valueSets'] as List<dynamic>?)
          ?.map((e) => ValueSetDef.fromJson(e as Map<String, dynamic>))
          .toList(),
      codes: (json['codes'] as List<dynamic>?)
          ?.map((e) => CodeDef.fromJson(e as Map<String, dynamic>))
          .toList(),
      concepts: (json['concepts'] as List<dynamic>?)
          ?.map((e) => ConceptDef.fromJson(e as Map<String, dynamic>))
          .toList(),
      statements: (json['statements'] as List<dynamic>?)
          ?.map((e) => ExpressionDef.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LibraryToJson(Library instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('identifier', instance.identifier?.toJson());
  writeNotNull('schemaIdentifier', instance.schemaIdentifier?.toJson());
  writeNotNull('usings', instance.usings?.map((e) => e.toJson()).toList());
  writeNotNull('includes', instance.includes?.map((e) => e.toJson()).toList());
  writeNotNull(
      'parameters', instance.parameters?.map((e) => e.toJson()).toList());
  writeNotNull(
      'codeSystems', instance.codeSystems?.map((e) => e.toJson()).toList());
  writeNotNull(
      'valueSets', instance.valueSets?.map((e) => e.toJson()).toList());
  writeNotNull('codes', instance.codes?.map((e) => e.toJson()).toList());
  writeNotNull('concepts', instance.concepts?.map((e) => e.toJson()).toList());
  writeNotNull(
      'statements', instance.statements?.map((e) => e.toJson()).toList());
  return val;
}
