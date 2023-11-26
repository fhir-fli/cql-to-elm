import 'package:collection/collection.dart';
import 'package:fhir/r4.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:xml/xml.dart';

import 'elm_modelinfo.dart';

part 'expression.g.dart';

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

class ParameterRef extends Expression {
  String? name;
  String? libraryName;

  ParameterRef({this.name, this.libraryName});
}

class OperandDef {
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

class Literal extends Expression {
  late QName valueType;
  dynamic value;

  Literal({required this.valueType, this.value});

  // Implement methods to parse from XML or JSON if needed
}

class TupleElement {
  late String name;
  late Expression value;

  TupleElement({required this.name, required this.value});

  // Implement methods to parse from XML or JSON if needed
}

class Tuple extends Expression {
  late List<TupleElement> element;

  Tuple({required this.element});

  // Implement methods to parse from XML or JSON if needed
}

class InstanceElement {
  late String name;
  late Expression value;

  InstanceElement({required this.name, required this.value});

  // Implement methods to parse from XML or JSON if needed
}

class Instance extends Expression {
  late QName classType;
  late List<InstanceElement> element;

  Instance({required this.classType, required this.element});

  // Implement methods to parse from XML or JSON if needed
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

class ListSelector extends Expression {
  late TypeSpecifier? typeSpecifier;
  late List<Expression> element;

  ListSelector({this.typeSpecifier, required this.element});

  // Implement methods to parse from XML or JSON if needed
}

class And extends BinaryExpression {
  And({required super.operand});
}

class Or extends BinaryExpression {
  Or({required super.operand});
}

class Xor extends BinaryExpression {
  Xor({required super.operand});
}

class Implies extends BinaryExpression {
  Implies({required super.operand});
}

class Not extends UnaryExpression {
  Not({required super.operand});
}

class If extends Expression {
  late Expression condition;
  late Expression then;
  late Expression elseExpression;

  If(
      {required this.condition,
      required this.then,
      required this.elseExpression});
}

class CaseItem {
  late Expression when;
  late Expression then;

  CaseItem({required this.when, required this.then});
}

class Case extends Expression {
  late Expression? comparand;
  late List<CaseItem> caseItems;
  late Expression elseExpression;

  Case({this.comparand, required this.caseItems, required this.elseExpression});
}

class Null extends Expression {
  QName? valueType;

  Null({this.valueType});
}

class IsNull extends UnaryExpression {
  IsNull({required super.operand});
}

class IsTrue extends UnaryExpression {
  IsTrue({required super.operand});
}

class IsFalse extends UnaryExpression {
  IsFalse({required super.operand});
}

class Coalesce extends NaryExpression {}

class Is extends UnaryExpression {
  TypeSpecifier? isTypeSpecifier;
  QName? isType;

  Is({this.isTypeSpecifier, this.isType, required super.operand});
}

class As extends UnaryExpression {
  TypeSpecifier? asTypeSpecifier;
  QName? asType;
  bool strict = false;

  As(
      {this.asTypeSpecifier,
      this.asType,
      this.strict = false,
      required super.operand});
}

class Convert extends UnaryExpression {
  TypeSpecifier? toTypeSpecifier;
  QName? toType;

  Convert({this.toTypeSpecifier, this.toType, required super.operand});
}

class CanConvert {}

class ConvertsToString extends UnaryExpression {
  ConvertsToString({required super.operand});
}

class ToString extends UnaryExpression {
  ToString({required super.operand});
}

class ConvertsToTime extends UnaryExpression {
  ConvertsToTime({required super.operand});
}

class ToTime extends UnaryExpression {
  ToTime({required super.operand});
}

class CanConvertQuantity extends BinaryExpression {
  CanConvertQuantity({required super.operand});
}

class ConvertQuantity extends BinaryExpression {
  ConvertQuantity({required super.operand});
}

class Equal extends BinaryExpression {
  Equal({required super.operand});
}

class Equivalent extends BinaryExpression {
  Equivalent({required super.operand});
}

class NotEqual extends BinaryExpression {
  NotEqual({required super.operand});
}

class Less extends BinaryExpression {
  Less({required super.operand});
}

class Greater extends BinaryExpression {
  Greater({required super.operand});
}

class LessOrEqual extends BinaryExpression {
  LessOrEqual({required super.operand});
}

class GreaterOrEqual extends BinaryExpression {
  GreaterOrEqual({required super.operand});
}

class Add extends BinaryExpression {
  Add({required super.operand});
  // Add operator specific logic can be added here
}

class Subtract extends BinaryExpression {
  Subtract({required super.operand});
  // Subtract operator specific logic can be added here
}

class Multiply extends BinaryExpression {
  Multiply({required super.operand});
  // Multiply operator specific logic can be added here
}

class Divide extends BinaryExpression {
  Divide({required super.operand});
  // Divide operator specific logic can be added here
}

class TruncatedDivide extends BinaryExpression {
  TruncatedDivide({required super.operand});
  // TruncatedDivide operator specific logic can be added here
}

class Modulo extends BinaryExpression {
  Modulo({required super.operand});
  // Modulo operator specific logic can be added here
}

class Ceiling extends UnaryExpression {
  Ceiling({required super.operand});
  // Ceiling operator specific logic can be added here
}

class Floor extends UnaryExpression {
  Floor({required super.operand});
  // Floor operator specific logic can be added here
}

class Truncate extends UnaryExpression {
  Truncate({required super.operand});
  // Truncate operator specific logic can be added here
}

class Abs extends UnaryExpression {
  Abs({required super.operand});
  // Abs operator specific logic can be added here
}

class Negate extends UnaryExpression {
  Negate({required super.operand});
  // Negate operator specific logic can be added here
}

class Round extends OperatorExpression {
  Round(Expression operand, Expression? precision);
  // Round operator specific logic can be added here
}

class Ln extends UnaryExpression {
  Ln({required super.operand});
  // Ln operator specific logic can be added here
}

class Exp extends UnaryExpression {
  Exp({required super.operand});
  // Exp operator specific logic can be added here
}

class Log extends BinaryExpression {
  Log({required super.operand});
  // Log operator specific logic can be added here
}

class Power extends BinaryExpression {
  Power({required super.operand});
  // Power operator specific logic can be added here
}

class Successor extends UnaryExpression {
  Successor({required super.operand});
  // Successor operator specific logic can be added here
}

class Predecessor extends UnaryExpression {
  Predecessor({required super.operand});
  // Predecessor operator specific logic can be added here
}

class MinValue extends Expression {
  MinValue(String valueType);
  // MinValue operator specific logic can be added here
}

// MaxValue
class MaxValue extends Expression {
  final QName valueType;

  MaxValue(this.valueType);
}

// Precision
class Precision extends UnaryExpression {
  Precision({required super.operand});
}

// LowBoundary
class LowBoundary extends BinaryExpression {
  LowBoundary({required super.operand});
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
