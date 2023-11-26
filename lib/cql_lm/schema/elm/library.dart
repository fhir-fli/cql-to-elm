import 'package:fhir/r4.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:xml/xml.dart';

import '../schema.dart';

part 'library.g.dart';

@JsonSerializable()
class VersionedIdentifier {
  VersionedIdentifier({this.id, this.system, this.version});

  String? id;
  String? system;
  String? version;

  factory VersionedIdentifier.fromXmlElement(XmlElement element) {
    return VersionedIdentifier(
      id: element.getAttribute('id'),
      system: element.getAttribute('system'),
      version: element.getAttribute('version'),
    );
  }

  factory VersionedIdentifier.fromJson(Map<String, dynamic> json) =>
      _$VersionedIdentifierFromJson(json);

  Map<String, dynamic> toJson() => _$VersionedIdentifierToJson(this);
}

@JsonSerializable()
class UsingDef {
  UsingDef({required this.localIdentifier, required this.uri, this.version});

  String localIdentifier;
  String uri;
  String? version;

  factory UsingDef.fromXmlElement(XmlElement element) {
    return UsingDef(
      localIdentifier: element.getAttribute('localIdentifier') ?? '',
      uri: element.getAttribute('uri') ?? '',
      version: element.getAttribute('version'),
    );
  }

  factory UsingDef.fromJson(Map<String, dynamic> json) =>
      _$UsingDefFromJson(json);

  Map<String, dynamic> toJson() => _$UsingDefToJson(this);
}

@JsonSerializable()
class IncludeDef {
  String localIdentifier;
  String mediaType;
  String path;
  String? version;

  IncludeDef({
    required this.localIdentifier,
    this.mediaType = 'application/elm+xml',
    required this.path,
    this.version,
  });

  factory IncludeDef.fromXmlElement(XmlElement element) {
    return IncludeDef(
      localIdentifier: element.getAttribute('localIdentifier') ?? '',
      mediaType: element.getAttribute('mediaType') ?? 'application/elm+xml',
      path: element.getAttribute('path') ?? '',
      version: element.getAttribute('version'),
    );
  }

  factory IncludeDef.fromJson(Map<String, dynamic> json) =>
      _$IncludeDefFromJson(json);

  Map<String, dynamic> toJson() => _$IncludeDefToJson(this);
}

@JsonSerializable()
class ContextDef implements Element {
  final String? name;

  const ContextDef({this.name});

  factory ContextDef.fromXmlElement(XmlElement element) {
    return ContextDef(name: element.getAttribute('name'));
  }

  factory ContextDef.fromJson(Map<String, dynamic> json) =>
      _$ContextDefFromJson(json);

  Map<String, dynamic> toJson() => _$ContextDefToJson(this);

  @override
  $ElementCopyWith<Element> get copyWith => copyWith;

  @override
  List<FhirExtension>? get extension_ => extension_;

  @override
  String? get fhirId => fhirId;

  @override
  String toJsonString() => toJson().toString();

  @override
  String toYaml() => toYaml();
}

@JsonSerializable()
class Library {
  VersionedIdentifier? identifier;
  VersionedIdentifier? schemaIdentifier;
  List<UsingDef>? usings;
  List<IncludeDef>? includes;
  List<ParameterDef>? parameters;
  List<CodeSystemDef>? codeSystems;
  List<ValueSetDef>? valueSets;
  List<CodeDef>? codes;
  List<ConceptDef>? concepts;
  List<ExpressionDef>? statements;

  Library({
    required this.identifier,
    required this.schemaIdentifier,
    this.usings,
    this.includes,
    this.parameters,
    this.codeSystems,
    this.valueSets,
    this.codes,
    this.concepts,
    this.statements,
  });

  factory Library.fromXmlElement(XmlElement element) {
    final identifierElement = element.findElements('identifier').firstOrNull;
    final schemaIdentifierElement =
        element.findElements('schemaIdentifier').firstOrNull;
    final usingsElements = element.findElements('usings').firstOrNull;
    final includesElements = element.findElements('includes').firstOrNull;
    final parametersElements = element.findElements('parameters').firstOrNull;

    return Library(
      identifier: identifierElement != null
          ? VersionedIdentifier.fromXmlElement(identifierElement)
          : null,
      schemaIdentifier: schemaIdentifierElement != null
          ? VersionedIdentifier.fromXmlElement(schemaIdentifierElement)
          : null,
      usings: usingsElements != null
          ? usingsElements
              .findElements('def')
              .map((def) => UsingDef.fromXmlElement(def))
              .toList()
          : null,
      includes: includesElements != null
          ? includesElements
              .findElements('def')
              .map((def) => IncludeDef.fromXmlElement(def))
              .toList()
          : null,
      parameters: parametersElements != null
          ? parametersElements
              .findElements('def')
              .map((def) => ParameterDef.fromXmlElement(def))
              .toList()
          : null,
    );
  }

  factory Library.fromJson(Map<String, dynamic> json) =>
      _$LibraryFromJson(json);

  Map<String, dynamic> toJson() => _$LibraryToJson(this);
}
