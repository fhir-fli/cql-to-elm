import 'package:collection/collection.dart';
import 'package:fhir/r4.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:xml/xml.dart';

import '../schema.dart';

part 'expression.g.dart';

/// The Element type defines the abstract base type for all library elements in ELM.
@JsonSerializable()
class ElmElement {
  ElmElement({
    this.localId,
    this.locator,
    this.resultTypeName,
    this.annotation,
    this.resultTypeSpecifier,
  });

  String? localId;
  String? locator;
  String? resultTypeName;
  List<CqlToElmBase>? annotation;
  TypeSpecifier? resultTypeSpecifier;

  factory ElmElement.fromJson(Map<String, dynamic> json) =>
      _$ElmElementFromJson(json);

  Map<String, dynamic> toJson() => _$ElmElementToJson(this);
}

@JsonSerializable()
class TypeSpecifier {
  String? localId;
  String? locator;
  String? resultTypeName;
  List<Element>? annotation;
  TypeSpecifier? resultTypeSpecifier;

  TypeSpecifier({
    this.localId,
    this.locator,
    this.resultTypeName,
    this.annotation,
    this.resultTypeSpecifier,
  });

  factory TypeSpecifier.fromJson(Map<String, dynamic> json) =>
      _$TypeSpecifierFromJson(json);

  Map<String, dynamic> toJson() => _$TypeSpecifierToJson(this);
}

@JsonSerializable()
class TupleElementDefinition {
  String name;
  TypeSpecifier? type; // Deprecated, use elementType
  TypeSpecifier? elementType;

  TupleElementDefinition({required this.name});

  factory TupleElementDefinition.fromJson(Map<String, dynamic> json) =>
      _$TupleElementDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$TupleElementDefinitionToJson(this);
}

@JsonSerializable()
class Expression {
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
class ExpressionDef {
  Expression? expression;
  String? name;
  String? context;
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

@JsonSerializable()
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

  factory FunctionDef.fromJson(Map<String, dynamic> json) =>
      _$FunctionDefFromJson(json);

  Map<String, dynamic> toJson() => _$FunctionDefToJson(this);
}

@JsonSerializable()
class ExpressionRef extends Expression {
  String? name;
  String? libraryName;

  ExpressionRef({this.name, this.libraryName});

  factory ExpressionRef.fromJson(Map<String, dynamic> json) =>
      _$ExpressionRefFromJson(json);

  Map<String, dynamic> toJson() => _$ExpressionRefToJson(this);
}

@JsonSerializable()
class FunctionRef extends ExpressionRef {
  List<TypeSpecifier>? signature;
  List<Expression>? operand;

  FunctionRef({
    String? name,
    String? libraryName,
    this.signature,
    this.operand,
  }) : super(name: name, libraryName: libraryName);

  factory FunctionRef.fromJson(Map<String, dynamic> json) =>
      _$FunctionRefFromJson(json);

  Map<String, dynamic> toJson() => _$FunctionRefToJson(this);
}

@JsonSerializable()
class ParameterDef {
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

@JsonSerializable()
class ParameterRef extends Expression {
  String? name;
  String? libraryName;

  ParameterRef({this.name, this.libraryName});

  factory ParameterRef.fromJson(Map<String, dynamic> json) =>
      _$ParameterRefFromJson(json);

  Map<String, dynamic> toJson() => _$ParameterRefToJson(this);
}

@JsonSerializable()
class OperandDef {
  String? name;
  String? operandType;
  TypeSpecifier? operandTypeSpecifier;

  OperandDef({this.name, this.operandType, this.operandTypeSpecifier});

  factory OperandDef.fromJson(Map<String, dynamic> json) =>
      _$OperandDefFromJson(json);

  Map<String, dynamic> toJson() => _$OperandDefToJson(this);
}

@JsonSerializable()
class OperandRef extends Expression {
  String? name;

  OperandRef({this.name});

  factory OperandRef.fromJson(Map<String, dynamic> json) =>
      _$OperandRefFromJson(json);

  Map<String, dynamic> toJson() => _$OperandRefToJson(this);
}

@JsonSerializable()
class IdentifierRef extends Expression {
  String? name;
  String? libraryName;

  IdentifierRef({this.name, this.libraryName});

  factory IdentifierRef.fromJson(Map<String, dynamic> json) =>
      _$IdentifierRefFromJson(json);

  Map<String, dynamic> toJson() => _$IdentifierRefToJson(this);
}

@JsonSerializable()
class Literal extends Expression {
  late QName valueType;
  dynamic value;

  Literal({required this.valueType, this.value});

  factory Literal.fromJson(Map<String, dynamic> json) =>
      _$LiteralFromJson(json);

  Map<String, dynamic> toJson() => _$LiteralToJson(this);
}

@JsonSerializable()
class TupleElement {
  late String name;
  late Expression value;

  TupleElement({required this.name, required this.value});

  factory TupleElement.fromJson(Map<String, dynamic> json) =>
      _$TupleElementFromJson(json);

  Map<String, dynamic> toJson() => _$TupleElementToJson(this);
}

@JsonSerializable()
class Tuple extends Expression {
  late List<TupleElement> element;

  Tuple({required this.element});

  factory Tuple.fromJson(Map<String, dynamic> json) => _$TupleFromJson(json);

  Map<String, dynamic> toJson() => _$TupleToJson(this);
}

@JsonSerializable()
class InstanceElement {
  late String name;
  late Expression value;

  InstanceElement({required this.name, required this.value});

  factory InstanceElement.fromJson(Map<String, dynamic> json) =>
      _$InstanceElementFromJson(json);

  Map<String, dynamic> toJson() => _$InstanceElementToJson(this);
}

@JsonSerializable()
class Instance extends Expression {
  late QName classType;
  late List<InstanceElement> element;

  Instance({required this.classType, required this.element});

  factory Instance.fromJson(Map<String, dynamic> json) =>
      _$InstanceFromJson(json);

  Map<String, dynamic> toJson() => _$InstanceToJson(this);
}

@JsonSerializable()
class Interval extends Expression {
  dynamic low;
  Expression? lowClosedExpression;
  dynamic high;
  Expression? highClosedExpression;
  bool lowClosed = true;
  bool highClosed = true;

  Interval({
    this.low,
    this.lowClosedExpression,
    this.high,
    this.highClosedExpression,
    this.lowClosed = true,
    this.highClosed = true,
  });

  factory Interval.fromJson(Map<String, dynamic> json) =>
      _$IntervalFromJson(json);

  Map<String, dynamic> toJson() => _$IntervalToJson(this);
}

@JsonSerializable()
class IntegerInterval extends Interval {
  IntegerInterval({FhirInteger? low, FhirInteger? high})
      : super(low: low, high: high);

  factory IntegerInterval.fromJson(Map<String, dynamic> json) =>
      _$IntegerIntervalFromJson(json);

  Map<String, dynamic> toJson() => _$IntegerIntervalToJson(this);
}

@JsonSerializable()
class DecimalInterval extends Interval {
  DecimalInterval({FhirDecimal? low, FhirDecimal? high});

  factory DecimalInterval.fromJson(Map<String, dynamic> json) =>
      _$DecimalIntervalFromJson(json);

  Map<String, dynamic> toJson() => _$DecimalIntervalToJson(this);
}

@JsonSerializable()
class QuantityInterval extends Interval {
  QuantityInterval({Quantity? low, Quantity? high});

  factory QuantityInterval.fromJson(Map<String, dynamic> json) =>
      _$QuantityIntervalFromJson(json);

  Map<String, dynamic> toJson() => _$QuantityIntervalToJson(this);
}

@JsonSerializable()
class DateInterval extends Interval {
  DateInterval({FhirDate? low, FhirDate? high});

  factory DateInterval.fromJson(Map<String, dynamic> json) =>
      _$DateIntervalFromJson(json);

  Map<String, dynamic> toJson() => _$DateIntervalToJson(this);
}

@JsonSerializable()
class DateTimeInterval extends Interval {
  DateTimeInterval({FhirDateTime? low, FhirDateTime? high});

  factory DateTimeInterval.fromJson(Map<String, dynamic> json) =>
      _$DateTimeIntervalFromJson(json);

  Map<String, dynamic> toJson() => _$DateTimeIntervalToJson(this);
}

@JsonSerializable()
class TimeInterval extends Interval {
  TimeInterval({FhirTime? low, FhirTime? high});

  factory TimeInterval.fromJson(Map<String, dynamic> json) =>
      _$TimeIntervalFromJson(json);

  Map<String, dynamic> toJson() => _$TimeIntervalToJson(this);
}

@JsonSerializable()
class ListSelector extends Expression {
  late TypeSpecifier? typeSpecifier;
  late List<Expression> element;

  ListSelector({this.typeSpecifier, required this.element});

  factory ListSelector.fromJson(Map<String, dynamic> json) =>
      _$ListSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$ListSelectorToJson(this);
}

@JsonSerializable()
class And extends BinaryExpression {
  And({required super.operand});

  factory And.fromJson(Map<String, dynamic> json) => _$AndFromJson(json);

  Map<String, dynamic> toJson() => _$AndToJson(this);
}

@JsonSerializable()
class Or extends BinaryExpression {
  Or({required super.operand});

  factory Or.fromJson(Map<String, dynamic> json) => _$OrFromJson(json);

  Map<String, dynamic> toJson() => _$OrToJson(this);
}

@JsonSerializable()
class Xor extends BinaryExpression {
  Xor({required super.operand});

  factory Xor.fromJson(Map<String, dynamic> json) => _$XorFromJson(json);

  Map<String, dynamic> toJson() => _$XorToJson(this);
}

@JsonSerializable()
class Implies extends BinaryExpression {
  Implies({required super.operand});

  factory Implies.fromJson(Map<String, dynamic> json) =>
      _$ImpliesFromJson(json);

  Map<String, dynamic> toJson() => _$ImpliesToJson(this);
}

@JsonSerializable()
class Not extends UnaryExpression {
  Not({required super.operand});

  factory Not.fromJson(Map<String, dynamic> json) => _$NotFromJson(json);

  Map<String, dynamic> toJson() => _$NotToJson(this);
}

@JsonSerializable()
class If extends Expression {
  late Expression condition;
  late Expression then;
  late Expression elseExpression;

  If(
      {required this.condition,
      required this.then,
      required this.elseExpression});

  factory If.fromJson(Map<String, dynamic> json) => _$IfFromJson(json);

  Map<String, dynamic> toJson() => _$IfToJson(this);
}

@JsonSerializable()
class CaseItem {
  late Expression when;
  late Expression then;

  CaseItem({required this.when, required this.then});

  factory CaseItem.fromJson(Map<String, dynamic> json) =>
      _$CaseItemFromJson(json);

  Map<String, dynamic> toJson() => _$CaseItemToJson(this);
}

@JsonSerializable()
class Case extends Expression {
  late Expression? comparand;
  late List<CaseItem> caseItems;
  late Expression elseExpression;

  Case({this.comparand, required this.caseItems, required this.elseExpression});

  factory Case.fromJson(Map<String, dynamic> json) => _$CaseFromJson(json);

  Map<String, dynamic> toJson() => _$CaseToJson(this);
}

@JsonSerializable()
class Null extends Expression {
  QName? valueType;

  Null({this.valueType});

  factory Null.fromJson(Map<String, dynamic> json) => _$NullFromJson(json);

  Map<String, dynamic> toJson() => _$NullToJson(this);
}

@JsonSerializable()
class IsNull extends UnaryExpression {
  IsNull({required super.operand});

  factory IsNull.fromJson(Map<String, dynamic> json) => _$IsNullFromJson(json);

  Map<String, dynamic> toJson() => _$IsNullToJson(this);
}

@JsonSerializable()
class IsTrue extends UnaryExpression {
  IsTrue({required super.operand});

  factory IsTrue.fromJson(Map<String, dynamic> json) => _$IsTrueFromJson(json);

  Map<String, dynamic> toJson() => _$IsTrueToJson(this);
}

@JsonSerializable()
class IsFalse extends UnaryExpression {
  IsFalse({required super.operand});

  factory IsFalse.fromJson(Map<String, dynamic> json) =>
      _$IsFalseFromJson(json);

  Map<String, dynamic> toJson() => _$IsFalseToJson(this);
}

@JsonSerializable()
class Coalesce extends NaryExpression {
  Coalesce();

  factory Coalesce.fromJson(Map<String, dynamic> json) =>
      _$CoalesceFromJson(json);

  Map<String, dynamic> toJson() => _$CoalesceToJson(this);
}

@JsonSerializable()
class Is extends UnaryExpression {
  TypeSpecifier? isTypeSpecifier;
  QName? isType;

  Is({this.isTypeSpecifier, this.isType, required super.operand});

  factory Is.fromJson(Map<String, dynamic> json) => _$IsFromJson(json);

  Map<String, dynamic> toJson() => _$IsToJson(this);
}

@JsonSerializable()
class As extends UnaryExpression {
  TypeSpecifier? asTypeSpecifier;
  QName? asType;
  bool strict = false;

  As(
      {this.asTypeSpecifier,
      this.asType,
      this.strict = false,
      required super.operand});

  factory As.fromJson(Map<String, dynamic> json) => _$AsFromJson(json);

  Map<String, dynamic> toJson() => _$AsToJson(this);
}

@JsonSerializable()
class Convert extends UnaryExpression {
  TypeSpecifier? toTypeSpecifier;
  QName? toType;

  Convert({this.toTypeSpecifier, this.toType, required super.operand});

  factory Convert.fromJson(Map<String, dynamic> json) =>
      _$ConvertFromJson(json);

  Map<String, dynamic> toJson() => _$ConvertToJson(this);
}

@JsonSerializable()
class CanConvert {
  CanConvert();

  factory CanConvert.fromJson(Map<String, dynamic> json) =>
      _$CanConvertFromJson(json);

  Map<String, dynamic> toJson() => _$CanConvertToJson(this);
}

@JsonSerializable()
class ConvertsToString extends UnaryExpression {
  ConvertsToString({required super.operand});

  factory ConvertsToString.fromJson(Map<String, dynamic> json) =>
      _$ConvertsToStringFromJson(json);

  Map<String, dynamic> toJson() => _$ConvertsToStringToJson(this);
}

@JsonSerializable()
class ToString extends UnaryExpression {
  ToString({required super.operand});

  factory ToString.fromJson(Map<String, dynamic> json) =>
      _$ToStringFromJson(json);

  Map<String, dynamic> toJson() => _$ToStringToJson(this);
}

@JsonSerializable()
class ConvertsToTime extends UnaryExpression {
  ConvertsToTime({required super.operand});

  factory ConvertsToTime.fromJson(Map<String, dynamic> json) =>
      _$ConvertsToTimeFromJson(json);

  Map<String, dynamic> toJson() => _$ConvertsToTimeToJson(this);
}

@JsonSerializable()
class ToTime extends UnaryExpression {
  ToTime({required super.operand});

  factory ToTime.fromJson(Map<String, dynamic> json) => _$ToTimeFromJson(json);

  Map<String, dynamic> toJson() => _$ToTimeToJson(this);
}

@JsonSerializable()
class CanConvertQuantity extends BinaryExpression {
  CanConvertQuantity({required super.operand});

  factory CanConvertQuantity.fromJson(Map<String, dynamic> json) =>
      _$CanConvertQuantityFromJson(json);

  Map<String, dynamic> toJson() => _$CanConvertQuantityToJson(this);
}

@JsonSerializable()
class ConvertQuantity extends BinaryExpression {
  ConvertQuantity({required super.operand});

  factory ConvertQuantity.fromJson(Map<String, dynamic> json) =>
      _$ConvertQuantityFromJson(json);

  Map<String, dynamic> toJson() => _$ConvertQuantityToJson(this);
}

@JsonSerializable()
class Equal extends BinaryExpression {
  Equal({required super.operand});

  factory Equal.fromJson(Map<String, dynamic> json) => _$EqualFromJson(json);

  Map<String, dynamic> toJson() => _$EqualToJson(this);
}

@JsonSerializable()
class Equivalent extends BinaryExpression {
  Equivalent({required super.operand});

  factory Equivalent.fromJson(Map<String, dynamic> json) =>
      _$EquivalentFromJson(json);

  Map<String, dynamic> toJson() => _$EquivalentToJson(this);
}

@JsonSerializable()
class NotEqual extends BinaryExpression {
  NotEqual({required super.operand});

  factory NotEqual.fromJson(Map<String, dynamic> json) =>
      _$NotEqualFromJson(json);

  Map<String, dynamic> toJson() => _$NotEqualToJson(this);
}

@JsonSerializable()
class Less extends BinaryExpression {
  Less({required super.operand});

  factory Less.fromJson(Map<String, dynamic> json) => _$LessFromJson(json);

  Map<String, dynamic> toJson() => _$LessToJson(this);
}

@JsonSerializable()
class Greater extends BinaryExpression {
  Greater({required super.operand});

  factory Greater.fromJson(Map<String, dynamic> json) =>
      _$GreaterFromJson(json);

  Map<String, dynamic> toJson() => _$GreaterToJson(this);
}

@JsonSerializable()
class LessOrEqual extends BinaryExpression {
  LessOrEqual({required super.operand});

  factory LessOrEqual.fromJson(Map<String, dynamic> json) =>
      _$LessOrEqualFromJson(json);

  Map<String, dynamic> toJson() => _$LessOrEqualToJson(this);
}

@JsonSerializable()
class GreaterOrEqual extends BinaryExpression {
  GreaterOrEqual({required super.operand});

  factory GreaterOrEqual.fromJson(Map<String, dynamic> json) =>
      _$GreaterOrEqualFromJson(json);

  Map<String, dynamic> toJson() => _$GreaterOrEqualToJson(this);
}

@JsonSerializable()
class Add extends BinaryExpression {
  Add({required super.operand});

  factory Add.fromJson(Map<String, dynamic> json) => _$AddFromJson(json);

  Map<String, dynamic> toJson() => _$AddToJson(this);
}

@JsonSerializable()
class Subtract extends BinaryExpression {
  Subtract({required super.operand});

  factory Subtract.fromJson(Map<String, dynamic> json) =>
      _$SubtractFromJson(json);

  Map<String, dynamic> toJson() => _$SubtractToJson(this);
}

@JsonSerializable()
class Multiply extends BinaryExpression {
  Multiply({required super.operand});

  factory Multiply.fromJson(Map<String, dynamic> json) =>
      _$MultiplyFromJson(json);

  Map<String, dynamic> toJson() => _$MultiplyToJson(this);
}

@JsonSerializable()
class Divide extends BinaryExpression {
  Divide({required super.operand});

  factory Divide.fromJson(Map<String, dynamic> json) => _$DivideFromJson(json);

  Map<String, dynamic> toJson() => _$DivideToJson(this);
}

@JsonSerializable()
class TruncatedDivide extends BinaryExpression {
  TruncatedDivide({required super.operand});

  factory TruncatedDivide.fromJson(Map<String, dynamic> json) =>
      _$TruncatedDivideFromJson(json);

  Map<String, dynamic> toJson() => _$TruncatedDivideToJson(this);
}

@JsonSerializable()
class Modulo extends BinaryExpression {
  Modulo({required super.operand});

  factory Modulo.fromJson(Map<String, dynamic> json) => _$ModuloFromJson(json);

  Map<String, dynamic> toJson() => _$ModuloToJson(this);
}

@JsonSerializable()
class Ceiling extends UnaryExpression {
  Ceiling({required super.operand});

  factory Ceiling.fromJson(Map<String, dynamic> json) =>
      _$CeilingFromJson(json);

  Map<String, dynamic> toJson() => _$CeilingToJson(this);
}

@JsonSerializable()
class Floor extends UnaryExpression {
  Floor({required super.operand});

  factory Floor.fromJson(Map<String, dynamic> json) => _$FloorFromJson(json);

  Map<String, dynamic> toJson() => _$FloorToJson(this);
}

@JsonSerializable()
class Truncate extends UnaryExpression {
  Truncate({required super.operand});

  factory Truncate.fromJson(Map<String, dynamic> json) =>
      _$TruncateFromJson(json);

  Map<String, dynamic> toJson() => _$TruncateToJson(this);
}

@JsonSerializable()
class Abs extends UnaryExpression {
  Abs({required super.operand});

  factory Abs.fromJson(Map<String, dynamic> json) => _$AbsFromJson(json);

  Map<String, dynamic> toJson() => _$AbsToJson(this);
}

@JsonSerializable()
class Negate extends UnaryExpression {
  Negate({required super.operand});

  factory Negate.fromJson(Map<String, dynamic> json) => _$NegateFromJson(json);

  Map<String, dynamic> toJson() => _$NegateToJson(this);
}

@JsonSerializable()
class Round extends OperatorExpression {
  Expression? operand;
  Expression? precision;

  Round({this.operand, this.precision}) : super();

  factory Round.fromJson(Map<String, dynamic> json) => _$RoundFromJson(json);

  Map<String, dynamic> toJson() => _$RoundToJson(this);
}

@JsonSerializable()
class Ln extends UnaryExpression {
  Ln({required super.operand});

  factory Ln.fromJson(Map<String, dynamic> json) => _$LnFromJson(json);

  Map<String, dynamic> toJson() => _$LnToJson(this);
}

@JsonSerializable()
class Exp extends UnaryExpression {
  Exp({required super.operand});

  factory Exp.fromJson(Map<String, dynamic> json) => _$ExpFromJson(json);

  Map<String, dynamic> toJson() => _$ExpToJson(this);
}

@JsonSerializable()
class Log extends BinaryExpression {
  Log({required super.operand});

  factory Log.fromJson(Map<String, dynamic> json) => _$LogFromJson(json);

  Map<String, dynamic> toJson() => _$LogToJson(this);
}

@JsonSerializable()
class Power extends BinaryExpression {
  Power({required super.operand});

  factory Power.fromJson(Map<String, dynamic> json) => _$PowerFromJson(json);

  Map<String, dynamic> toJson() => _$PowerToJson(this);
}

@JsonSerializable()
class Successor extends UnaryExpression {
  Successor({required super.operand});

  factory Successor.fromJson(Map<String, dynamic> json) =>
      _$SuccessorFromJson(json);

  Map<String, dynamic> toJson() => _$SuccessorToJson(this);
}

@JsonSerializable()
class Predecessor extends UnaryExpression {
  Predecessor({required super.operand});

  factory Predecessor.fromJson(Map<String, dynamic> json) =>
      _$PredecessorFromJson(json);

  Map<String, dynamic> toJson() => _$PredecessorToJson(this);
}

@JsonSerializable()
class MinValue extends Expression {
  String valueType;

  MinValue({required this.valueType});

  factory MinValue.fromJson(Map<String, dynamic> json) =>
      _$MinValueFromJson(json);

  Map<String, dynamic> toJson() => _$MinValueToJson(this);
}

// MaxValue
@JsonSerializable()
class MaxValue extends Expression {
  final QName valueType;

  MaxValue(this.valueType);

  factory MaxValue.fromJson(Map<String, dynamic> json) =>
      _$MaxValueFromJson(json);

  Map<String, dynamic> toJson() => _$MaxValueToJson(this);
}

// Precision
@JsonSerializable()
class Precision extends UnaryExpression {
  Precision({required super.operand});

  factory Precision.fromJson(Map<String, dynamic> json) =>
      _$PrecisionFromJson(json);

  Map<String, dynamic> toJson() => _$PrecisionToJson(this);
}

// LowBoundary
@JsonSerializable()
class LowBoundary extends BinaryExpression {
  LowBoundary({required super.operand});

  factory LowBoundary.fromJson(Map<String, dynamic> json) =>
      _$LowBoundaryFromJson(json);

  Map<String, dynamic> toJson() => _$LowBoundaryToJson(this);
}

// HighBoundary
class HighBoundary extends BinaryExpression {
  HighBoundary({required super.operand});
}

// Concatenate
class Concatenate extends NaryExpression {
  Concatenate();
}

// Combine
class Combine extends OperatorExpression {
  final Expression source;
  final Expression separator;

  Combine(this.source, this.separator);
}

// Split
class Split extends OperatorExpression {
  final Expression stringToSplit;
  final Expression separator;

  Split(this.stringToSplit, this.separator);
}

// SplitOnMatches
class SplitOnMatches extends OperatorExpression {
  final Expression stringToSplit;
  final Expression separatorPattern;

  SplitOnMatches(this.stringToSplit, this.separatorPattern);
}

// Length
class Length extends UnaryExpression {
  Length({required super.operand});
}

// Upper
class Upper extends UnaryExpression {
  Upper({required super.operand});
}

// Lower
class Lower extends UnaryExpression {
  Lower({required super.operand});
}

// Indexer
class Indexer extends BinaryExpression {
  Indexer({required super.operand});
}

// PositionOf
class PositionOf extends OperatorExpression {
  final Expression pattern;
  final Expression string;

  PositionOf(this.pattern, this.string);
}

// LastPositionOf
class LastPositionOf extends OperatorExpression {
  final Expression pattern;
  final Expression string;

  LastPositionOf(this.pattern, this.string);
}

// Substring
class Substring extends OperatorExpression {
  final Expression stringToSub;
  final Expression startIndex;
  final Expression? length;

  Substring(this.stringToSub, this.startIndex, [this.length]);
}

// StartsWith
class StartsWith extends BinaryExpression {
  StartsWith({required super.operand});
}

// EndsWith
class EndsWith extends BinaryExpression {
  EndsWith({required super.operand});
}

class Matches {
  // TODO: Add implementation for Matches
}

class ReplaceMatches {
  // TODO: Add implementation for ReplaceMatches
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

class DurationBetween {
  DurationBetween({required this.precision});
  // TODO: Add implementation for DurationBetween
  DateTimePrecision precision;
}

class DifferenceBetween {
  DifferenceBetween({required this.precision});
  // TODO: Add implementation for DifferenceBetween
  DateTimePrecision precision;
}

class DateFrom {
  // TODO: Add implementation for DateFrom
}

class TimeFrom {
  // TODO: Add implementation for TimeFrom
}

class TimezoneOffsetFrom {
  // TODO: Add implementation for TimezoneOffsetFrom
}

class DateTimeComponentFrom {
  DateTimeComponentFrom({required this.precision});
  // TODO: Add implementation for DateTimeComponentFrom
  DateTimePrecision precision;
}

class TimeOfDay {
  // TODO: Add implementation for TimeOfDay
}

class Today {
  // TODO: Add implementation for Today
}

class Now {
  // TODO: Add implementation for Now
}

class SameAs {
  // TODO: Add implementation for SameAs
  DateTimePrecision? precision;
}

class SameOrBefore {
  // TODO: Add implementation for SameOrBefore
  DateTimePrecision? precision;
}

class SameOrAfter {
  // TODO: Add implementation for SameOrAfter
  DateTimePrecision? precision;
}

class PointFrom extends UnaryExpression {
  PointFrom({required super.operand});

  // The PointFrom expression extracts the single point from the source interval.
  // The source interval must be a unit interval, otherwise, a run-time error is thrown.
  // If the source interval is null, the result is null.
}

class Width extends UnaryExpression {
  Width({required super.operand});
  // The Width operator returns the width of an interval.
  // The result of this operator is equivalent to invoking: End(i) - Start(i)
  // Note: This operator is not defined for intervals of type Date, DateTime, and Time.
  // If the argument is null, the result is null.
}

class Size extends UnaryExpression {
  Size({required super.operand});
  // The Size operator returns the size of an interval.
  // The result of this operator is equivalent to invoking: End(i) - Start(i) + point-size
  // Note: This operator is not defined for intervals of type Date, DateTime, and Time.
  // If the argument is null, the result is null.
}

class Start extends UnaryExpression {
  Start({required super.operand});
  // The Start operator returns the starting point of an interval.
  // If the low boundary of the interval is open, this operator returns the Successor of the low value of the interval.
  // If the low boundary is closed and the low value of the interval is not null, this operator returns the low value of the interval.
  // Otherwise, the result is the minimum value of the point type of the interval.
  // If the argument is null, the result is null.
}

class End extends UnaryExpression {
  End({required super.operand});
  // The End operator returns the ending point of an interval.
  // If the high boundary of the interval is open, this operator returns the Predecessor of the high value of the interval.
  // If the high boundary is closed and the high value of the interval is not null, this operator returns the high value of the interval.
  // Otherwise, the result is the maximum value of the point type of the interval.
  // If the argument is null, the result is null.
}

class Contains extends BinaryExpression {
  Contains({required super.operand});
  // The Contains operator returns true if the first operand contains the second.
  // There are two overloads of this operator: List, T and Interval, T.
  // For List, T overload, this operator returns true if the given element is in the list, using equality semantics.
  // For Interval, T overload, this operator returns true if the given point is within the interval boundaries.
  // If the first argument is null, the result is false. If the second argument is null, the result is null.
}

class ProperContains extends BinaryExpression {
  ProperContains({required super.operand});
  // The ProperContains operator returns true if the first operand properly contains the second.
  // There are two overloads of this operator: List, T and Interval, T.
  // For List, T overload, this operator returns true if the given element is in the list and not the only element in the list, using equality semantics.
  // For Interval, T overload, this operator returns true if the given point is within the interval boundaries.
  // If either argument is null, the result is null.
}

class In extends BinaryExpression {
  In({required super.operand});
  // The In operator tests for membership in an interval or list.
  // There are two overloads of this operator: T, List and T, Interval.
  // For T, List overload, this operator returns true if the given element is in the list, using equality semantics.
  // For T, Interval overload, this operator returns true if the given point is within the interval boundaries.
  // If the first argument is null, the result is null. If the second argument is null, the result is false.
}

class ProperIn extends BinaryExpression {
  ProperIn({required super.operand});
  // The ProperIn operator tests for proper membership in an interval or list.
  // There are two overloads of this operator: T, List and T, Interval.
  // For T, List overload, this operator returns if the given element is in the list and not the only element in the list, using equality semantics.
  // For T, Interval overload, this operator returns true if the given point is within the interval boundaries.
  // If either argument is null, the result is null.
}

class Includes extends BinaryExpression {
  Includes({required super.operand});
  // The Includes operator returns true if the first operand completely includes the second.
  // There are two overloads of this operator: List, List and Interval, Interval.
  // For List, List overload, this operator returns true if the first operand includes every element of the second operand, using equality semantics.
  // For Interval, Interval overload, this operator returns true if the first interval completely includes the second interval.
  // If either argument is null, the result is null.
}

class IncludedIn extends BinaryExpression {
  IncludedIn({required super.operand});
  // The IncludedIn operator returns true if the first operand is completely included in the second.
  // There are two overloads of this operator: List, List and Interval, Interval.
  // For the List, List overload, this operator returns true if every element in the first list is included in the second list, using equality semantics.
  // For the Interval, Interval overload, this operator returns true if the first interval is completely included in the second interval.
  // If either argument is null, the result is null.
}

class ProperIncludes extends BinaryExpression {
  ProperIncludes({required super.operand});
  // The ProperIncludes operator returns true if the first operand includes the second, and is strictly larger.
  // There are two overloads of this operator: List, List and Interval, Interval.
  // For the List, List overload, this operator returns true if the first list includes every element of the second list, using equality semantics, and the first list is strictly larger.
  // For the Interval, Interval overload, this operator returns true if the first interval includes the second interval, and the intervals are not equal.
  // If either argument is null, the result is null.
}

class ProperIncludedIn extends BinaryExpression {
  ProperIncludedIn({required super.operand});
  // The ProperIncludedIn operator returns true if the first operand is included in the second, and is strictly smaller.
  // There are two overloads of this operator: List, List and Interval, Interval.
  // For the List, List overload, this operator returns true if every element of the first list is included in the second list, using equality semantics, and the first list is strictly smaller.
  // For the Interval, Interval overload, this operator returns true if the first interval is included in the second interval, and the intervals are not equal.
  // If either argument is null, the result is null.
}

class Before extends BinaryExpression {
  Before({required super.operand});
  // The Before operator is defined for Intervals, as well as Date, DateTime, and Time values.
  // For the Interval overload, it returns true if the first interval ends before the second one starts.
  // For Date, DateTime, and Time overloads, it compares the values considering precision specified and returns true or false accordingly.
  // If no precision is specified, the comparison is performed beginning with years (or hours for time values) and proceeding to the finest precision specified in either input.
  // If either argument is null, the result is null.
}

class After extends BinaryExpression {
  After({required super.operand});
  // The After operator is defined for Intervals, as well as Date, DateTime, and Time values.
  // For the Interval overload, it returns true if the first interval starts after the second one ends.
  // For Date, DateTime, and Time overloads, it compares the values considering precision specified and returns true or false accordingly.
  // If no precision is specified, the comparison is performed beginning with years (or hours for time values) and proceeding to the finest precision specified in either input.
  // If either argument is null, the result is null.
}

class Meets extends BinaryExpression {
  Meets({required super.operand});
  // The Meets operator returns true if the first interval ends immediately before the second interval starts or vice versa.
  // If either argument is null, the result is null.
}

class MeetsBefore extends BinaryExpression {
  MeetsBefore({required super.operand});
  // The MeetsBefore operator returns true if the first interval ends immediately before the second interval starts.
  // If either argument is null, the result is null.
}

class MeetsAfter extends BinaryExpression {
  MeetsAfter({required super.operand});
  // The MeetsAfter operator returns true if the first interval starts immediately after the second interval ends.
  // If either argument is null, the result is null.
}

class Overlaps extends BinaryExpression {
  Overlaps({required super.operand});
  // The Overlaps operator returns true if the first interval overlaps the second.
  // If either argument is null, the result is null.
}

class OverlapsBefore extends BinaryExpression {
  OverlapsBefore({required super.operand});
  // The OverlapsBefore operator returns true if the first interval starts before and overlaps the second interval.
  // If either argument is null, the result is null.
}

class OverlapsAfter extends BinaryExpression {
  OverlapsAfter({required super.operand});
  // The OverlapsAfter operator returns true if the first interval overlaps and ends after the second.
  // If either argument is null, the result is null.
}

class Starts extends BinaryExpression {
  Starts({required super.operand});
  // The Starts operator returns true if the first interval starts the second.
  // If either argument is null, the result is null.
}

class Ends extends BinaryExpression {
  Ends({required super.operand});
  // The Ends operator returns true if the first interval ends the second.
  // If either argument is null, the result is null.
}

class Collapse extends BinaryExpression {
  Collapse({required super.operand});
  // The Collapse operator returns the unique set of intervals that completely covers the ranges present in the given list of intervals.
  // If the source argument is null, the result is null.
}

class Expand extends BinaryExpression {
  Expand({required super.operand});
  // The Expand operator returns the set of intervals of size per for all the ranges present in the given list of intervals.
  // If the source argument is null, the result is null.
}

class Union extends NaryExpression {
  // The Union operator returns the union of its arguments.
  // If either argument is null, the operation is performed as though the argument was an empty list.
}

class Intersect extends NaryExpression {
  // The Intersect operator returns the intersection of its arguments.
  // If either argument is null, the result is null.
}

class Except extends NaryExpression {
  // The Except operator returns the set difference of the two arguments.
  // If the first argument is null, the result is null. If the second argument is null, the operation is performed as though the second argument was an empty list.
}

class Exists extends UnaryExpression {
  Exists({required super.operand});
  // The Exists operator returns true if the list contains any elements.
  // If the argument is null, the result is false.
}

class Times extends BinaryExpression {
  Times({required super.operand});
  // The Times operator performs the cartesian product of two lists of tuples.
  // If either argument is null, the result is null.
}

class Filter extends Expression {
  // The Filter operator returns a list with only those elements in the source list for which the condition element evaluates to true.
  // If the source argument is null, the result is null.
}

class First extends OperatorExpression {
  // The First operator returns the first element in a list.
  // If the argument is null, the result is null.
}

class Last extends OperatorExpression {
  // The Last operator returns the last element in a list.
  // If the argument is null, the result is null.
}

class Slice extends OperatorExpression {
  // The Slice operator returns a portion of the elements in a list, beginning at the start index and ending just before the ending index.
  // If the source list is null, the result is null.
  // If the startIndex is null, the slice begins at the first element of the list.
  // If the endIndex is null, the slice continues to the last element of the list.
  // If the startIndex or endIndex is less than 0, or if the endIndex is less than the startIndex, the result is an empty list.
}

class IndexOf extends OperatorExpression {
  // The IndexOf operator returns the 0-based index of the given element in the given source list.
  // If the list is empty, or no element is found, the result is -1.
  // If either argument is null, the result is null.
}

class Flatten extends UnaryExpression {
  Flatten({required super.operand});
  // The Flatten operator flattens a list of lists into a single list.
  // If the argument is null, the result is null.
}

class Sort extends Expression {
  // The Sort operator returns a list with all the elements in source, sorted as described by the by element.
  // If the argument is null, the result is null.
}

class ForEach extends Expression {
  // The ForEach expression iterates over the list of elements in the source element, and returns a list with the same number of elements.
  // If the source argument is null, the result is null.
  // If the element argument evaluates to null for some item in the source list, the resulting list will contain a null for that element.
}

class Repeat extends Expression {
  // The Repeat expression performs successive ForEach until no new elements are returned.
  // If the source argument is null, the result is null.
  // If the element argument evaluates to null for some item in the source list, the resulting list will contain a null for that element.
}

class Distinct extends UnaryExpression {
  Distinct({required super.operand});
  // The Distinct operator takes a list of elements and returns a list containing only the unique elements within the input.
  // If the source argument is null, the result is null.
}

class Current extends Expression {
  // The Current expression returns the value of the object currently in scope.
  // It is an error to invoke the Current operator outside of a scoped operation.
}

class Iteration extends Expression {
  // The Iteration expression returns the current iteration number of a scoped operation.
}

class Total extends Expression {
  // The Total expression returns the current value of the total aggregation accumulator in an aggregate operation.
}

class SingletonFrom extends UnaryExpression {
  SingletonFrom({required super.operand});
  // The SingletonFrom expression extracts a single element from the source list.
  // If the source list is empty, the result is null.
  // If the source list contains one element, that element is returned.
  // If the list contains more than one element, a run-time error is thrown.
  // If the source list is null, the result is null.
}

abstract class AggregateExpression extends Expression {
  // Aggregate expressions perform operations on lists of data, either directly on a list of scalars, or indirectly on a list of objects, with a reference to a property present on each object in the list.
  // Aggregate expressions deal with missing information by excluding missing values from consideration before performing the aggregated operation.
  // An aggregate operation performed over an empty list is defined to return null, except as noted in the documentation for each operator (Count, AllTrue, and AnyTrue are the exceptions).
}

class Aggregate extends AggregateExpression {
  // The Aggregate operator performs custom aggregation by evaluating an expression for each element of the source.
  // If a path is specified, the aggregation is performed for value of the property specified by the path for each element of the source.
  // The iteration expression has access to the $this, $index, and $total variables.
  // At the end of each iteration, the value of the $total variable is updated to the result of the iteration expression.
  // The value of the $total variable is initialized to the result of the initialValue expression, if present.
  // If the list is null, the result is null.
}

class Count extends AggregateExpression {
  // The Count operator returns the number of non-null elements in the source.
  // If a path is specified, the count returns the number of elements that have a value for the property specified by the path.
  // If the list is empty, the result is 0.
  // If the list is null, the result is 0.
}

class Sum extends AggregateExpression {
  // The Sum operator returns the sum of non-null elements in the source.
  // If a path is specified, elements with no value for the property specified by the path are ignored.
  // If the source contains no non-null elements, null is returned.
  // If the list is null, the result is null.
}

class Product extends AggregateExpression {
  // The Product operator returns the geometric product of non-null elements in the source.
  // If a path is specified, elements with no value for the property specified by the path are ignored.
  // If the source contains no non-null elements, null is returned.
  // If the list is null, the result is null.
}

class Min extends AggregateExpression {
  // The Min operator returns the minimum element in the source.
  // Comparison semantics are defined by the comparison operators for the type of the values being aggregated.
  // If a path is specified, elements with no value for the property specified by the path are ignored.
  // If the source contains no non-null elements, null is returned.
  // If the source is null, the result is null.
}

class Max extends AggregateExpression {
  // The Max operator returns the maximum element in the source.
  // Comparison semantics are defined by the comparison operators for the type of the values being aggregated.
  // If a path is specified, elements with no value for the property specified by the path are ignored.
  // If the source contains no non-null elements, null is returned.
  // If the source is null, the result is null.
}

class Avg extends AggregateExpression {
  // The Avg operator returns the average of the non-null elements in source.
  // If a path is specified, elements with no value for the property specified by the path are ignored.
  // If the source contains no non-null elements, null is returned.
  // If the source is null, the result is null.
}

class GeometricMean extends AggregateExpression {
  // The GeometricMean operator returns the geometric mean of the non-null elements in source.
  // If a path is specified, elements with no value for the property specified by the path are ignored.
  // If the source contains no non-null elements, null is returned.
  // If the source is null, the result is null.
}

class Median extends AggregateExpression {
  // The Median operator returns the median of the elements in source.
  // If a path is specified, elements with no value for the property specified by the path are ignored.
  // If the source contains no non-null elements, null is returned.
  // If the source is null, the result is null.
}

class Mode extends AggregateExpression {
  // The Mode operator returns the statistical mode of the elements in source.
  // If a path is specified, elements with no value for the property specified by the path are ignored.
  // If the source contains no non-null elements, null is returned.
  // If the source is null, the result is null.
}

class Variance extends AggregateExpression {
  // The Variance operator returns the statistical variance of the elements in source.
  // If a path is specified, elements with no value for the property specified by the path are ignored.
  // If the source contains no non-null elements, null is returned.
  // If the source is null, the result is null.
}

class PopulationVariance extends AggregateExpression {
  // The PopulationVariance operator returns the statistical population variance of the elements in source.
  // If a path is specified, elements with no value for the property specified by the path are ignored.
  // If the source contains no non-null elements, null is returned.
  // If the source is null, the result is null.
}

class StdDev extends AggregateExpression {
  // The StdDev operator returns the statistical standard deviation of the elements in source.
  // If a path is specified, elements with no value for the property specified by the path are ignored.
  // If the source contains no non-null elements, null is returned.
  // If the list is null, the result is null.
}

class PopulationStdDev extends AggregateExpression {
  // The PopulationStdDev operator returns the statistical standard deviation of the elements in source.
  // If a path is specified, elements with no value for the property specified by the path are ignored.
  // If the source contains no non-null elements, null is returned.
  // If the source is null, the result is null.
}

class AllTrue extends AggregateExpression {
  // The AllTrue operator returns true if all the non-null elements in source are true.
  // If a path is specified, elements with no value for the property specified by the path are ignored.
  // If the source contains no non-null elements, true is returned.
  // If the source is null, the result is true.
}

class AnyTrue extends AggregateExpression {
  // The AnyTrue operator returns true if any non-null element in source is true.
  // If a path is specified, elements with no value for the property specified by the path are ignored.
  // If the source contains no non-null elements, false is returned.
  // If the source is null, the result is false.
}

class Property extends Expression {
  // The Property operator returns the value of the property on source specified by the path attribute.
  // If the result of evaluating source is null, the result is null.
  // The path attribute may include qualifiers (.) and indexers ([x]). Indexers must be literal integer values.
  // If the path attribute contains qualifiers or indexers, each qualifier or indexer is traversed to obtain the actual value. If the object of the property access at any point in traversing the path is null, the result is null.
  // If a scope is specified, the name is used to resolve the scope in which the path will be resolved. Scopes can be named by operators such as Filter and ForEach.
  // Property expressions can also be used to access the individual points and closed indicators for interval types using the property names low, high, lowClosed, and highClosed.
}

class AliasedQuerySource {
  AliasedQuerySource({required this.expression, required this.alias});
  // The AliasedQuerySource element defines a single source for inclusion in a query scope.
  // The type of the source is determined by the expression element, and the source can be accessed within the query scope by the given alias.
  Expression expression;
  String alias;
}

class LetClause {
  LetClause({required this.expression, required this.identifier});
  // The LetClause element allows any number of expression definitions to be introduced within a query scope.
  // Defined expressions can be referenced by name within the query scope.
  Expression expression;
  String identifier;
}

abstract class RelationshipClause extends AliasedQuerySource {
  RelationshipClause(
      {required this.suchThat,
      required super.expression,
      required super.alias});
  // The RelationshipClause element allows related sources to be used to restrict the elements included from another source in a query scope.
  // Note that the elements referenced by the relationship clause can only be accessed within the suchThat condition, and that elements of the related source are not included in the query scope.
  Expression suchThat;
}

class With extends RelationshipClause {
  With(
      {required super.suchThat,
      required super.expression,
      required super.alias});
  // The With clause restricts the elements of a given source to only those elements that have elements in the related source that satisfy the suchThat condition.
  // This operation is known as a semi-join in database languages.
}

class Without extends RelationshipClause {
  Without(
      {required super.suchThat,
      required super.expression,
      required super.alias});
  // The Without clause restricts the elements of a given source to only those elements that do not have elements in the related source that satisfy the suchThat condition.
  // This operation is known as a semi-difference in database languages.
}

enum SortDirection { asc, ascending, desc, descending }

abstract class SortByItem {
  SortByItem({required this.direction});
  SortDirection direction;
}

class ByDirection extends SortByItem {
  ByDirection({required super.direction});
  // The ByDirection element specifies that the sort should be performed using the given direction.
  // This approach is used when the result of the query is a list of non-tuple elements and only the sort direction needs to be specified.
}

class ByColumn extends SortByItem {
  // The ByColumn element specifies that the sort should be performed using the given column and direction.
  // This approach is used to specify the sort order for a query when the result is a list of tuples.
  String path;

  ByColumn({required super.direction, required this.path});
}

class ByExpression extends SortByItem {
  // The ByExpression element specifies that the sort should be performed using the given expression and direction.
  // This approach is used to specify the sort order as a calculated expression.
  Expression expression;

  ByExpression({required super.direction, required this.expression});
}

class SortClause {
  SortClause({required this.by});
  // The SortClause element defines the sort order for the query.
  List<SortByItem> by;
}

class ReturnClause {
  ReturnClause({required this.expression, this.distinct = true});
  // The ReturnClause element defines the shape of the result set of the query.
  Expression expression;
  bool distinct = true;
}

class Query extends Expression {
  Query(
      {required this.source,
      required this.let,
      required this.relationship,
      required this.where,
      required this.returnClause,
      required this.sortClause});
  // The Query operator represents a clause-based query.
  // The result of the query is determined by the type of sources included, as well as the clauses used in the query.
  List<AliasedQuerySource> source;
  List<LetClause> let;
  List<RelationshipClause> relationship;
  Expression where;
  ReturnClause? returnClause;
  SortClause? sortClause;
}

class AliasRef extends Expression {
  AliasRef({required this.name});
  // The AliasRef expression allows for the reference of a specific source within the scope of a query.
  String name;
}

class QueryLetRef extends Expression {
  QueryLetRef({required this.name});
  // The QueryLetRef expression allows for the reference of a specific let definition within the scope of a query.
  String name;
}

class Children extends OperatorExpression {
  Children({required this.source});
  // For structured types, the Children operator returns a list of all the values of the elements of the type.
  // List-valued elements are expanded and added to the result individually, rather than as a single list.
  // For list types, the result is the same as invoking Children on each element in the list and flattening the resulting lists into a single result.
  Expression source;
}

class Descendents extends OperatorExpression {
  Descendents({required this.source});
  // For structured types, the Descendents operator returns a list of all the values of the elements of the type, recursively.
  // List-valued elements are expanded and added to the result individually, rather than as a single list.
  // For list types, the result is the same as invoking Descendents on each element in the list and flattening the resulting lists into a single result.
  Expression source;
}

class Message extends OperatorExpression {
  Message(
      {required this.source,
      this.condition,
      this.code,
      this.severity,
      this.message});
  // The Message operator is used to support errors, warnings, messages, and tracing in an ELM evaluation environment.
  // The operator is defined to return the input source.
  // It supports various severities such as Error, Trace, Warning, and Message.
  Expression source;
  Expression? condition;
  Expression? code;
  Expression? severity;
  Expression? message;
}
