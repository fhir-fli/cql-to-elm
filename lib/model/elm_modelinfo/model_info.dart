import 'package:json_annotation/json_annotation.dart';
import 'package:xml/xml.dart';

import 'elm_modelinfo.dart';

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

@JsonSerializable()
class RelationshipInfo {
  String context;
  String? relatedKeyElement;

  RelationshipInfo({
    required this.context,
    this.relatedKeyElement,
  });

  factory RelationshipInfo.fromJson(Map<String, dynamic> json) =>
      _$RelationshipInfoFromJson(json);

  Map<String, dynamic> toJson() => _$RelationshipInfoToJson(this);
}

@JsonSerializable()
class ClassInfoElement {
  TypeSpecifier? typeSpecifier;
  TypeSpecifier? elementTypeSpecifier;
  BindingInfo? binding;
  List<ConstraintInfo>? constraint;
  String? name;
  String? type;
  String? elementType;
  bool prohibited = false;
  bool prohibitedSpecified = false;
  bool oneBased = false;
  bool oneBasedSpecified = false;
  String? target;
  String? label;
  String? description;
  String? definition;
  String? comment;
  int min = 0;
  bool minSpecified = false;
  String? max;
  bool mustSupport = false;
  bool mustSupportSpecified = false;

  ClassInfoElement(
      {this.typeSpecifier,
      this.elementTypeSpecifier,
      this.binding,
      this.constraint,
      this.name,
      this.type,
      this.elementType,
      this.prohibited = false,
      this.prohibitedSpecified = false,
      this.oneBased = false,
      this.oneBasedSpecified = false,
      this.target,
      this.label,
      this.description,
      this.definition,
      this.comment,
      this.min = 0,
      this.minSpecified = false,
      this.max,
      this.mustSupport = false,
      this.mustSupportSpecified = false});

  factory ClassInfoElement.fromJson(Map<String, dynamic> json) =>
      _$ClassInfoElementFromJson(json);

  Map<String, dynamic> toJson() => _$ClassInfoElementToJson(this);
}

@JsonSerializable()
class ClassInfo extends TypeInfo {
  List<TypeParameterInfo>? parameter;
  List<ClassInfoElement>? element;
  List<RelationshipInfo>? contextRelationship;
  List<RelationshipInfo>? targetContextRelationship;
  List<SearchInfo>? search;
  List<ExpressionInfo>? inferenceExpression;
  List<ConstraintInfo>? constraint;
  String? namespace;
  String? name;
  String? identifier;
  String? label;
  String? description;
  String? definition;
  String? comment;
  String? target;
  bool retrievable = false;
  String? primaryCodePath;
  String? primaryValueSetPath;

  ClassInfo(
      {this.parameter,
      this.element,
      this.contextRelationship,
      this.targetContextRelationship,
      this.search,
      this.inferenceExpression,
      this.constraint,
      this.namespace,
      this.name,
      this.identifier,
      this.label,
      this.description,
      this.definition,
      this.comment,
      this.target,
      this.retrievable = false,
      this.primaryCodePath,
      this.primaryValueSetPath});

  factory ClassInfo.fromJson(Map<String, dynamic> json) =>
      _$ClassInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ClassInfoToJson(this);
}

@JsonSerializable()
class TypeInfo {
  TypeInfo({this.baseTypeSpecifier, this.baseType});

  TypeSpecifier? baseTypeSpecifier;
  String? baseType;

  factory TypeInfo.fromJson(Map<String, dynamic> json) =>
      _$TypeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TypeInfoToJson(this);
}

@JsonSerializable()
class SimpleTypeInfo extends TypeInfo {
  String? namespace;
  String? name;
  String? target;

  SimpleTypeInfo({this.namespace, this.name, this.target});

  factory SimpleTypeInfo.fromJson(Map<String, dynamic> json) =>
      _$SimpleTypeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleTypeInfoToJson(this);
}

@JsonSerializable()
class IntervalTypeInfo extends TypeInfo {
  TypeSpecifier? pointTypeSpecifier;
  String? pointType;

  IntervalTypeInfo({this.pointTypeSpecifier, this.pointType});

  factory IntervalTypeInfo.fromJson(Map<String, dynamic> json) =>
      _$IntervalTypeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$IntervalTypeInfoToJson(this);
}

@JsonSerializable()
class ListTypeInfo extends TypeInfo {
  TypeSpecifier? elementTypeSpecifier;
  String? elementType;

  ListTypeInfo({this.elementTypeSpecifier, this.elementType});

  factory ListTypeInfo.fromJson(Map<String, dynamic> json) =>
      _$ListTypeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ListTypeInfoToJson(this);
}

@JsonSerializable()
class TupleTypeInfoElement {
  TypeSpecifier? typeSpecifier;
  TypeSpecifier? elementTypeSpecifier;
  String? name;
  String? type;
  String? elementType;
  bool? prohibited;
  bool? prohibitedSpecified;
  bool? oneBased;
  bool? oneBasedSpecified;

  TupleTypeInfoElement({
    this.typeSpecifier,
    this.elementTypeSpecifier,
    this.name,
    this.type,
    this.elementType,
    this.prohibited,
    this.prohibitedSpecified,
    this.oneBased,
    this.oneBasedSpecified,
  });

  factory TupleTypeInfoElement.fromJson(Map<String, dynamic> json) =>
      _$TupleTypeInfoElementFromJson(json);

  Map<String, dynamic> toJson() => _$TupleTypeInfoElementToJson(this);
}

@JsonSerializable()
class TupleTypeInfo extends TypeInfo {
  List<TupleTypeInfoElement>? element;

  TupleTypeInfo({this.element});

  factory TupleTypeInfo.fromJson(Map<String, dynamic> json) =>
      _$TupleTypeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TupleTypeInfoToJson(this);
}

@JsonSerializable()
class ProfileInfo extends ClassInfo {}

@JsonSerializable()
class ConversionInfo {
  TypeSpecifier? fromTypeSpecifier;
  TypeSpecifier? toTypeSpecifier;
  String? functionName;
  String? fromType;
  String? toType;

  ConversionInfo(
      {this.fromTypeSpecifier,
      this.toTypeSpecifier,
      this.functionName,
      this.fromType,
      this.toType});

  factory ConversionInfo.fromJson(Map<String, dynamic> json) =>
      _$ConversionInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ConversionInfoToJson(this);
}

@JsonSerializable()
class ChoiceTypeInfo extends TypeInfo {
  List<TypeSpecifier>? type;
  List<TypeSpecifier>? choice;

  ChoiceTypeInfo({this.type, this.choice});

  factory ChoiceTypeInfo.fromJson(Map<String, dynamic> json) =>
      _$ChoiceTypeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ChoiceTypeInfoToJson(this);
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
class NamedTypeSpecifier extends TypeSpecifier {
  String? modelName;
  String? namespace;
  String? name;

  NamedTypeSpecifier({this.modelName, this.namespace, this.name});

  factory NamedTypeSpecifier.fromJson(Map<String, dynamic> json) =>
      _$NamedTypeSpecifierFromJson(json);

  Map<String, dynamic> toJson() => _$NamedTypeSpecifierToJson(this);
}

@JsonSerializable()
class ListTypeSpecifier extends TypeSpecifier {
  TypeSpecifier? elementTypeSpecifier;
  String? elementType;
}

@JsonSerializable()
class IntervalTypeSpecifier extends TypeSpecifier {
  IntervalTypeSpecifier({this.pointTypeSpecifier, this.pointType});

  TypeSpecifier? pointTypeSpecifier;
  String? pointType;

  factory IntervalTypeSpecifier.fromJson(Map<String, dynamic> json) =>
      _$IntervalTypeSpecifierFromJson(json);

  Map<String, dynamic> toJson() => _$IntervalTypeSpecifierToJson(this);
}

@JsonSerializable()
class ParameterTypeSpecifier extends TypeSpecifier {
  ParameterTypeSpecifier(
      {required this.name, required this.constraint, this.constraintType});
  String name;
  String constraint;
  String? constraintType;

  factory ParameterTypeSpecifier.fromJson(Map<String, dynamic> json) =>
      _$ParameterTypeSpecifierFromJson(json);

  Map<String, dynamic> toJson() => _$ParameterTypeSpecifierToJson(this);
}

@JsonSerializable()
class BoundParameterTypeSpecifier extends TypeSpecifier {
  BoundParameterTypeSpecifier(
      {required this.parameterName,
      required this.boundType,
      this.elementTypeSpecifier});

  String parameterName;
  String boundType;
  TypeSpecifier? elementTypeSpecifier;

  factory BoundParameterTypeSpecifier.fromJson(Map<String, dynamic> json) =>
      _$BoundParameterTypeSpecifierFromJson(json);

  Map<String, dynamic> toJson() => _$BoundParameterTypeSpecifierToJson(this);
}

@JsonSerializable()
class TypeParameterInfo {
  TypeParameterInfo(
      {this.typeSpecifier,
      required this.name,
      required this.constraint,
      this.constraintType});

  TypeSpecifier? typeSpecifier;
  String name;
  String constraint;
  String? constraintType;

  factory TypeParameterInfo.fromJson(Map<String, dynamic> json) =>
      _$TypeParameterInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TypeParameterInfoToJson(this);
}

@JsonSerializable()
class TupleTypeSpecifierElement {
  TupleTypeSpecifierElement({required this.elementType, required this.name});

  TypeSpecifier elementType;
  String name;

  factory TupleTypeSpecifierElement.fromJson(Map<String, dynamic> json) =>
      _$TupleTypeSpecifierElementFromJson(json);

  Map<String, dynamic> toJson() => _$TupleTypeSpecifierElementToJson(this);
}
