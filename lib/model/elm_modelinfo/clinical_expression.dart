import 'package:json_annotation/json_annotation.dart';

import 'elm_modelinfo.dart';

part 'clinical_expression.g.dart';

@JsonSerializable()
class Retrieve {
  String dataType;
  String? templateId;
  String? idProperty;
  String? codeProperty;
  String? valueSetProperty;
  String? dateProperty;
  String? dateLowProperty;
  String? dateHighProperty;
  Expression? codes;
  Expression? dateRange;
  Expression? context;

  Retrieve({
    required this.dataType,
    this.templateId,
    this.idProperty,
    this.codeProperty,
    this.valueSetProperty,
    this.dateProperty,
    this.dateLowProperty,
    this.dateHighProperty,
    this.codes,
    this.dateRange,
    this.context,
  });

  factory Retrieve.fromJson(Map<String, dynamic> json) =>
      _$RetrieveFromJson(json);

  Map<String, dynamic> toJson() => _$RetrieveToJson(this);
}

@JsonSerializable()
class CodeSystemDef extends Element {
  String name;
  String id;
  String? version;
  String accessLevel;

  CodeSystemDef({
    required this.name,
    required this.id,
    this.version,
    this.accessLevel = 'Public',
  });

  factory CodeSystemDef.fromJson(Map<String, dynamic> json) =>
      _$CodeSystemDefFromJson(json);

  Map<String, dynamic> toJson() => _$CodeSystemDefToJson(this);
}

@JsonSerializable()
class ValueSetDef extends Element {
  List<CodeSystemRef>? codeSystem;
  String? name;
  String id;
  String? version;
  String accessLevel;

  ValueSetDef({
    this.codeSystem,
    this.name,
    required this.id,
    this.version,
    this.accessLevel = 'Public',
  });

  factory ValueSetDef.fromJson(Map<String, dynamic> json) =>
      _$ValueSetDefFromJson(json);

  Map<String, dynamic> toJson() => _$ValueSetDefToJson(this);
}

@JsonSerializable()
class CodeDef extends Element {
  CodeSystemRef? codeSystem;
  String name;
  String id;
  String? display;
  String accessLevel;

  CodeDef({
    this.codeSystem,
    required this.name,
    required this.id,
    this.display,
    this.accessLevel = 'Public',
  });

  factory CodeDef.fromJson(Map<String, dynamic> json) =>
      _$CodeDefFromJson(json);

  Map<String, dynamic> toJson() => _$CodeDefToJson(this);
}

@JsonSerializable()
class ConceptDef extends Element {
  String name;
  String? display;
  AccessModifier accessLevel;
  List<CodeRef> code;

  ConceptDef({
    required this.name,
    this.display,
    this.accessLevel = AccessModifier.Public,
    required this.code,
  });

  factory ConceptDef.fromJson(Map<String, dynamic> json) =>
      _$ConceptDefFromJson(json);

  Map<String, dynamic> toJson() => _$ConceptDefToJson(this);
}

@JsonSerializable()
class CodeSystemRef {
  String name;
  String id;
  String? version;
  String accessLevel;

  CodeSystemRef({
    required this.name,
    required this.id,
    this.version,
    this.accessLevel = 'Public',
  });

  factory CodeSystemRef.fromJson(Map<String, dynamic> json) =>
      _$CodeSystemRefFromJson(json);

  Map<String, dynamic> toJson() => _$CodeSystemRefToJson(this);
}

@JsonSerializable()
class ValueSetRef extends Expression {
  String? name;
  String? libraryName;

  ValueSetRef({this.name, this.libraryName});

  factory ValueSetRef.fromJson(Map<String, dynamic> json) =>
      _$ValueSetRefFromJson(json);

  Map<String, dynamic> toJson() => _$ValueSetRefToJson(this);
}

@JsonSerializable()
class CodeRef extends Expression {
  String? name;
  String? libraryName;

  CodeRef({this.name, this.libraryName});

  factory CodeRef.fromJson(Map<String, dynamic> json) =>
      _$CodeRefFromJson(json);

  Map<String, dynamic> toJson() => _$CodeRefToJson(this);
}

@JsonSerializable()
class ConceptRef extends Expression {
  String? name;
  String? libraryName;

  ConceptRef({this.name, this.libraryName});

  factory ConceptRef.fromJson(Map<String, dynamic> json) =>
      _$ConceptRefFromJson(json);

  Map<String, dynamic> toJson() => _$ConceptRefToJson(this);
}

@JsonSerializable()
class InCodeSystem extends OperatorExpression {
  Expression code;
  CodeSystemRef codesystem;

  InCodeSystem({required this.code, required this.codesystem});

  factory InCodeSystem.fromJson(Map<String, dynamic> json) =>
      _$InCodeSystemFromJson(json);

  Map<String, dynamic> toJson() => _$InCodeSystemToJson(this);
}

@JsonSerializable()
class AnyInCodeSystem extends OperatorExpression {
  Expression codes;
  CodeSystemRef codesystem;

  AnyInCodeSystem({required this.codes, required this.codesystem});

  factory AnyInCodeSystem.fromJson(Map<String, dynamic> json) =>
      _$AnyInCodeSystemFromJson(json);

  Map<String, dynamic> toJson() => _$AnyInCodeSystemToJson(this);
}

@JsonSerializable()
class InValueSet extends OperatorExpression {
  Expression code;
  ValueSetRef valueset;

  InValueSet({required this.code, required this.valueset});

  factory InValueSet.fromJson(Map<String, dynamic> json) =>
      _$InValueSetFromJson(json);

  Map<String, dynamic> toJson() => _$InValueSetToJson(this);
}

@JsonSerializable()
class AnyInValueSet extends OperatorExpression {
  Expression codes;
  ValueSetRef valueset;

  AnyInValueSet({required this.codes, required this.valueset});

  factory AnyInValueSet.fromJson(Map<String, dynamic> json) =>
      _$AnyInValueSetFromJson(json);

  Map<String, dynamic> toJson() => _$AnyInValueSetToJson(this);
}

@JsonSerializable()
class Subsumes extends BinaryExpression {
  Subsumes({required super.operand});

  factory Subsumes.fromJson(Map<String, dynamic> json) =>
      _$SubsumesFromJson(json);

  Map<String, dynamic> toJson() => _$SubsumesToJson(this);
}

@JsonSerializable()
class SubsumedBy extends BinaryExpression {
  SubsumedBy({required super.operand});

  factory SubsumedBy.fromJson(Map<String, dynamic> json) =>
      _$SubsumedByFromJson(json);

  Map<String, dynamic> toJson() => _$SubsumedByToJson(this);
}

@JsonSerializable()
class CalculateAge extends UnaryExpression {
  DateTimePrecision precision;

  CalculateAge({required this.precision, required super.operand});

  factory CalculateAge.fromJson(Map<String, dynamic> json) =>
      _$CalculateAgeFromJson(json);

  Map<String, dynamic> toJson() => _$CalculateAgeToJson(this);
}

@JsonSerializable()
class CalculateAgeAt extends BinaryExpression {
  DateTimePrecision precision;

  CalculateAgeAt({required this.precision, required super.operand});

  factory CalculateAgeAt.fromJson(Map<String, dynamic> json) =>
      _$CalculateAgeAtFromJson(json);

  Map<String, dynamic> toJson() => _$CalculateAgeAtToJson(this);
}
