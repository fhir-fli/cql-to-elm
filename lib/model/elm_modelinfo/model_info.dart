import 'package:json_annotation/json_annotation.dart';
import 'package:xml/xml.dart';

import 'type_info.dart';
import 'type_specifiers.dart';

part 'model_info.g.dart';

@JsonSerializable()
class ModelInfo {
  List<ModelSpecifier>? requiredModelInfo;

  List<TypeInfo>? typeInfo;

  List<ConversionInfo>? conversionInfo;

  List<ContextInfo>? contextInfo;

  String? name;

  String? version;

  String? url;

  String? targetUrl;

  String? targetVersion;

  String? schemaLocation;

  String? targetQualifier;

  String? patientClassName;

  String? patientClassIdentifier;

  String? patientBirthDatePropertyName;

  bool? caseSensitive;

  bool? caseSensitiveSpecified;

  bool? strictRetrieveTyping;

  bool? strictRetrieveTypingSpecified;

  String? defaultContext;

  ModelInfo({
    this.requiredModelInfo,
    this.typeInfo,
    this.conversionInfo,
    this.contextInfo,
    this.name,
    this.version,
    this.url,
    this.schemaLocation,
    this.patientClassName,
    this.patientClassIdentifier,
    this.patientBirthDatePropertyName,
    this.caseSensitive,
    this.strictRetrieveTyping,
  });

  factory ModelInfo.fromXml(XmlDocument xmlDocument) {
    final modelInfo = ModelInfo();
    final modelInfoElement = xmlDocument.findAllElements('modelInfo').first;
    modelInfo.requiredModelInfo = modelInfoElement
        .findAllElements('requiredModelInfo')
        .map((e) => ModelSpecifier(
              url: e.getAttribute('url'),
              name: e.getAttribute('name'),
              version: e.getAttribute('version'),
            ))
        .toList();

    modelInfo.name = modelInfoElement.getAttribute('name');
    modelInfo.version = modelInfoElement.getAttribute('version');
    modelInfo.url = modelInfoElement.getAttribute('url');
    modelInfo.schemaLocation = modelInfoElement.getAttribute('schemaLocation');
    modelInfo.patientClassName =
        modelInfoElement.getAttribute('patientClassName');
    modelInfo.patientClassIdentifier =
        modelInfoElement.getAttribute('patientClassIdentifier');
    modelInfo.patientBirthDatePropertyName =
        modelInfoElement.getAttribute('patientBirthDatePropertyName');
    modelInfo.caseSensitive =
        modelInfoElement.getAttribute('caseSensitive') == 'true';
    modelInfo.strictRetrieveTyping =
        modelInfoElement.getAttribute('strictRetrieveTyping') == 'true';
    return modelInfo;
  }

  factory ModelInfo.fromJson(Map<String, dynamic> json) =>
      _$ModelInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ModelInfoToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ModelInfo &&
        other.name == name &&
        other.version == version &&
        other.url == url &&
        other.schemaLocation == schemaLocation &&
        other.patientClassName == patientClassName &&
        other.patientClassIdentifier == patientClassIdentifier &&
        other.patientBirthDatePropertyName == patientBirthDatePropertyName &&
        other.caseSensitive == caseSensitive &&
        other.strictRetrieveTyping == strictRetrieveTyping;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        version.hashCode ^
        url.hashCode ^
        schemaLocation.hashCode ^
        patientClassName.hashCode ^
        patientClassIdentifier.hashCode ^
        patientBirthDatePropertyName.hashCode ^
        caseSensitive.hashCode ^
        strictRetrieveTyping.hashCode;
  }

  @override
  String toString() {
    return 'ModelInfo{requiredModelInfo: name: $name, version: $version, url: $url, '
        'schemaLocation: $schemaLocation, patientClassName: $patientClassName, '
        'patientClassIdentifier: $patientClassIdentifier, '
        'patientBirthDatePropertyName: $patientBirthDatePropertyName, '
        'caseSensitive: $caseSensitive, strictRetrieveTyping: $strictRetrieveTyping}';
  }
}

@JsonSerializable()
class ModelSpecifier {
  String? url;

  String? name;

  String? version;

  ModelSpecifier({this.url, this.name, this.version});

  factory ModelSpecifier.fromJson(Map<String, dynamic> json) =>
      _$ModelSpecifierFromJson(json);

  Map<String, dynamic> toJson() => _$ModelSpecifierToJson(this);
}

@JsonSerializable()
class ContextInfo {
  NamedTypeSpecifier? contextType;
  String? name;
  String? keyElement;
  String? birthDateElement;

  ContextInfo(
      {this.contextType, this.name, this.keyElement, this.birthDateElement});

  factory ContextInfo.fromJson(Map<String, dynamic> json) =>
      _$ContextInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ContextInfoToJson(this);
}
