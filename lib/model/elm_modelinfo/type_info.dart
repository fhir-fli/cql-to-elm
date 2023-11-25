import 'package:json_annotation/json_annotation.dart';

import 'elm_modelinfo.dart';

part 'type_info.g.dart';

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
