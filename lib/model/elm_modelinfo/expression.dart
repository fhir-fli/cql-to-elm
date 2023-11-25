import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:xml/xml.dart';

import 'elm_modelinfo.dart';

part 'expression.g.dart';

@JsonSerializable()
class TypeSpecifier extends Element {
  String? localId;
  String? locator;
  String? resultTypeName;
  List<Element?>? annotation;
  TypeSpecifier? resultTypeSpecifier;

  TypeSpecifier();

  factory TypeSpecifier.fromJson(Map<String, dynamic> json) =>
      _$TypeSpecifierFromJson(json);

  Map<String, dynamic> toJson() => _$TypeSpecifierToJson(this);
}

@JsonSerializable()
class TupleElementDefinition extends Element {
  String name;
  TypeSpecifier? type; // Deprecated, use elementType
  TypeSpecifier? elementType;

  TupleElementDefinition({required this.name});

  factory TupleElementDefinition.fromJson(Map<String, dynamic> json) =>
      _$TupleElementDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$TupleElementDefinitionToJson(this);
}

@JsonSerializable()
class TupleTypeSpecifier extends TypeSpecifier {
  @JsonKey(name: 'element')
  List<TupleElementDefinition>? element;

  TupleTypeSpecifier({this.element});

  factory TupleTypeSpecifier.fromJson(Map<String, dynamic> json) =>
      _$TupleTypeSpecifierFromJson(json);

  Map<String, dynamic> toJson() => _$TupleTypeSpecifierToJson(this);
}

@JsonSerializable()
class ChoiceTypeSpecifier extends TypeSpecifier {
  @JsonKey(name: 'type')
  List<TypeSpecifier>? type;

  @JsonKey(name: 'choice')
  List<TypeSpecifier>? choice;

  ChoiceTypeSpecifier({this.type, this.choice});

  factory ChoiceTypeSpecifier.fromJson(Map<String, dynamic> json) =>
      _$ChoiceTypeSpecifierFromJson(json);

  Map<String, dynamic> toJson() => _$ChoiceTypeSpecifierToJson(this);
}

@JsonSerializable()
class Expression extends Element {
  Expression();

  factory Expression.fromXmlElement(XmlElement element) {
    var expressionElement = element.children
        .whereType<XmlElement>()
        .firstWhereOrNull((e) => e.name.local == 'Expression');

    return expressionElement != null
        ? Expression.fromXmlElement(expressionElement)
        : Expression();
  }

  factory Expression.fromJson(Map<String, dynamic> json) =>
      _$ExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$ExpressionToJson(this);
}

@JsonSerializable()
class OperatorExpression extends Expression {
  @JsonKey(name: 'signature')
  List<TypeSpecifier>? signature;

  OperatorExpression({this.signature});

  factory OperatorExpression.fromJson(Map<String, dynamic> json) =>
      _$OperatorExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$OperatorExpressionToJson(this);
}

@JsonSerializable()
class UnaryExpression extends OperatorExpression {
  @JsonKey(name: 'operand', required: true)
  Expression operand;

  UnaryExpression({required this.operand});

  factory UnaryExpression.fromJson(Map<String, dynamic> json) =>
      _$UnaryExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$UnaryExpressionToJson(this);
}

@JsonSerializable()
class BinaryExpression extends OperatorExpression {
  @JsonKey(name: 'operand', required: true)
  List<Expression> operand;

  BinaryExpression({required this.operand});

  factory BinaryExpression.fromJson(Map<String, dynamic> json) =>
      _$BinaryExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$BinaryExpressionToJson(this);
}

@JsonSerializable()
class TernaryExpression extends OperatorExpression {
  @JsonKey(name: 'operand', required: true)
  List<Expression> operand;

  TernaryExpression({required this.operand});

  factory TernaryExpression.fromJson(Map<String, dynamic> json) =>
      _$TernaryExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$TernaryExpressionToJson(this);
}

@JsonSerializable()
class NaryExpression extends OperatorExpression {
  @JsonKey(name: 'operand')
  List<Expression>? operand;

  NaryExpression({this.operand});

  factory NaryExpression.fromJson(Map<String, dynamic> json) =>
      _$NaryExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$NaryExpressionToJson(this);
}

enum AccessModifier { Public, Private }

@JsonSerializable()
class ExpressionDef extends Element {
  @JsonKey(name: 'expression')
  Expression? expression;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'context')
  String? context;

  @JsonKey(name: 'accessLevel', unknownEnumValue: AccessModifier.Public)
  AccessModifier accessLevel;

  ExpressionDef({
    required this.name,
    this.expression,
    this.context,
    this.accessLevel = AccessModifier.Public,
  });

  factory ExpressionDef.fromJson(Map<String, dynamic> json) =>
      _$ExpressionDefFromJson(json);

  Map<String, dynamic> toJson() => _$ExpressionDefToJson(this);
}

class FunctionDef extends ExpressionDef {
  bool? external;
  List<OperandDef>? operand;

  FunctionDef({
    String? name,
    String? context,
    AccessModifier accessLevel = AccessModifier.Public,
    Expression? expression,
    this.external,
    this.operand,
  }) : super(
          name: name,
          context: context,
          accessLevel: accessLevel,
          expression: expression,
        );
}

class ExpressionRef extends Expression {
  String? name;
  String? libraryName;

  ExpressionRef({this.name, this.libraryName});
}

class FunctionRef extends ExpressionRef {
  List<TypeSpecifier>? signature;
  List<Expression>? operand;

  FunctionRef({
    String? name,
    String? libraryName,
    this.signature,
    this.operand,
  }) : super(name: name, libraryName: libraryName);
}

@JsonSerializable()
class ParameterDef extends Element {
  String? name;
  String? parameterType;
  AccessModifier accessLevel;
  Expression? defaultExpr;
  TypeSpecifier? parameterTypeSpecifier;

  ParameterDef({
    this.name,
    this.parameterType,
    this.accessLevel = AccessModifier.Public,
    this.defaultExpr,
    this.parameterTypeSpecifier,
  });

  factory ParameterDef.fromXmlElement(XmlElement element) {
    var defaultElement = element.children
        .whereType<XmlElement>()
        .firstWhereOrNull((e) => e.name.local == 'Default');

    var defaultExpressionElement = defaultElement != null
        ? defaultElement.children
            .whereType<XmlElement>()
            .firstWhereOrNull((e) => e.name.local == 'Expression')
        : null;

    var defaultExpr = defaultExpressionElement != null
        ? Expression.fromXmlElement(defaultExpressionElement)
        : null;

    var accessLevelString = element.getAttribute('accessLevel');
    var accessLevel = accessLevelString == 'Private'
        ? AccessModifier.Private
        : AccessModifier.Public;

    return ParameterDef(
      name: element.getAttribute('name'),
      parameterType: element.getAttribute('type'),
      accessLevel: accessLevel,
      defaultExpr: defaultExpr,
    );
  }

  factory ParameterDef.fromJson(Map<String, dynamic> json) =>
      _$ParameterDefFromJson(json);

  Map<String, dynamic> toJson() => _$ParameterDefToJson(this);
}

class ParameterRef extends Expression {
  String? name;
  String? libraryName;

  ParameterRef({this.name, this.libraryName});
}

class OperandDef extends Element {
  String? name;
  String? operandType;
  TypeSpecifier? operandTypeSpecifier;

  OperandDef({this.name, this.operandType, this.operandTypeSpecifier});
}

class OperandRef extends Expression {
  String? name;

  OperandRef({this.name});
}

class IdentifierRef extends Expression {
  String? name;
  String? libraryName;

  IdentifierRef({this.name, this.libraryName});
}

enum DateTimePrecision {
  Year,
  Month,
  Week,
  Day,
  Hour,
  Minute,
  Second,
  Millisecond,
}
