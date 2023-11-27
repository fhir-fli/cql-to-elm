import 'package:json_annotation/json_annotation.dart';

import 'elm.dart';

part 'clinical_expression.g.dart';

@JsonSerializable()
class CodeFilterElement extends ElmElement {
  String? property;
  String? valueSetProperty;
  String? search;
  String comparator;
  Expression value;

  CodeFilterElement({
    this.property,
    this.valueSetProperty,
    this.search,
    required this.comparator,
    required this.value,
  });

  factory CodeFilterElement.fromJson(Map<String, dynamic> json) =>
      _$CodeFilterElementFromJson(json);

  Map<String, dynamic> toJson() => _$CodeFilterElementToJson(this);
}

@JsonSerializable()
class DateFilterElement extends ElmElement {
  String? property;
  String? lowProperty;
  String? highProperty;
  String? search;
  Expression value;

  DateFilterElement({
    this.property,
    this.lowProperty,
    this.highProperty,
    this.search,
    required this.value,
  });

  factory DateFilterElement.fromJson(Map<String, dynamic> json) =>
      _$DateFilterElementFromJson(json);

  Map<String, dynamic> toJson() => _$DateFilterElementToJson(this);
}

@JsonSerializable()
class OtherFilterElement extends ElmElement {
  String? property;
  String? search;
  String comparator;
  Expression value;

  OtherFilterElement({
    this.property,
    this.search,
    required this.comparator,
    required this.value,
  });

  factory OtherFilterElement.fromJson(Map<String, dynamic> json) =>
      _$OtherFilterElementFromJson(json);

  Map<String, dynamic> toJson() => _$OtherFilterElementToJson(this);
}

@JsonSerializable()
class IncludeElement extends ElmElement {
  String? includeFrom;
  String redDataType;
  String? redProperty;
  String? redSearch;
  bool? isReverse;

  IncludeElement({
    this.includeFrom,
    required this.redDataType,
    this.redProperty,
    this.redSearch,
    this.isReverse,
  });

  factory IncludeElement.fromJson(Map<String, dynamic> json) =>
      _$IncludeElementFromJson(json);

  Map<String, dynamic> toJson() => _$IncludeElementToJson(this);
}

@JsonSerializable()
class Retrieve extends Expression {
  Expression id;
  Expression codes;
  Expression dateRange;
  Expression context;
  List<IncludeElement> include;
  List<CodeFilterElement> codeFilter;
  List<DateFilterElement> dateFilter;
  List<OtherFilterElement> otherFilter;
  String dataType;
  String? templateId;
  String? idProperty;
  String? idSearch;
  String? contextProperty;
  String? contextSearch;
  String? codeProperty;
  String? codeSearch;
  String? codeComparator;
  String? valueSetProperty;
  String? dateProperty;
  String? dateLowProperty;
  String? dateHighProperty;
  String? dateSearch;
  String? includedIn;

  Retrieve({
    required this.id,
    required this.codes,
    required this.dateRange,
    required this.context,
    required this.include,
    required this.codeFilter,
    required this.dateFilter,
    required this.otherFilter,
    required this.dataType,
    this.templateId,
    this.idProperty,
    this.idSearch,
    this.contextProperty,
    this.contextSearch,
    this.codeProperty,
    this.codeSearch,
    this.codeComparator,
    this.valueSetProperty,
    this.dateProperty,
    this.dateLowProperty,
    this.dateHighProperty,
    this.dateSearch,
    this.includedIn,
  });

  factory Retrieve.fromJson(Map<String, dynamic> json) =>
      _$RetrieveFromJson(json);

  Map<String, dynamic> toJson() => _$RetrieveToJson(this);
}

@JsonSerializable()
class Search extends Property {
  Search({required super.path});
}

@JsonSerializable()
class CodeSystemDef extends ElmElement {
  String name;
  String id;
  String? version;
  AccessModifier accessLevel;

  CodeSystemDef({
    required this.name,
    required this.id,
    this.version,
    this.accessLevel = AccessModifier.Public,
  });

  factory CodeSystemDef.fromJson(Map<String, dynamic> json) =>
      _$CodeSystemDefFromJson(json);

  Map<String, dynamic> toJson() => _$CodeSystemDefToJson(this);
}

@JsonSerializable()
class ValueSetDef extends ElmElement {
  List<CodeSystemRef>? codeSystem;
  String? name;
  String id;
  String? version;
  AccessModifier accessLevel;

  ValueSetDef({
    this.codeSystem,
    this.name,
    required this.id,
    this.version,
    this.accessLevel = AccessModifier.Public,
  });

  factory ValueSetDef.fromJson(Map<String, dynamic> json) =>
      _$ValueSetDefFromJson(json);

  Map<String, dynamic> toJson() => _$ValueSetDefToJson(this);
}

@JsonSerializable()
class CodeDef extends ElmElement {
  CodeSystemRef? codeSystem;
  String name;
  String id;
  String? display;
  AccessModifier accessLevel;

  CodeDef({
    this.codeSystem,
    required this.name,
    required this.id,
    this.display,
    this.accessLevel = AccessModifier.Public,
  });

  factory CodeDef.fromJson(Map<String, dynamic> json) =>
      _$CodeDefFromJson(json);

  Map<String, dynamic> toJson() => _$CodeDefToJson(this);
}

@JsonSerializable()
class ConceptDef extends ElmElement {
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
class CodeSystemRef extends Expression {
  String name;
  String? libraryName;

  CodeSystemRef({
    required this.name,
    this.libraryName,
  });

  factory CodeSystemRef.fromJson(Map<String, dynamic> json) =>
      _$CodeSystemRefFromJson(json);

  Map<String, dynamic> toJson() => _$CodeSystemRefToJson(this);

  String? getLibraryName() => libraryName;

  String? getName() => name;
}

@JsonSerializable()
class ValueSetRef extends Expression {
  String name;
  String? libraryName;
  bool? preserve;

  ValueSetRef({
    required this.name,
    this.libraryName,
    this.preserve,
  });

  factory ValueSetRef.fromJson(Map<String, dynamic> json) =>
      _$ValueSetRefFromJson(json);

  Map<String, dynamic> toJson() => _$ValueSetRefToJson(this);

  String? getLibraryName() => libraryName;

  String? getName() => name;
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
class ElmCode extends Expression {
  String code;
  String? display;
  CodeSystemRef? system;
  String? version;

  ElmCode({
    required this.code,
    this.display,
    this.system,
    this.version,
  });

  factory ElmCode.fromJson(Map<String, dynamic> json) =>
      _$ElmCodeFromJson(json);

  Map<String, dynamic> toJson() => _$ElmCodeToJson(this);
}

@JsonSerializable()
class Concept extends Expression {
  List<ElmCode> code;
  String? display;

  Concept({
    required this.code,
    this.display,
  });

  factory Concept.fromJson(Map<String, dynamic> json) =>
      _$ConceptFromJson(json);

  Map<String, dynamic> toJson() => _$ConceptToJson(this);
}

@JsonSerializable()
class InCodeSystem extends OperatorExpression {
  Expression code;
  CodeSystemRef? codesystem;
  Expression? codesystemExpression;

  InCodeSystem({
    required this.code,
    this.codesystem,
    this.codesystemExpression,
  });

  factory InCodeSystem.fromJson(Map<String, dynamic> json) =>
      _$InCodeSystemFromJson(json);

  Map<String, dynamic> toJson() => _$InCodeSystemToJson(this);
}

@JsonSerializable()
class AnyInCodeSystem extends OperatorExpression {
  Expression codes;
  CodeSystemRef? codesystem;
  Expression? codesystemExpression;

  AnyInCodeSystem({
    required this.codes,
    this.codesystem,
    this.codesystemExpression,
  });

  factory AnyInCodeSystem.fromJson(Map<String, dynamic> json) =>
      _$AnyInCodeSystemFromJson(json);

  Map<String, dynamic> toJson() => _$AnyInCodeSystemToJson(this);
}

@JsonSerializable()
class InValueSet extends OperatorExpression {
  Expression code;
  ValueSetRef? valueset;
  Expression? valuesetExpression;

  InValueSet({
    required this.code,
    this.valueset,
    this.valuesetExpression,
  });

  factory InValueSet.fromJson(Map<String, dynamic> json) =>
      _$InValueSetFromJson(json);

  Map<String, dynamic> toJson() => _$InValueSetToJson(this);
}

@JsonSerializable()
class AnyInValueSet extends OperatorExpression {
  Expression codes;
  ValueSetRef? valueset;
  Expression? valuesetExpression;

  AnyInValueSet({
    required this.codes,
    this.valueset,
    this.valuesetExpression,
  });

  factory AnyInValueSet.fromJson(Map<String, dynamic> json) =>
      _$AnyInValueSetFromJson(json);

  Map<String, dynamic> toJson() => _$AnyInValueSetToJson(this);
}

@JsonSerializable()
class ExpandValueSet extends UnaryExpression {
  ExpandValueSet({required super.operand});

  factory ExpandValueSet.fromJson(Map<String, dynamic> json) =>
      _$ExpandValueSetFromJson(json);

  Map<String, dynamic> toJson() => _$ExpandValueSetToJson(this);
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
