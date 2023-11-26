// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cql_annotations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CqlToElmBase _$CqlToElmBaseFromJson(Map<String, dynamic> json) =>
    CqlToElmBase();

Map<String, dynamic> _$CqlToElmBaseToJson(CqlToElmBase instance) =>
    <String, dynamic>{};

Annotation _$AnnotationFromJson(Map<String, dynamic> json) => Annotation(
      s: json['s'] == null
          ? null
          : Narrative.fromJson(json['s'] as Map<String, dynamic>),
      locator: json['locator'] == null
          ? null
          : Locator.fromJson(json['locator'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnnotationToJson(Annotation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s', instance.s?.toJson());
  writeNotNull('locator', instance.locator?.toJson());
  return val;
}

Locator _$LocatorFromJson(Map<String, dynamic> json) => Locator(
      startLine: json['startLine'] as int?,
      startChar: json['startChar'] as int?,
      endLine: json['endLine'] as int?,
      endChar: json['endChar'] as int?,
    );

Map<String, dynamic> _$LocatorToJson(Locator instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('startLine', instance.startLine);
  writeNotNull('startChar', instance.startChar);
  writeNotNull('endLine', instance.endLine);
  writeNotNull('endChar', instance.endChar);
  return val;
}

Narrative _$NarrativeFromJson(Map<String, dynamic> json) => Narrative(
      s: (json['s'] as List<dynamic>?)
          ?.map((e) => Narrative.fromJson(e as Map<String, dynamic>))
          .toList(),
      r: json['r'] as String?,
    );

Map<String, dynamic> _$NarrativeToJson(Narrative instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s', instance.s?.map((e) => e.toJson()).toList());
  writeNotNull('r', instance.r);
  return val;
}

CqlToElmError _$CqlToElmErrorFromJson(Map<String, dynamic> json) =>
    CqlToElmError(
      message: json['message'] as String,
      errorType: $enumDecodeNullable(_$ErrorTypeEnumMap, json['errorType']) ??
          ErrorType.internal,
      errorSeverity:
          $enumDecodeNullable(_$ErrorSeverityEnumMap, json['errorSeverity']) ??
              ErrorSeverity.error,
      targetIncludeLibraryId: json['targetIncludeLibraryId'] as String?,
      targetIncludeLibraryVersionId:
          json['targetIncludeLibraryVersionId'] as String?,
    )
      ..startLine = json['startLine'] as int?
      ..startChar = json['startChar'] as int?
      ..endLine = json['endLine'] as int?
      ..endChar = json['endChar'] as int?;

Map<String, dynamic> _$CqlToElmErrorToJson(CqlToElmError instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('startLine', instance.startLine);
  writeNotNull('startChar', instance.startChar);
  writeNotNull('endLine', instance.endLine);
  writeNotNull('endChar', instance.endChar);
  val['message'] = instance.message;
  val['errorType'] = _$ErrorTypeEnumMap[instance.errorType]!;
  writeNotNull('errorSeverity', _$ErrorSeverityEnumMap[instance.errorSeverity]);
  writeNotNull('targetIncludeLibraryId', instance.targetIncludeLibraryId);
  writeNotNull(
      'targetIncludeLibraryVersionId', instance.targetIncludeLibraryVersionId);
  return val;
}

const _$ErrorTypeEnumMap = {
  ErrorType.environment: 'environment',
  ErrorType.syntax: 'syntax',
  ErrorType.include: 'include',
  ErrorType.semantic: 'semantic',
  ErrorType.internal: 'internal',
};

const _$ErrorSeverityEnumMap = {
  ErrorSeverity.info: 'info',
  ErrorSeverity.warning: 'warning',
  ErrorSeverity.error: 'error',
};

CqlToElmInfo _$CqlToElmInfoFromJson(Map<String, dynamic> json) => CqlToElmInfo(
      translatorVersion: json['translatorVersion'] as String?,
      translatorOptions: json['translatorOptions'] as String?,
    );

Map<String, dynamic> _$CqlToElmInfoToJson(CqlToElmInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('translatorVersion', instance.translatorVersion);
  writeNotNull('translatorOptions', instance.translatorOptions);
  return val;
}
