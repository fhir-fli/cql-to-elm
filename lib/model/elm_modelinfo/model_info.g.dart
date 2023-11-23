// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
