import 'package:json_annotation/json_annotation.dart';

import 'type_specifiers.dart';

part 'type_info.g.dart';

@JsonSerializable()
abstract class TypeInfo {
  TypeSpecifier? baseTypeSpecifier;
  String? baseType;

  TypeInfo({this.baseTypeSpecifier, this.baseType});

  factory TypeInfo.fromJson(Map<String, dynamic> json) =>
      _$TypeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TypeInfoToJson(this);
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
class TupleTypeInfo extends TypeInfo {
  List<TupleTypeInfoElement>? element;

  TupleTypeInfo({this.element});

  factory TupleTypeInfo.fromJson(Map<String, dynamic> json) =>
      _$TupleTypeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TupleTypeInfoToJson(this);
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
class IntervalTypeInfo extends TypeInfo {
  TypeSpecifier? pointTypeSpecifier;
  String? pointType;

  IntervalTypeInfo({this.pointTypeSpecifier, this.pointType});

  factory IntervalTypeInfo.fromJson(Map<String, dynamic> json) =>
      _$IntervalTypeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$IntervalTypeInfoToJson(this);
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
class TypeParameterInfo {
  TypeSpecifier? typeSpecifier;
  String? name;
  String? constraint;
  String? constraintType;

  TypeParameterInfo(
      {this.typeSpecifier, this.name, this.constraint, this.constraintType});

  factory TypeParameterInfo.fromJson(Map<String, dynamic> json) =>
      _$TypeParameterInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TypeParameterInfoToJson(this);
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

enum BindingStrength {
  @JsonValue('Required')
  required,
  @JsonValue('Extensible')
  extensible,
  @JsonValue('Preferred')
  preferred,
  @JsonValue('Example')
  example,
}

@JsonSerializable()
class BindingInfo {
  String? name;
  String? description;
  BindingStrength? strength;
  String? valueSet;

  BindingInfo({this.name, this.description, this.strength, this.valueSet});

  factory BindingInfo.fromJson(Map<String, dynamic> json) =>
      _$BindingInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BindingInfoToJson(this);
}

@JsonSerializable()
class ConstraintInfo {
  List<ExpressionInfo>? expression;
  String? name;
  String? severity;
  String? description;
  String? message;

  ConstraintInfo(
      {this.expression,
      this.name,
      this.severity,
      this.description,
      this.message});

  factory ConstraintInfo.fromJson(Map<String, dynamic> json) =>
      _$ConstraintInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ConstraintInfoToJson(this);
}

@JsonSerializable()
class ExpressionInfo {
  String? language;
  String? expression;

  ExpressionInfo({this.language, this.expression});

  factory ExpressionInfo.fromJson(Map<String, dynamic> json) =>
      _$ExpressionInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ExpressionInfoToJson(this);
}

@JsonSerializable()
class RelationshipInfo {
  String? context;
  String? relatedKeyElement;

  RelationshipInfo({this.context, this.relatedKeyElement});

  factory RelationshipInfo.fromJson(Map<String, dynamic> json) =>
      _$RelationshipInfoFromJson(json);

  Map<String, dynamic> toJson() => _$RelationshipInfoToJson(this);
}

@JsonSerializable()
class SearchInfo {
  TypeSpecifier? typeSpecifier;
  String? name;
  String? path;
  String? type;
  String? label;
  String? description;
  String? definition;
  String? comment;

  SearchInfo(
      {this.typeSpecifier,
      this.name,
      this.path,
      this.type,
      this.label,
      this.description,
      this.definition,
      this.comment});

  factory SearchInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchInfoToJson(this);
}
