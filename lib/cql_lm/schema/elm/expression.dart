import 'dart:convert';

import 'package:fhir/r4.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../quantity/quantity.dart';
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
class TypeSpecifier extends ElmElement {
  String? localId;
  String? locator;
  String? resultTypeName;
  List<CqlToElmBase>? annotation;
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
class TupleElementDefinition extends ElmElement {
  String name;
  TypeSpecifier? type; // Deprecated, use elementType
  TypeSpecifier? elementType;

  TupleElementDefinition({required this.name});

  factory TupleElementDefinition.fromJson(Map<String, dynamic> json) =>
      _$TupleElementDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$TupleElementDefinitionToJson(this);
}

@JsonSerializable()
class Expression extends ElmElement {
  Expression([this.value]);

  dynamic value;

  factory Expression.fromJson(Map<String, dynamic> json) =>
      _$ExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$ExpressionToJson(this);
}

@JsonSerializable()
class OperatorExpression extends Expression {
  List<TypeSpecifier>? signature;

  OperatorExpression({this.signature});

  factory OperatorExpression.fromJson(Map<String, dynamic> json) =>
      _$OperatorExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$OperatorExpressionToJson(this);
}

@JsonSerializable()
class UnaryExpression extends OperatorExpression {
  Expression? operand;

  UnaryExpression({this.operand});

  factory UnaryExpression.fromJson(Map<String, dynamic> json) =>
      _$UnaryExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$UnaryExpressionToJson(this);
}

@JsonSerializable()
class BinaryExpression extends OperatorExpression {
  List<Expression> operand;

  BinaryExpression({required this.operand});

  factory BinaryExpression.fromJson(Map<String, dynamic> json) =>
      _$BinaryExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$BinaryExpressionToJson(this);
}

@JsonSerializable()
class TernaryExpression extends OperatorExpression {
  List<Expression>? operand;

  TernaryExpression({this.operand});

  factory TernaryExpression.fromJson(Map<String, dynamic> json) =>
      _$TernaryExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$TernaryExpressionToJson(this);
}

@JsonSerializable()
class NaryExpression extends OperatorExpression {
  List<Expression>? operand;

  NaryExpression({this.operand});

  factory NaryExpression.fromJson(Map<String, dynamic> json) =>
      _$NaryExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$NaryExpressionToJson(this);
}

enum AccessModifier { Public, Private }

@JsonSerializable()
class ExpressionDef extends ElmElement {
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
class ParameterDef extends ElmElement {
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

  String? getValueType() => valueType.toString();

  String? getValue() => value.toString();
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
  Object? low;
  Expression? lowClosedExpression;
  Object? high;
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
class ElmList extends Expression {
  late TypeSpecifier? typeSpecifier;
  late List<Expression> element;

  ElmList({this.typeSpecifier, required this.element});

  factory ElmList.fromJson(Map<String, dynamic> json) =>
      _$ElmListFromJson(json);

  Map<String, dynamic> toJson() => _$ElmListToJson(this);
}

// Class representing the And operator
@JsonSerializable()
class And extends BinaryExpression {
  // Add properties if needed
  And({required this.arg1, required this.arg2})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;

  factory And.fromJson(Map<String, dynamic> json) => _$AndFromJson(json);

  Map<String, dynamic> toJson() => _$AndToJson(this);
}

// Class representing the Or operator
@JsonSerializable()
class Or extends BinaryExpression {
  // Add properties if needed
  Or({required this.arg1, required this.arg2})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;

  factory Or.fromJson(Map<String, dynamic> json) => _$OrFromJson(json);

  Map<String, dynamic> toJson() => _$OrToJson(this);
}

// Class representing the Xor operator
@JsonSerializable()
class Xor extends BinaryExpression {
  // Add properties if needed
  Xor({required this.arg1, required this.arg2})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;

  factory Xor.fromJson(Map<String, dynamic> json) => _$XorFromJson(json);

  Map<String, dynamic> toJson() => _$XorToJson(this);
}

// Class representing the Implies operator
@JsonSerializable()
class Implies extends BinaryExpression {
  // Add properties if needed
  Implies({required this.arg1, required this.arg2})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;

  factory Implies.fromJson(Map<String, dynamic> json) =>
      _$ImpliesFromJson(json);

  Map<String, dynamic> toJson() => _$ImpliesToJson(this);
}

// Class representing the Not operator
@JsonSerializable()
class Not extends UnaryExpression {
  // Add properties if needed
  Not({required super.operand});

  factory Not.fromJson(Map<String, dynamic> json) => _$NotFromJson(json);

  Map<String, dynamic> toJson() => _$NotToJson(this);
}

// Class representing the If operator
@JsonSerializable()
class If extends Expression {
  Expression condition;
  Expression then;
  Expression elseClause;

  If(this.condition, this.then, this.elseClause);

  factory If.fromJson(Map<String, dynamic> json) => _$IfFromJson(json);

  Map<String, dynamic> toJson() => _$IfToJson(this);
}

// Class representing a single case item within a Case operator
@JsonSerializable()
class CaseItem implements Element {
  late Expression when;
  late Expression then;

  CaseItem({required this.when, required this.then});

  factory CaseItem.fromJson(Map<String, dynamic> json) =>
      _$CaseItemFromJson(json);

  Map<String, dynamic> toJson() => _$CaseItemToJson(this);

  @override
  $ElementCopyWith<Element> get copyWith => throw UnimplementedError();

  @override
  List<FhirExtension>? get extension_ => toJson()['extension'];

  @override
  String? get fhirId => toJson()['id'];

  @override
  String toJsonString() => jsonEncode(toJson());

  @override
  String toYaml() => json2yaml(toJson());
}

// Class representing the Case operator
@JsonSerializable()
class Case extends Expression {
  Expression? comparand;
  List<CaseItem> caseItems;
  Expression elseClause;

  Case(this.caseItems, this.elseClause, {this.comparand});

  factory Case.fromJson(Map<String, dynamic> json) => _$CaseFromJson(json);

  Map<String, dynamic> toJson() => _$CaseToJson(this);
}

// Class representing the Null operator
@JsonSerializable()
class NullOperator extends Expression {
  String? valueType;

  NullOperator({this.valueType});

  factory NullOperator.fromJson(Map<String, dynamic> json) =>
      _$NullOperatorFromJson(json);

  Map<String, dynamic> toJson() => _$NullOperatorToJson(this);
}

// Class representing the IsNull operator
@JsonSerializable()
class IsNull extends UnaryExpression {
  IsNull({required super.operand});

  factory IsNull.fromJson(Map<String, dynamic> json) => _$IsNullFromJson(json);

  Map<String, dynamic> toJson() => _$IsNullToJson(this);
}

/// Class representing the IsTrue operator.
/// The IsTrue operator determines whether or not its argument evaluates to true.
/// If the argument evaluates to true, the result is true;
/// if the argument evaluates to false or null, the result is false.
@JsonSerializable()
class IsTrue extends UnaryExpression {
  IsTrue({required super.operand});

  factory IsTrue.fromJson(Map<String, dynamic> json) => _$IsTrueFromJson(json);

  Map<String, dynamic> toJson() => _$IsTrueToJson(this);
}

/// Class representing the IsFalse operator.
/// The IsFalse operator determines whether or not its argument evaluates to false.
/// If the argument evaluates to false, the result is true;
/// if the argument evaluates to true or null, the result is false.
@JsonSerializable()
class IsFalse extends UnaryExpression {
  IsFalse({required super.operand});

  factory IsFalse.fromJson(Map<String, dynamic> json) =>
      _$IsFalseFromJson(json);

  Map<String, dynamic> toJson() => _$IsFalseToJson(this);
}

/// Class representing the Coalesce operator.
/// The Coalesce operator returns the first non-null result in a list of arguments.
/// If all arguments evaluate to null, the result is null.
/// The static type of the first argument determines the type of the result,
/// and all subsequent arguments must be of that same type.
@JsonSerializable()
class Coalesce extends NaryExpression {
  Coalesce({required super.operand});

  factory Coalesce.fromJson(Map<String, dynamic> json) =>
      _$CoalesceFromJson(json);

  Map<String, dynamic> toJson() => _$CoalesceToJson(this);
}

/// Class representing the Is operator.
/// The Is operator allows the type of a result to be tested.
/// If the run-time type of the argument is of the type being tested, the result of the operator is true;
/// otherwise, the result is false.
@JsonSerializable()
class Is extends UnaryExpression {
  TypeSpecifier? isTypeSpecifier;
  String? isType;

  Is({
    Expression? operand,
    this.isTypeSpecifier,
    this.isType,
  }) : super(operand: operand);

  factory Is.fromJson(Map<String, dynamic> json) => _$IsFromJson(json);

  Map<String, dynamic> toJson() => _$IsToJson(this);
}

/// Class representing the As operator.
/// The As operator allows the result of an expression to be cast as a given target type.
/// This allows expressions to be written that are statically typed against the expected run-time type of the argument.
/// If the argument is not of the specified type, and the strict attribute is false (the default), the result is null.
/// If the argument is not of the specified type and the strict attribute is true, an exception is thrown.
@JsonSerializable()
class As extends UnaryExpression {
  TypeSpecifier? asTypeSpecifier;
  String? asType;
  bool? strict;

  As({
    Expression? operand,
    this.asTypeSpecifier,
    this.asType,
    this.strict,
  }) : super(operand: operand);

  factory As.fromJson(Map<String, dynamic> json) => _$AsFromJson(json);

  Map<String, dynamic> toJson() => _$AsToJson(this);
}

/// Class representing the Convert operator.
/// The Convert operator converts a value to a specific type.
/// If no valid conversion exists from the actual value to the target type, the result is null.
@JsonSerializable()
class Convert extends UnaryExpression {
  TypeSpecifier? toTypeSpecifier;
  String? toType;

  Convert({
    Expression? operand,
    this.toTypeSpecifier,
    this.toType,
  }) : super(operand: operand);

  factory Convert.fromJson(Map<String, dynamic> json) =>
      _$ConvertFromJson(json);

  Map<String, dynamic> toJson() => _$ConvertToJson(this);
}

/// Class representing the CanConvert operator.
/// The CanConvert operator returns true if the given value can be converted to a specific type, and false otherwise.
@JsonSerializable()
class CanConvert extends UnaryExpression {
  TypeSpecifier? toTypeSpecifier;
  String? toType;

  CanConvert({
    Expression? operand,
    this.toTypeSpecifier,
    this.toType,
  }) : super(operand: operand);

  factory CanConvert.fromJson(Map<String, dynamic> json) =>
      _$CanConvertFromJson(json);

  Map<String, dynamic> toJson() => _$CanConvertToJson(this);
}

@JsonSerializable()
class ToBoolean extends UnaryExpression {
  ToBoolean({required super.operand});

  String? convertThisToBoolean() => convertToBoolean(value);

  static String? convertToBoolean(dynamic value) {
    // Define the logic to convert the value to a Boolean according to the specified rules

    if (value == null) {
      return null;
    } else if (value is String) {
      switch (value.toLowerCase()) {
        case 'true':
        case 't':
        case 'yes':
        case 'y':
        case '1':
          return 'true';
        case 'false':
        case 'f':
        case 'no':
        case 'n':
        case '0':
          return 'false';
        default:
          return null;
      }
    } else if (value is int || value is double) {
      return value == 1 ? 'true' : (value == 0 ? 'false' : null);
    } else {
      return null;
    }
  }

  factory ToBoolean.fromJson(Map<String, dynamic> json) =>
      _$ToBooleanFromJson(json);

  Map<String, dynamic> toJson() => _$ToBooleanToJson(this);
}

@JsonSerializable()
class ConvertsToBoolean extends UnaryExpression {
  ConvertsToBoolean({required super.operand});

  bool checkThisBooleanValue() => checkBooleanValue(value);

  static bool checkBooleanValue(dynamic value) {
    if (value == null) {
      return false;
    } else if (value is String) {
      switch (value.toLowerCase()) {
        case 'true':
        case 't':
        case 'yes':
        case 'y':
        case '1':
          return true;
        case 'false':
        case 'f':
        case 'no':
        case 'n':
        case '0':
          return true;
        default:
          return false;
      }
    } else if (value is int || value is double) {
      return value == 1 || value == 0;
    } else {
      return false;
    }
  }

  factory ConvertsToBoolean.fromJson(Map<String, dynamic> json) =>
      _$ConvertsToBooleanFromJson(json);

  Map<String, dynamic> toJson() => _$ConvertsToBooleanToJson(this);
}

@JsonSerializable()
class ToConcept extends UnaryExpression {
  ToConcept({required super.operand});

  dynamic convertThisToConcept() => convertToConcept(value);

  static dynamic convertToConcept(dynamic value) {
    if (value == null) {
      return null;
    } else if (value is List<String>) {
      return value.map((code) => {'code': code}).toList();
    } else if (value is String) {
      return {'code': value};
    } else {
      return null;
    }
  }

  factory ToConcept.fromJson(Map<String, dynamic> json) =>
      _$ToConceptFromJson(json);

  Map<String, dynamic> toJson() => _$ToConceptToJson(this);
}

@JsonSerializable()
class ConvertsToDate extends UnaryExpression {
  ConvertsToDate({required super.operand});

  bool isThisConvertsToDate() => isConvertsToDate(value);

  static bool isConvertsToDate(dynamic value) {
    if (value == null || value is! String) {
      return false;
    }

    // Date format: YYYY-MM-DD
    final dateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    return dateRegex.hasMatch(value);
  }

  factory ConvertsToDate.fromJson(Map<String, dynamic> json) =>
      _$ConvertsToDateFromJson(json);

  Map<String, dynamic> toJson() => _$ConvertsToDateToJson(this);
}

@JsonSerializable()
class ToDate extends UnaryExpression {
  ToDate({required super.operand});

  DateTime? convertThisToDate() => toDate(value);

  static DateTime? toDate(dynamic value) {
    if (value == null || value is! String) {
      return null;
    }

    // Date format: YYYY-MM-DD
    final dateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!dateRegex.hasMatch(value)) {
      return null;
    }

    try {
      return DateTime.parse(value);
    } catch (e) {
      return null;
    }
  }

  factory ToDate.fromJson(Map<String, dynamic> json) => _$ToDateFromJson(json);

  Map<String, dynamic> toJson() => _$ToDateToJson(this);
}

@JsonSerializable()
class ConvertsToDateTime extends UnaryExpression {
  ConvertsToDateTime({required super.operand});

  bool convertsThisToDateTime() => convertsToDateTime(value);

  static bool convertsToDateTime(dynamic value) {
    if (value == null || value is! String) {
      return false;
    }

    // Date time format: YYYY-MM-DDThh:mm:ss.fff(Z|((+|-)hh:mm))
    final dateTimeRegex = RegExp(
        r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}.\d{3}(Z|(\+|-)\d{2}:\d{2})?$');
    return dateTimeRegex.hasMatch(value);
  }

  factory ConvertsToDateTime.fromJson(Map<String, dynamic> json) =>
      _$ConvertsToDateTimeFromJson(json);

  Map<String, dynamic> toJson() => _$ConvertsToDateTimeToJson(this);
}

@JsonSerializable()
class ToDateTime extends UnaryExpression {
  ToDateTime({required super.operand});

  DateTime? toThisDateTime() => toDateTime(value);

  static DateTime? toDateTime(dynamic value) {
    if (value == null || value is! String) {
      return null;
    }

    final dateTimeRegex = RegExp(
        r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}.\d{3}(Z|(\+|-)\d{2}:\d{2})?$');
    if (!dateTimeRegex.hasMatch(value)) {
      return null;
    }

    try {
      return DateTime.parse(value);
    } catch (e) {
      return null;
    }
  }

  factory ToDateTime.fromJson(Map<String, dynamic> json) =>
      _$ToDateTimeFromJson(json);

  Map<String, dynamic> toJson() => _$ToDateTimeToJson(this);
}

@JsonSerializable()
class ConvertsToDecimal extends UnaryExpression {
  ConvertsToDecimal({required super.operand});

  bool convertsThisToDecimal() => convertsToDecimal(value);

  static bool convertsToDecimal(dynamic value) {
    if (value == null) {
      return false;
    }

    if (value is bool) {
      return true;
    }

    final decimalRegex = RegExp(r'^[+-]?(\d+(\.\d+)?|\.\d+)$');
    return decimalRegex.hasMatch(value.toString());
  }

  factory ConvertsToDecimal.fromJson(Map<String, dynamic> json) =>
      _$ConvertsToDecimalFromJson(json);

  Map<String, dynamic> toJson() => _$ConvertsToDecimalToJson(this);
}

@JsonSerializable()
class ToDecimal extends UnaryExpression {
  ToDecimal({required super.operand});

  num? toThisDecimal() => toDecimal(value);

  static num? toDecimal(dynamic value) {
    if (value == null) {
      return null;
    }

    if (value is bool) {
      return value ? 1.0 : 0.0;
    }

    final decimalRegex = RegExp(r'^[+-]?(\d+(\.\d+)?|\.\d+)$');
    final valueString = value.toString();
    if (!decimalRegex.hasMatch(valueString)) {
      return null;
    }

    return num.tryParse(valueString);
  }

  factory ToDecimal.fromJson(Map<String, dynamic> json) =>
      _$ToDecimalFromJson(json);

  Map<String, dynamic> toJson() => _$ToDecimalToJson(this);
}

@JsonSerializable()
class ConvertsToInteger extends UnaryExpression {
  ConvertsToInteger({required super.operand});

  bool convertsThisToInteger() => convertsToInteger(value);

  static bool convertsToInteger(dynamic value) {
    if (value == null) {
      return false;
    }

    if (value is bool) {
      return true;
    }

    final intRegex = RegExp(r'^[+-]?\d+$');
    final valueString = value.toString();
    if (!intRegex.hasMatch(valueString)) {
      return false;
    }

    try {
      int.parse(valueString);
      return true;
    } catch (_) {
      return false;
    }
  }

  factory ConvertsToInteger.fromJson(Map<String, dynamic> json) =>
      _$ConvertsToIntegerFromJson(json);

  Map<String, dynamic> toJson() => _$ConvertsToIntegerToJson(this);
}

@JsonSerializable()
class ToInteger extends UnaryExpression {
  ToInteger({required super.operand});

  int? toThisInteger() => toInteger(value);

  static int? toInteger(dynamic value) {
    if (value == null) {
      return null;
    } else if (value is bool) {
      return value ? 1 : 0;
    } else if (value is String) {
      String formattedvalue = value.trim();

      if (formattedvalue.isEmpty) {
        return null;
      }

      RegExp integerRegex = RegExp(r'^[+-]?\d+$');

      if (!integerRegex.hasMatch(formattedvalue)) {
        return null; // Not a valid integer format
      }

      try {
        return int.parse(formattedvalue);
      } catch (e) {
        return null; // Parsing error
      }
    } else {
      return null; // Unsupported type
    }
  }

  factory ToInteger.fromJson(Map<String, dynamic> json) =>
      _$ToIntegerFromJson(json);

  Map<String, dynamic> toJson() => _$ToIntegerToJson(this);
}

@JsonSerializable()
class ConvertsToLong extends UnaryExpression {
  ConvertsToLong({required super.operand});

  bool convertsThisToLong() => convertsToLong(value);

  static bool convertsToLong(dynamic value) {
    if (value == null) {
      return false;
    } else if (value is bool) {
      return true;
    } else if (value is String) {
      String formattedvalue = value.trim();

      if (formattedvalue.isEmpty) {
        return false;
      }

      RegExp longRegex = RegExp(r'^[+-]?\d+$');

      if (!longRegex.hasMatch(formattedvalue)) {
        return false; // Not a valid long format
      }

      try {
        // Check if the parsed value fits in the range of a Dart 'int' type
        int parsedValue = int.parse(formattedvalue);
        return parsedValue >= -9223372036854775808 &&
            parsedValue <= 9223372036854775807;
      } catch (e) {
        return false; // Parsing error
      }
    } else {
      return false; // Unsupported type
    }
  }

  factory ConvertsToLong.fromJson(Map<String, dynamic> json) =>
      _$ConvertsToLongFromJson(json);

  Map<String, dynamic> toJson() => _$ConvertsToLongToJson(this);
}

@JsonSerializable()
class ToLong extends UnaryExpression {
  ToLong({required super.operand});

  int? convertThisToLong() => toLong(value);

  static int? toLong(dynamic value) {
    if (value == null) {
      return null;
    } else if (value is String) {
      String formattedvalue = value.trim();

      if (formattedvalue.isEmpty) {
        return null;
      }

      RegExp longRegex = RegExp(r'^[+-]?\d+$');

      if (!longRegex.hasMatch(formattedvalue)) {
        return null; // Not a valid long format
      }

      try {
        // Parsing the value to an integer
        int parsedValue = int.parse(formattedvalue);
        // Checking if the parsed value fits in the range of a Dart 'int' type (corresponds to Long in CQL)
        if (parsedValue >= -9223372036854775808 &&
            parsedValue <= 9223372036854775807) {
          return parsedValue;
        } else {
          return null; // Value out of Long range
        }
      } catch (e) {
        return null; // Parsing error
      }
    } else {
      return null; // Unsupported type
    }
  }

  factory ToLong.fromJson(Map<String, dynamic> json) => _$ToLongFromJson(json);

  Map<String, dynamic> toJson() => _$ToLongToJson(this);
}

@JsonSerializable()
class ConvertsToQuantity extends UnaryExpression {
  ConvertsToQuantity({required super.operand});

  bool convertsThisToQuantity() => convertsToQuantity(value);

  static bool convertsToQuantity(dynamic value) {
    if (value == null) {
      return false;
    } else if (value is int || value is double || value is Ratio) {
      return true;
    } else if (value is String) {
      String formattedvalue = value.trim();

      if (formattedvalue.isEmpty) {
        return false;
      }

      RegExp quantityRegex = RegExp(r"^[+-]?\d+(\.\d+)?(\s+\'[\w\s]+\'\s*)?$");

      if (!quantityRegex.hasMatch(formattedvalue)) {
        return false; // Not a valid quantity format
      }

      // Further validation for quantity value and unit designator (if present)
      List<String> parts = formattedvalue.split(' ');
      String quantityValue = parts[0];

      try {
        // Check if the parsed value is a valid decimal
        double parsedValue = double.parse(quantityValue);
        if (parsedValue.isNaN || parsedValue.isInfinite) {
          return false; // NaN or Infinite value is not valid
        }
      } catch (e) {
        return false; // Parsing error
      }

      // Check if the quantity format contains the unit designator
      if (parts.length > 1) {
        String unitDesignator = parts[1];
        // Implement validation for the unit designator (if needed)
        // This is a placeholder for checking the unit designator's validity
      }

      return true; // Valid quantity format
    } else {
      return false; // Unsupported type
    }
  }

  factory ConvertsToQuantity.fromJson(Map<String, dynamic> json) =>
      _$ConvertsToQuantityFromJson(json);

  Map<String, dynamic> toJson() => _$ConvertsToQuantityToJson(this);
}

@JsonSerializable()
class ToQuantity extends UnaryExpression {
  ToQuantity({required super.operand});

  ElmQuantity? toThisQuantity() => toQuantity(value);

  static ElmQuantity? toQuantity(dynamic value) {
    if (value == null) {
      return null;
    }

    if (value is int || value is double || value is num) {
      return ElmQuantity(value: FhirDecimal(value.toDouble()));
    }

    if (value is String) {
      String formattedvalue = value.trim();

      if (formattedvalue.isEmpty) {
        return null;
      }

      RegExp quantityRegex = RegExp(r'^([+-]?\d+(\.\d+)?)(\s*[a-zA-Z]+)?$');

      if (!quantityRegex.hasMatch(formattedvalue)) {
        return null; // Not a valid quantity format
      }

      try {
        List<String> parts = formattedvalue.split(' ');
        double parsedValue = double.parse(parts[0]);

        String unit = '1';
        if (parts.length > 1) {
          unit = parts.sublist(1).join(' ').trim();
        }

        return ElmQuantity(value: FhirDecimal(parsedValue), unit: unit);
      } catch (e) {
        return null; // Parsing error
      }
    }

    if (value is List && value.length == 2 && value.every((e) => e is num)) {
      double numerator = value[0].toDouble();
      double denominator = value[1].toDouble();
      if (denominator == 0) {
        return null; // Division by zero
      }
      return ElmQuantity(value: FhirDecimal(numerator / denominator));
    }

    return null; // Other types are not supported
  }

  factory ToQuantity.fromJson(Map<String, dynamic> json) =>
      _$ToQuantityFromJson(json);

  Map<String, dynamic> toJson() => _$ToQuantityToJson(this);
}

@JsonSerializable()
class ConvertsToRatio extends UnaryExpression {
  ConvertsToRatio({required super.operand});

  bool convertsThisToRatio() => convertsToRatio(value);

  static bool convertsToRatio(dynamic value) {
    if (value == null) {
      return false;
    }

    if (value is String) {
      String formattedvalue = value.trim();

      if (formattedvalue.isEmpty) {
        return false;
      }

      RegExp ratioRegex = RegExp(
          r'^\s*([+-]?\d+(\.\d+)?(\s*[a-zA-Z]+)?)\s*:\s*([+-]?\d+(\.\d+)?(\s*[a-zA-Z]+)?)\s*$');

      if (!ratioRegex.hasMatch(formattedvalue)) {
        return false; // Not a valid ratio format
      }

      List<String> parts = formattedvalue.split(':');
      ElmQuantity? firstQuantity = ToQuantity.toQuantity(parts[0].trim());
      ElmQuantity? secondQuantity = ToQuantity.toQuantity(parts[1].trim());

      return secondQuantity != null;
    }

    return false; // Unsupported type
  }

  factory ConvertsToRatio.fromJson(Map<String, dynamic> json) =>
      _$ConvertsToRatioFromJson(json);

  Map<String, dynamic> toJson() => _$ConvertsToRatioToJson(this);
}

@JsonSerializable()
class ToRatio extends UnaryExpression {
  ToRatio({required super.operand});

  List<Quantity>? toThisRatio() => toRatio(value);

  static List<Quantity>? toRatio(dynamic value) {
    if (value == null) {
      return null;
    }

    if (value is String) {
      String formattedvalue = value.trim();

      if (formattedvalue.isEmpty) {
        return null;
      }

      RegExp ratioRegex = RegExp(
          r'^\s*([+-]?\d+(\.\d+)?(\s*[a-zA-Z]+)?)\s*:\s*([+-]?\d+(\.\d+)?(\s*[a-zA-Z]+)?)\s*$');

      if (!ratioRegex.hasMatch(formattedvalue)) {
        return null; // Not a valid ratio format
      }

      List<String> parts = formattedvalue.split(':');
      ElmQuantity? firstQuantity = ToQuantity.toQuantity(parts[0].trim());
      ElmQuantity? secondQuantity = ToQuantity.toQuantity(parts[1].trim());

      return firstQuantity == null
          ? secondQuantity == null
              ? null
              : [secondQuantity]
          : secondQuantity == null
              ? [firstQuantity]
              : [firstQuantity, secondQuantity];
    }

    return null; // Unsupported type or invalid value
  }

  factory ToRatio.fromJson(Map<String, dynamic> json) =>
      _$ToRatioFromJson(json);

  Map<String, dynamic> toJson() => _$ToRatioToJson(this);
}

@JsonSerializable()
class ToList extends UnaryExpression {
  ToList({required super.operand});

  List<dynamic> toThisList() => toList(value);

  static List<dynamic> toList(dynamic operand) {
    if (operand == null) {
      return [];
    } else {
      return [operand];
    }
  }

  factory ToList.fromJson(Map<String, dynamic> json) => _$ToListFromJson(json);

  Map<String, dynamic> toJson() => _$ToListToJson(this);
}

@JsonSerializable()
class ToChars extends UnaryExpression {
  ToChars({required super.operand});

  List<String>? toThisChars() => toChars(value);

  static List<String>? toChars(dynamic value) {
    if (value == null || value is! String) {
      return null;
    } else {
      return value.split('');
    }
  }

  factory ToChars.fromJson(Map<String, dynamic> json) =>
      _$ToCharsFromJson(json);

  Map<String, dynamic> toJson() => _$ToCharsToJson(this);
}

@JsonSerializable()
class ConvertsToString extends UnaryExpression {
  ConvertsToString({required super.operand});

  bool convertThisToString() => convertsToString(value);

  static bool convertsToString(dynamic argument) {
    if (argument == null) {
      return false;
    } else {
      return argument is bool ||
          argument is int ||
          argument is double ||
          argument is DateTime ||
          argument is String ||
          argument is ElmQuantity ||
          argument is Ratio;
    }
  }

  factory ConvertsToString.fromJson(Map<String, dynamic> json) =>
      _$ConvertsToStringFromJson(json);

  Map<String, dynamic> toJson() => _$ConvertsToStringToJson(this);
}

@JsonSerializable()
class ToString extends UnaryExpression {
  ToString({required super.operand});

  String? toThisString() => toElmString(value);

  static String? toElmString(dynamic value) {
    if (value == null) {
      return null;
    } else if (value is bool) {
      return value.toString();
    } else if (value is int || value is double) {
      return value.toString();
    } else if (value is DateTime) {
      return value.toIso8601String();
    } else if (value is String) {
      return value;
    } else if (value is ElmQuantity) {
      return '${value.value}${value.unit != null ? ' ${value.unit}' : ''}';
    } else if (value is Ratio) {
      return '${ToString.toElmString(value.numerator)}:${ToString.toElmString(value.denominator)}';
    } else {
      return null; // Unsupported type
    }
  }

  factory ToString.fromJson(Map<String, dynamic> json) =>
      _$ToStringFromJson(json);

  Map<String, dynamic> toJson() => _$ToStringToJson(this);
}

@JsonSerializable()
class ConvertsToTime extends UnaryExpression {
  ConvertsToTime({required super.operand});

  bool convertThisToTime() => convertsToTime(value);

  static bool convertsToTime(dynamic value) {
    if (value == null) {
      return false;
    } else if (value is String) {
      RegExp timeRegex = RegExp(
          r'^([01]\d|2[0-3]):([0-5]\d):([0-5]\d)(\.\d+)?$'); // Validates ISO-8601 time representation

      if (timeRegex.hasMatch(value)) {
        // Additional validation for a valid time-of-day value
        List<String> parts = value.split(':');
        int hours = int.parse(parts[0]);
        int minutes = int.parse(parts[1]);
        int seconds = int.parse(parts[2].split('.')[0]);

        if (hours >= 0 &&
            hours < 24 &&
            minutes >= 0 &&
            minutes < 60 &&
            seconds >= 0 &&
            seconds < 60) {
          return true;
        }
      }
      return false;
    } else {
      return false; // Unsupported type
    }
  }

  factory ConvertsToTime.fromJson(Map<String, dynamic> json) =>
      _$ConvertsToTimeFromJson(json);

  Map<String, dynamic> toJson() => _$ConvertsToTimeToJson(this);
}

@JsonSerializable()
class ToTime extends UnaryExpression {
  ToTime({required super.operand});

  DateTime? toThisTime() => toTime(value);

  static DateTime? toTime(dynamic value) {
    if (value == null) {
      return null;
    } else if (value is String) {
      RegExp timeRegex = RegExp(
          r'^([01]\d|2[0-3]):([0-5]\d):([0-5]\d)(\.\d+)?$'); // Validates ISO-8601 time representation

      if (timeRegex.hasMatch(value)) {
        // Additional validation for a valid time-of-day value
        List<String> parts = value.split(':');
        int hours = int.parse(parts[0]);
        int minutes = int.parse(parts[1]);
        int seconds = int.parse(parts[2].split('.')[0]);

        if (hours >= 0 &&
            hours < 24 &&
            minutes >= 0 &&
            minutes < 60 &&
            seconds >= 0 &&
            seconds < 60) {
          return DateTime.parse('1970-01-01 $value');
        }
      }
      return null; // Invalid time format or value
    } else if (value is DateTime) {
      return DateTime(1970, 1, 1, value.hour, value.minute, value.second,
          value.millisecond);
    } else {
      return null; // Unsupported type
    }
  }

  factory ToTime.fromJson(Map<String, dynamic> json) => _$ToTimeFromJson(json);

  Map<String, dynamic> toJson() => _$ToTimeToJson(this);
}

@JsonSerializable()
class CanConvertQuantity extends BinaryExpression {
  CanConvertQuantity({required this.arg1, required this.arg2, this.targetUnit})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;
  final String? targetUnit;

  bool canThisConvertQuantity() => canConvertQuantity(value, targetUnit);

  static bool canConvertQuantity(ElmQuantity quantity, [String? targetUnit]) {
    if (targetUnit == null) {
      return false;
    }
    // Implement conversion logic based on UCUM (Unified Code for Units of Measure)
    // Add your conversion logic here or integrate any external libraries for unit conversion

    // Placeholder logic assuming simple quantity conversion
    if (quantity.unit == targetUnit) {
      return true; // Quantity can be converted to the target unit
    } else {
      return false; // Quantity cannot be converted to the target unit
    }
  }

  factory CanConvertQuantity.fromJson(Map<String, dynamic> json) =>
      _$CanConvertQuantityFromJson(json);

  Map<String, dynamic> toJson() => _$CanConvertQuantityToJson(this);
}

@JsonSerializable()
class ConvertQuantity extends BinaryExpression {
  ConvertQuantity({required this.arg1, required this.arg2, this.targetUnit})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;
  final String? targetUnit;

  ElmQuantity? convertThisQuantity() => convertQuantity(value, targetUnit);

  static ElmQuantity? convertQuantity(dynamic valueQuantity,
      [String? targetUnit]) {
    if (targetUnit == null) {
      return null;
    }

    // Placeholder logic assuming simple quantity conversion
    // Replace this with proper UCUM-compliant unit conversion logic
    if (valueQuantity is ElmQuantity && valueQuantity.unit == targetUnit) {
      return ElmQuantity(
          value: valueQuantity.value,
          unit: targetUnit); // Quantity with the same unit
    } else {
      // Implement proper unit conversion logic here based on UCUM
      // If conversion is not supported, handle appropriately (return null or throw an error)
      // Example: throw UnimplementedError('Unit conversion not supported');
      // Actual conversion logic would depend on the specific unit conversion rules
      // ...
      return null; // Placeholder for unsupported unit conversion
    }
  }

  // factory ConvertQuantity.fromJson(Map<String, dynamic> json) =>
  //     _$ConvertQuantityFromJson(json);

  // Map<String, dynamic> toJson() => _$ConvertQuantityToJson(this);
}

// TODO(Dokotela): sleepy, start here
@JsonSerializable()
class Equal extends BinaryExpression {
  Equal({required this.arg1, required this.arg2, this.targetUnit})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;
  final String? targetUnit;

  bool equalThis() => equals(value, targetUnit);

  static bool equals(dynamic arg1, dynamic arg2) {
    if (arg1 == null || arg2 == null) {
      return false;
    } else if (arg1 is int ||
        arg1 is double ||
        arg1 is String ||
        arg1 is bool) {
      return arg1 == arg2;
    } else if (arg1 is ElmQuantity && arg2 is ElmQuantity) {
      // Check if dimensions are the same
      // Note: This is a placeholder; actual quantity comparison might involve more complex logic
      return arg1.value == arg2.value;
    } else if (arg1 is Ratio && arg2 is Ratio) {
      // Check if numerator and denominator quantities are equal
      // This is a placeholder; actual ratio comparison might involve more complex logic
      return arg1.numerator == arg2.numerator &&
          arg1.denominator == arg2.denominator;
    } else if (arg1 is List && arg2 is List) {
      // Check list equality
      if (arg1.length != arg2.length) {
        return false;
      }
      for (int i = 0; i < arg1.length; i++) {
        if (!equals(arg1[i], arg2[i])) {
          return false;
        }
      }
      return true;
    } else if (arg1 is Map && arg2 is Map) {
      // Check map equality
      if (arg1.length != arg2.length) {
        return false;
      }
      for (var key in arg1.keys) {
        if (!arg2.containsKey(key) || !equals(arg1[key], arg2[key])) {
          return false;
        }
      }
      return true;
    } else if (arg1 is DateTime && arg2 is DateTime) {
      // Compare DateTime values
      // This is a placeholder; actual comparison involves comparing each precision
      return arg1 == arg2;
    } else {
      return false; // Unsupported type for comparison
    }
  }

  factory Equal.fromJson(Map<String, dynamic> json) => _$EqualFromJson(json);

  Map<String, dynamic> toJson() => _$EqualToJson(this);
}

@JsonSerializable()
class Equivalent extends BinaryExpression {
  Equivalent({required super.operand});

  static bool equivalent(dynamic arg1, dynamic arg2) {
    if (arg1 == null && arg2 == null) {
      return true;
    } else if (arg1 == null || arg2 == null) {
      return false;
    } else if (arg1 is int ||
        arg1 is double ||
        arg1 is String ||
        arg1 is bool) {
      return arg1 == arg2;
    } else if (arg1 is String && arg2 is String) {
      // Compare strings while ignoring case and normalizing whitespace
      return arg1.trim().toLowerCase() == arg2.trim().toLowerCase();
    } else if (arg1 is ElmQuantity && arg2 is ElmQuantity) {
      // Check if quantities are equivalent
      // This is a placeholder; actual quantity comparison might involve unit conversion and value comparison
      return false; // Implement logic for quantity equivalence here
    } else if (arg1 is Ratio && arg2 is Ratio) {
      // Check if ratios are equivalent
      // This is a placeholder; actual ratio comparison might involve more complex logic
      return arg1.numerator == arg2.numerator &&
          arg1.denominator == arg2.denominator;
    } else if (arg1 is List && arg2 is List) {
      // Check list equivalence
      if (arg1.length != arg2.length) {
        return false;
      }
      for (int i = 0; i < arg1.length; i++) {
        if (!equivalent(arg1[i], arg2[i])) {
          return false;
        }
      }
      return true;
    } else if (arg1 is Map && arg2 is Map) {
      // Check map equivalence
      if (arg1.length != arg2.length) {
        return false;
      }
      for (var key in arg1.keys) {
        if (!arg2.containsKey(key) || !equivalent(arg1[key], arg2[key])) {
          return false;
        }
      }
      return true;
    } else if (arg1 is DateTime && arg2 is DateTime) {
      // Compare DateTime values
      // This is a placeholder; actual comparison involves comparing each precision
      return arg1 == arg2;
    } else {
      return false; // Unsupported type for equivalence comparison
    }
  }

  factory Equivalent.fromJson(Map<String, dynamic> json) =>
      _$EquivalentFromJson(json);

  Map<String, dynamic> toJson() => _$EquivalentToJson(this);
}

@JsonSerializable()
class NotEqual extends BinaryExpression {
  NotEqual({required super.operand});

  static bool notEqual(dynamic arg1, dynamic arg2) {
    return !(Equal.equals(arg1, arg2));
  }

  factory NotEqual.fromJson(Map<String, dynamic> json) =>
      _$NotEqualFromJson(json);

  Map<String, dynamic> toJson() => _$NotEqualToJson(this);
}

@JsonSerializable()
class Less extends BinaryExpression {
  Less({required super.operand});

  static bool less(dynamic arg1, dynamic arg2) {
    if (arg1 == null || arg2 == null) {
      return false;
    } else if (arg1 is int || arg1 is double || arg1 is String) {
      // For simple types like int, double, and string
      if (arg1 is String && arg2 is String) {
        return arg1.compareTo(arg2) < 0;
      } else {
        return arg1 < arg2;
      }
    } else if (arg1 is DateTime && arg2 is DateTime) {
      // Comparison for DateTime values
      // This is a placeholder; actual comparison involves comparing each precision
      return arg1.isBefore(arg2);
    } else if (arg1 is ElmQuantity && arg2 is ElmQuantity) {
      // Comparison for quantities
      // This is a placeholder; actual comparison might involve unit conversion and value comparison
      return false; // Implement logic for quantity comparison here
    } else {
      return false; // Unsupported type for less comparison
    }
  }

  factory Less.fromJson(Map<String, dynamic> json) => _$LessFromJson(json);

  Map<String, dynamic> toJson() => _$LessToJson(this);
}

@JsonSerializable()
class Greater extends BinaryExpression {
  Greater({required super.operand});

  static bool greater(dynamic arg1, dynamic arg2) {
    if (arg1 == null || arg2 == null) {
      return false;
    } else if (arg1 is int || arg1 is double || arg1 is String) {
      // For simple types like int, double, and string
      if (arg1 is String && arg2 is String) {
        return arg1.compareTo(arg2) > 0;
      } else {
        return arg1 > arg2;
      }
    } else if (arg1 is DateTime && arg2 is DateTime) {
      // Comparison for DateTime values
      // This is a placeholder; actual comparison involves comparing each precision
      return arg1.isAfter(arg2);
    } else if (arg1 is ElmQuantity && arg2 is ElmQuantity) {
      // Comparison for quantities
      // This is a placeholder; actual comparison might involve unit conversion and value comparison
      return false; // Implement logic for quantity comparison here
    } else {
      return false; // Unsupported type for greater comparison
    }
  }

  factory Greater.fromJson(Map<String, dynamic> json) =>
      _$GreaterFromJson(json);

  Map<String, dynamic> toJson() => _$GreaterToJson(this);
}

@JsonSerializable()
class LessOrEqual extends BinaryExpression {
  LessOrEqual({required super.operand});

  static bool lessOrEqual(dynamic arg1, dynamic arg2) {
    if (arg1 == null || arg2 == null) {
      return false;
    } else if (arg1 is int || arg1 is double || arg1 is String) {
      // For simple types like int, double, and string
      if (arg1 is String && arg2 is String) {
        return arg1.compareTo(arg2) <= 0;
      } else {
        return arg1 <= arg2;
      }
    } else if (arg1 is DateTime && arg2 is DateTime) {
      // Comparison for DateTime values
      // This is a placeholder; actual comparison involves comparing each precision
      return FhirDateTime(arg1) == FhirDateTime(arg2);
    } else if (arg1 is ElmQuantity && arg2 is ElmQuantity) {
      // Comparison for quantities
      // This is a placeholder; actual comparison might involve unit conversion and value comparison
      return false; // Implement logic for quantity comparison here
    } else {
      return false; // Unsupported type for less or equal comparison
    }
  }

  factory LessOrEqual.fromJson(Map<String, dynamic> json) =>
      _$LessOrEqualFromJson(json);

  Map<String, dynamic> toJson() => _$LessOrEqualToJson(this);
}

/// The GreaterOrEqual operator returns true if the first argument is greater
/// than or equal to the second argument. (rest of the documentation)
@JsonSerializable()
class GreaterOrEqual extends BinaryExpression {
  GreaterOrEqual({required super.operand, required this.binaryExpression});
  BinaryExpression
      binaryExpression; // Assuming BinaryExpression is a defined class

  factory GreaterOrEqual.fromJson(Map<String, dynamic> json) =>
      _$GreaterOrEqualFromJson(json);

  Map<String, dynamic> toJson() => _$GreaterOrEqualToJson(this);
}

@JsonSerializable()
class Add extends BinaryExpression {
  BinaryExpression
      binaryExpression; // Assuming BinaryExpression is a defined class

  Add({required super.operand, required this.binaryExpression});

  factory Add.fromJson(Map<String, dynamic> json) => _$AddFromJson(json);

  Map<String, dynamic> toJson() => _$AddToJson(this);
}

@JsonSerializable()
class Subtract extends BinaryExpression {
  Subtract({required this.arg1, required this.arg2})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;
  factory Subtract.fromJson(Map<String, dynamic> json) =>
      _$SubtractFromJson(json);

  Map<String, dynamic> toJson() => _$SubtractToJson(this);
}

/// The Multiply operator performs numeric multiplication of its arguments.
/// For multiplication operations involving quantities, the resulting quantity
/// will have the appropriate unit.
/// If either argument is null, the result is null.
/// If the result of the operation cannot be represented, the result is null.
/// The Multiply operator is defined for the Integer, Long, Decimal, and Quantity types.
@JsonSerializable()
class Multiply extends BinaryExpression {
  Multiply({required this.arg1, required this.arg2})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;
  factory Multiply.fromJson(Map<String, dynamic> json) =>
      _$MultiplyFromJson(json);

  Map<String, dynamic> toJson() => _$MultiplyToJson(this);
}

/// The Divide operator performs numeric division of its arguments.
/// Note that the result type of Divide is Decimal, even if its arguments are
/// of type Integer. For integer division, use the truncated divide operator.
/// For division operations involving quantities, the resulting quantity will
/// have the appropriate unit.
/// If either argument is null, the result is null.
/// If the result of the division cannot be represented, or the right argument
/// is 0, the result is null.
/// The Divide operator is defined for the Decimal and Quantity types.
@JsonSerializable()
class Divide extends BinaryExpression {
  Divide({required this.arg1, required this.arg2})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;
  factory Divide.fromJson(Map<String, dynamic> json) => _$DivideFromJson(json);

  Map<String, dynamic> toJson() => _$DivideToJson(this);
}

///  The TruncatedDivide operator performs integer division of its arguments.
/// If either argument is null, the result is null.
/// If the result of the operation cannot be represented, or the right argument
/// is 0, the result is null.
/// The TruncatedDivide operator is defined for the Integer, Long, Decimal, and
/// Quantity types.
/// For TruncatedDivide operations involving quantities, the resulting quantity
/// will have the appropriate unit.
@JsonSerializable()
class TruncatedDivide extends BinaryExpression {
  TruncatedDivide({required this.arg1, required this.arg2})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;

  factory TruncatedDivide.fromJson(Map<String, dynamic> json) =>
      _$TruncatedDivideFromJson(json);

  Map<String, dynamic> toJson() => _$TruncatedDivideToJson(this);
}

/// The Modulo operator computes the remainder of the division of its arguments.
/// If either argument is null, the result is null.
/// If the result of the modulo cannot be represented, or the right argument is
/// 0, the result is null.
/// The Modulo operator is defined for the Integer, Long, Decimal, and Quantity
/// types.
/// For Modulo operations involving quantities, the resulting quantity will have
/// the appropriate unit.
@JsonSerializable()
class Modulo extends BinaryExpression {
  Modulo({required this.arg1, required this.arg2})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;

  factory Modulo.fromJson(Map<String, dynamic> json) => _$ModuloFromJson(json);

  Map<String, dynamic> toJson() => _$ModuloToJson(this);
}

/// The Ceiling operator returns the first integer greater than or equal to the argument.
/// If the argument is null, the result is null.
@JsonSerializable()
class Ceiling extends UnaryExpression {
  UnaryExpression
      unaryExpression; // Assuming UnaryExpression is a defined class

  Ceiling(this.unaryExpression);

  factory Ceiling.fromJson(Map<String, dynamic> json) =>
      _$CeilingFromJson(json);

  Map<String, dynamic> toJson() => _$CeilingToJson(this);
}

/// The Floor operator returns the first integer less than or equal to the argument.
/// If the argument is null, the result is null.
@JsonSerializable()
class Floor extends UnaryExpression {
  UnaryExpression
      unaryExpression; // Assuming UnaryExpression is a defined class

  Floor(this.unaryExpression);

  factory Floor.fromJson(Map<String, dynamic> json) => _$FloorFromJson(json);

  Map<String, dynamic> toJson() => _$FloorToJson(this);
}

/// The Truncate operator returns the integer component of its argument.
/// If the argument is null, the result is null.
@JsonSerializable()
class Truncate extends UnaryExpression {
  UnaryExpression
      unaryExpression; // Assuming UnaryExpression is a defined class

  Truncate(this.unaryExpression);

  factory Truncate.fromJson(Map<String, dynamic> json) =>
      _$TruncateFromJson(json);

  Map<String, dynamic> toJson() => _$TruncateToJson(this);
}

/// The Abs operator returns the absolute value of its argument
/// When taking the absolute value of a quantity, the unit is unchanged.
/// If the argument is null, the result is null.
/// If the result of taking the absolute value of the argument cannot be
/// represented (e.g. Abs(minimum Integer)), the result is null.
/// The Abs operator is defined for the Integer, Long, Decimal, and Quantity types.
@JsonSerializable()
class Abs extends UnaryExpression {
  UnaryExpression
      unaryExpression; // Assuming UnaryExpression is a defined class

  Abs(this.unaryExpression);

  factory Abs.fromJson(Map<String, dynamic> json) => _$AbsFromJson(json);

  Map<String, dynamic> toJson() => _$AbsToJson(this);
}

/// The Negate operator returns the negative of its argument.
/// When negating quantities, the unit is unchanged.
/// If the argument is null, the result is null.
/// If the result of negating the argument cannot be represented
/// (e.g. -(minimum Integer)), the result is null.
/// The Negate operator is defined for the Integer, Long, Decimal, and Quantity types.
@JsonSerializable()
class Negate extends UnaryExpression {
  UnaryExpression
      unaryExpression; // Assuming UnaryExpression is a defined class

  Negate(this.unaryExpression);

  factory Negate.fromJson(Map<String, dynamic> json) => _$NegateFromJson(json);

  Map<String, dynamic> toJson() => _$NegateToJson(this);
}

/// The Round operator returns the nearest integer to its argument.
/// The semantics of round are defined as a traditional round, meaning that a
/// decimal value of 0.5 or higher will round to 1.
/// If the argument is null, the result is null.
/// Precision determines the decimal place at which the rounding will occur. If
/// precision is not specified or null, 0 is assumed.
@JsonSerializable()
class Round extends OperatorExpression {
  Expression operand;
  Expression? precision;

  Round({required this.operand, this.precision});

  factory Round.fromJson(Map<String, dynamic> json) => _$RoundFromJson(json);

  Map<String, dynamic> toJson() => _$RoundToJson(this);
}

/// The Ln operator computes the natural logarithm of its argument.
/// If the argument is null, the result is null.
/// If the result of the operation cannot be represented, the result is null.
@JsonSerializable()
class Ln extends UnaryExpression {
  Ln({required super.operand});

  factory Ln.fromJson(Map<String, dynamic> json) => _$LnFromJson(json);

  Map<String, dynamic> toJson() => _$LnToJson(this);
}

/// The Exp operator returns e raised to the given power.
/// If the argument is null, the result is null.
/// If the result of the operation cannot be represented, the result is null.
@JsonSerializable()
class Exp extends UnaryExpression {
  Exp({super.operand});

  factory Exp.fromJson(Map<String, dynamic> json) => _$ExpFromJson(json);

  Map<String, dynamic> toJson() => _$ExpToJson(this);
}

/// The Log operator computes the logarithm of its first argument, using the
/// second argument as the base.
/// If either argument is null, the result is null.
/// If the result of the operation cannot be represented, the result is null.
@JsonSerializable()
class Log extends BinaryExpression {
  Log({required this.arg1, required this.arg2})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;

  factory Log.fromJson(Map<String, dynamic> json) => _$LogFromJson(json);

  Map<String, dynamic> toJson() => _$LogToJson(this);
}

/// The Power operator raises the first argument to the power given by the second argument.
/// If either argument is null, the result is null.
/// If the result of the operation cannot be represented, the result is null.
@JsonSerializable()
class Power extends BinaryExpression {
  Power({required this.arg1, required this.arg2})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;

  factory Power.fromJson(Map<String, dynamic> json) => _$PowerFromJson(json);

  Map<String, dynamic> toJson() => _$PowerToJson(this);
}

/// The Successor operator returns the successor of the argument.
/// For example, the successor of 1 is 2. If the argument is already the
/// maximum value for the type, a run-time error is thrown.
/// The Successor operator is defined for the Integer, Long, Decimal, Date,
/// DateTime, and Time types.
/// [More documentation...]
/// If the argument is null, the result is null.
/// If the result of the operation cannot be represented, the result is null.
@JsonSerializable()
class Successor extends UnaryExpression {
  Successor({required super.operand});

  factory Successor.fromJson(Map<String, dynamic> json) =>
      _$SuccessorFromJson(json);

  Map<String, dynamic> toJson() => _$SuccessorToJson(this);
}

/// The Predecessor operator returns the predecessor of the argument.
/// For example, the predecessor of 2 is 1. If the argument is already the
/// minimum value for the type, a run-time error is thrown.
/// The Predecessor operator is defined for the Integer, Long, Decimal, Date,
/// DateTime, and Time types.
/// [More documentation...]
/// If the argument is null, the result is null.
/// If the result of the operation cannot be represented, the result is null.
@JsonSerializable()
class Predecessor extends UnaryExpression {
  Predecessor({required super.operand});

  factory Predecessor.fromJson(Map<String, dynamic> json) =>
      _$PredecessorFromJson(json);

  Map<String, dynamic> toJson() => _$PredecessorToJson(this);
}

/// The MinValue operator returns the minimum representable value for the given type.
/// [Details about MinValue for different types...]
/// Note that implementations may choose to represent the minimum DateTime
/// value using a constant offset such as UTC.
@JsonSerializable()
class MinValue extends Expression {
  String valueType;

  MinValue(this.valueType);

  factory MinValue.fromJson(Map<String, dynamic> json) =>
      _$MinValueFromJson(json);

  Map<String, dynamic> toJson() => _$MinValueToJson(this);
}

/// The MaxValue operator returns the maximum representable value for the given type.
/// [Details about MaxValue for different types...]
/// Note that implementations may choose to represent the maximum DateTime
/// value using a constant offset such as UTC.
@JsonSerializable()
class MaxValue extends Expression {
  String valueType;

  MaxValue(this.valueType);

  factory MaxValue.fromJson(Map<String, dynamic> json) =>
      _$MaxValueFromJson(json);

  Map<String, dynamic> toJson() => _$MaxValueToJson(this);
}

/// The Precision operator returns the number of digits of precision in the value value.
/// [Details about Precision for Decimal, Date, DateTime, and Time values...]
/// If the argument is null, the result is null.
@JsonSerializable()
class Precision extends UnaryExpression {
  Precision({super.operand});

  factory Precision.fromJson(Map<String, dynamic> json) =>
      _$PrecisionFromJson(json);

  Map<String, dynamic> toJson() => _$PrecisionToJson(this);
}

/// The LowBoundary operator returns the least possible value of the value to the specified precision.
/// [Details about LowBoundary for Decimal, Date, DateTime, and Time values...]
/// If the value value is null, the result is null.
@JsonSerializable()
class LowBoundary extends BinaryExpression {
  LowBoundary({required this.arg1, required this.arg2, this.precision})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;
  final int? precision;

  factory LowBoundary.fromJson(Map<String, dynamic> json) =>
      _$LowBoundaryFromJson(json);

  Map<String, dynamic> toJson() => _$LowBoundaryToJson(this);
}

/// The HighBoundary operator returns the greatest possible value of the value
/// to the specified precision.
/// [Details about HighBoundary for Decimal, Date, DateTime, and Time values...]
/// If the value value is null, the result is null.
@JsonSerializable()
class HighBoundary extends BinaryExpression {
  HighBoundary({required this.arg1, required this.arg2, this.precision})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;
  final int? precision;

  factory HighBoundary.fromJson(Map<String, dynamic> json) =>
      _$HighBoundaryFromJson(json);

  Map<String, dynamic> toJson() => _$HighBoundaryToJson(this);
}

/// The Concatenate operator performs string concatenation of its arguments.
/// If any argument is null, the result is null.
@JsonSerializable()
class Concatenate extends NaryExpression {
  Concatenate({required this.arguments});

  final List<Expression> arguments;

  factory Concatenate.fromJson(Map<String, dynamic> json) =>
      _$ConcatenateFromJson(json);

  Map<String, dynamic> toJson() => _$ConcatenateToJson(this);
}

/// The Combine operator combines a list of strings, optionally separating each
/// string with the given separator.
/// If either argument is null, the result is null. If the source list is empty,
/// the result is an empty string ('').
/// For consistency with aggregate operator behavior, null elements in the value list are ignored.
@JsonSerializable()
class Combine extends OperatorExpression {
  final Expression source;
  final Expression? separator;

  Combine({required this.source, this.separator});

  factory Combine.fromJson(Map<String, dynamic> json) =>
      _$CombineFromJson(json);

  Map<String, dynamic> toJson() => _$CombineToJson(this);
}

/// The Split operator splits a string into a list of strings using a separator.
/// If the stringToSplit argument is null, the result is null.
/// If the stringToSplit argument does not contain any appearances of the
/// separator, the result is a list of strings containing one element that is
/// the value of the stringToSplit argument.
@JsonSerializable()
class Split extends OperatorExpression {
  Expression stringToSplit;
  Expression separator;

  Split({required this.stringToSplit, required this.separator});

  factory Split.fromJson(Map<String, dynamic> json) => _$SplitFromJson(json);

  Map<String, dynamic> toJson() => _$SplitToJson(this);
}

/// The SplitOnMatches operator splits a string into a list of strings using
/// matches of a regex pattern.
/// The separatorPattern argument is a regex pattern, following the same
/// semantics as the Matches operator.
/// If the stringToSplit argument is null, the result is null.
/// If the stringToSplit argument does not contain any appearances of the
/// separator pattern, the result is a list of strings containing one element
/// that is the value value of the stringToSplit argument.
@JsonSerializable()
class SplitOnMatches extends OperatorExpression {
  Expression stringToSplit;
  Expression separatorPattern;

  SplitOnMatches({required this.stringToSplit, required this.separatorPattern});

  factory SplitOnMatches.fromJson(Map<String, dynamic> json) =>
      _$SplitOnMatchesFromJson(json);

  Map<String, dynamic> toJson() => _$SplitOnMatchesToJson(this);
}

/// The Length operator returns the length of its argument.
/// For strings, the length is the number of characters in the string.
/// For lists, the length is the number of elements in the list.
/// If the argument is null, the result is 0.
@JsonSerializable()
class Length extends UnaryExpression {
  Length({required super.operand});

  factory Length.fromJson(Map<String, dynamic> json) => _$LengthFromJson(json);

  Map<String, dynamic> toJson() => _$LengthToJson(this);
}

/// The Upper operator returns the given string with all characters converted
/// to their upper case equivalents.
/// Note that the definition of uppercase for a given character is a
/// locale-dependent determination, and is not specified by CQL. Implementations
/// are expected to provide appropriate and consistent handling of locale for their environment.
/// If the argument is null, the result is null.
@JsonSerializable()
class Upper extends UnaryExpression {
  Upper({required super.operand});

  factory Upper.fromJson(Map<String, dynamic> json) => _$UpperFromJson(json);

  Map<String, dynamic> toJson() => _$UpperToJson(this);
}

/// The Lower operator returns the given string with all characters converted
/// to their lowercase equivalents.
/// Note that the definition of lowercase for a given character is a
/// locale-dependent determination,
/// and is not specified by CQL. Implementations are expected to provide
/// appropriate and consistent
/// handling of the locale for their environment.
/// If the argument is null, the result is null.
@JsonSerializable()
class Lower extends UnaryExpression {}

@JsonSerializable()
class Indexer extends BinaryExpression {
  /// The Indexer operator returns the indexth element in a string or list.
  ///
  /// Indexes in strings and lists are defined to be 0-based.
  ///
  /// If the index is less than 0 or greater than the length of the string or list being indexed,
  /// the result is null.
  ///
  /// If either argument is null, the result is null.
  ///
  Indexer({required this.arg1, required this.arg2})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;

  factory Indexer.fromJson(Map<String, dynamic> json) =>
      _$IndexerFromJson(json);

  Map<String, dynamic> toJson() => _$IndexerToJson(this);
}

/// The PositionOf operator returns the 0-based index of the beginning given
/// pattern in the given string.
/// If the pattern is not found, the result is -1.
/// If either argument is null, the result is null.

@JsonSerializable()
class PositionOf extends OperatorExpression {
  Expression pattern;
  Expression string;

  PositionOf(this.pattern, this.string);

  factory PositionOf.fromJson(Map<String, dynamic> json) =>
      _$PositionOfFromJson(json);

  Map<String, dynamic> toJson() => _$PositionOfToJson(this);
}

@JsonSerializable()
class LastPositionOf extends OperatorExpression {
  LastPositionOf({required this.pattern, required this.string});

  final Expression pattern;
  final Expression string;

  factory LastPositionOf.fromJson(Map<String, dynamic> json) =>
      _$LastPositionOfFromJson(json);

  Map<String, dynamic> toJson() => _$LastPositionOfToJson(this);
}

@JsonSerializable()
class Substring extends OperatorExpression {
  Substring({required this.stringToSub, required this.startIndex, this.length});

  final Expression stringToSub;
  final Expression startIndex;
  final Expression? length;

  factory Substring.fromJson(Map<String, dynamic> json) =>
      _$SubstringFromJson(json);

  Map<String, dynamic> toJson() => _$SubstringToJson(this);
}

@JsonSerializable()
class StartsWith extends BinaryExpression {
  StartsWith({required this.arg1, required this.arg2})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;

  factory StartsWith.fromJson(Map<String, dynamic> json) =>
      _$StartsWithFromJson(json);

  Map<String, dynamic> toJson() => _$StartsWithToJson(this);
}

@JsonSerializable()
class EndsWith extends BinaryExpression {
  EndsWith({required this.arg1, required this.arg2})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;

  factory EndsWith.fromJson(Map<String, dynamic> json) =>
      _$EndsWithFromJson(json);

  Map<String, dynamic> toJson() => _$EndsWithToJson(this);
}

@JsonSerializable()
class Matches extends BinaryExpression {
  Matches({required this.arg1, required this.arg2})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;

  factory Matches.fromJson(Map<String, dynamic> json) =>
      _$MatchesFromJson(json);

  Map<String, dynamic> toJson() => _$MatchesToJson(this);
}

@JsonSerializable()
class ReplaceMatches extends TernaryExpression {
  ReplaceMatches(
      {required this.pattern,
      required this.string,
      required this.substitution});

  final Expression pattern;
  final Expression string;
  final Expression substitution;

  factory ReplaceMatches.fromJson(Map<String, dynamic> json) =>
      _$ReplaceMatchesFromJson(json);

  Map<String, dynamic> toJson() => _$ReplaceMatchesToJson(this);
}

enum ElmDateTimePrecision {
  Year,
  Month,
  Week,
  Day,
  Hour,
  Minute,
  Second,
  Millisecond,
}

@JsonSerializable()
class DurationBetween extends BinaryExpression {
  DurationBetween({required this.arg1, required this.arg2, this.precision})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;
  final ElmDateTimePrecision? precision;

  factory DurationBetween.fromJson(Map<String, dynamic> json) =>
      _$DurationBetweenFromJson(json);

  Map<String, dynamic> toJson() => _$DurationBetweenToJson(this);
}

@JsonSerializable()
class DifferenceBetween extends BinaryExpression {
  DifferenceBetween({required this.arg1, required this.arg2, this.precision})
      : super(operand: [Expression(arg1), Expression(arg2)]);

  final dynamic arg1;
  final dynamic arg2;
  final ElmDateTimePrecision? precision;

  factory DifferenceBetween.fromJson(Map<String, dynamic> json) =>
      _$DifferenceBetweenFromJson(json);

  Map<String, dynamic> toJson() => _$DifferenceBetweenToJson(this);
}

@JsonSerializable()
class DateFrom extends UnaryExpression {
  DateFrom({required super.operand});

  factory DateFrom.fromJson(Map<String, dynamic> json) =>
      _$DateFromFromJson(json);

  Map<String, dynamic> toJson() => _$DateFromToJson(this);
}

@JsonSerializable()
class TimeFrom extends UnaryExpression {
  TimeFrom({required super.operand});

  factory TimeFrom.fromJson(Map<String, dynamic> json) =>
      _$TimeFromFromJson(json);

  Map<String, dynamic> toJson() => _$TimeFromToJson(this);
}

@Deprecated('as of 1.4')
@JsonSerializable()
class TimezoneFrom extends UnaryExpression {
  TimezoneFrom({required super.operand});

  factory TimezoneFrom.fromJson(Map<String, dynamic> json) =>
      _$TimezoneFromFromJson(json);

  Map<String, dynamic> toJson() => _$TimezoneFromToJson(this);
}

@JsonSerializable()
class TimezoneOffsetFrom extends UnaryExpression {
  TimezoneOffsetFrom({required super.operand});

  factory TimezoneOffsetFrom.fromJson(Map<String, dynamic> json) =>
      _$TimezoneOffsetFromFromJson(json);

  Map<String, dynamic> toJson() => _$TimezoneOffsetFromToJson(this);
}

@JsonSerializable()
class DateTimeComponentFrom extends UnaryExpression {
  DateTimeComponentFrom({required super.operand, this.precision});

  final ElmDateTimePrecision? precision;

  factory DateTimeComponentFrom.fromJson(Map<String, dynamic> json) =>
      _$DateTimeComponentFromFromJson(json);

  Map<String, dynamic> toJson() => _$DateTimeComponentFromToJson(this);
}

@JsonSerializable()
class TimeOfDay extends OperatorExpression {}

@JsonSerializable()
class Today extends OperatorExpression {}

@JsonSerializable()
class Now extends OperatorExpression {}

@JsonSerializable()
class DateTimeOperator extends OperatorExpression {
  DateTimeOperator({
    required this.year,
    this.month,
    this.day,
    this.hour,
    this.minute,
    this.second,
    this.millisecond,
    this.timezoneOffset,
  });

  final Expression year;
  final Expression? month;
  final Expression? day;
  final Expression? hour;
  final Expression? minute;
  final Expression? second;
  final Expression? millisecond;
  final Expression? timezoneOffset;

  factory DateTimeOperator.fromJson(Map<String, dynamic> json) =>
      _$DateTimeOperatorFromJson(json);

  Map<String, dynamic> toJson() => _$DateTimeOperatorToJson(this);
}

@JsonSerializable()
class SameAs extends BinaryExpression {
  SameAs(
      {required this.arg1, required this.arg2, ElmDateTimePrecision? precision})
      : super(operand: [Expression(arg1), Expression(arg2)]) {
    this.precision = precision;
  }
  final dynamic arg1;
  final dynamic arg2;
  ElmDateTimePrecision? precision;
}

@JsonSerializable()
class SameOrBefore extends BinaryExpression {
  SameOrBefore(
      {required this.arg1, required this.arg2, ElmDateTimePrecision? precision})
      : super(operand: [Expression(arg1), Expression(arg2)]) {
    this.precision = precision;
  }
  final dynamic arg1;
  final dynamic arg2;
  ElmDateTimePrecision? precision;
}

@JsonSerializable()
class SameOrAfter extends BinaryExpression {
  SameOrAfter(
      {required this.arg1, required this.arg2, ElmDateTimePrecision? precision})
      : super(operand: [Expression(arg1), Expression(arg2)]) {
    this.precision = precision;
  }
  final dynamic arg1;
  final dynamic arg2;
  ElmDateTimePrecision? precision;
}

@JsonSerializable()
class PointFrom extends UnaryExpression {
  PointFrom({required super.operand});
}

@JsonSerializable()
class Width extends UnaryExpression {
  Width({required super.operand});
}

@JsonSerializable()
class Size extends UnaryExpression {
  Size({required super.operand});
}

@JsonSerializable()
class Start extends UnaryExpression {
  Start({required super.operand});
}

@JsonSerializable()
class End extends UnaryExpression {
  End({required super.operand});
}

// @JsonSerializable()
// class Contains extends BinaryExpression {
//   Contains(Expression left, Expression right, {ElmDateTimePrecision? precision})
//       : super([left, right]) {
//     this.precision = precision;
//   }
//   ElmDateTimePrecision? precision;
// }

// @JsonSerializable()
// class ProperContains extends BinaryExpression {
//   ProperContains(Expression left, Expression right, {ElmDateTimePrecision? precision})
//       : super([left, right]) {
//     this.precision = precision;
//   }
//   ElmDateTimePrecision? precision;
// }

// @JsonSerializable()
// class In extends BinaryExpression {
//   In(Expression left, Expression right, {ElmDateTimePrecision? precision})
//       : super([left, right]) {
//     this.precision = precision;
//   }
//   ElmDateTimePrecision? precision;
// }

// @JsonSerializable()
// class ProperIn extends BinaryExpression {
//   ProperIn(Expression left, Expression right, {ElmDateTimePrecision? precision})
//       : super([left, right]) {
//     this.precision = precision;
//   }
//   ElmDateTimePrecision? precision;
// }

// @JsonSerializable()
// class Includes extends BinaryExpression {
//   Includes(Expression left, Expression right, {ElmDateTimePrecision? precision})
//       : super([left, right]) {
//     this.precision = precision;
//   }
//   ElmDateTimePrecision? precision;
// }

// @JsonSerializable()
// class IncludedIn extends BinaryExpression {
//   IncludedIn(Expression left, Expression right, {ElmDateTimePrecision? precision})
//       : super([left, right]) {
//     this.precision = precision;
//   }
//   ElmDateTimePrecision? precision;
// }

// @JsonSerializable()
// class ProperIncludes extends BinaryExpression {
//   ProperIncludes(Expression left, Expression right, {ElmDateTimePrecision? precision})
//       : super([left, right]) {
//     this.precision = precision;
//   }
//   ElmDateTimePrecision? precision;
// }

// @JsonSerializable()
// class ProperIncludedIn extends BinaryExpression {
//   ProperIncludedIn(Expression left, Expression right, {ElmDateTimePrecision? precision})
//       : super([left, right]) {
//     this.precision = precision;
//   }
//   ElmDateTimePrecision? precision;
// }

// @JsonSerializable()
// class Before extends BinaryExpression {
//   Before(Expression left, Expression right, {ElmDateTimePrecision? precision})
//       : super([left, right]) {
//     this.precision = precision;
//   }
//   ElmDateTimePrecision? precision;
// }

// @JsonSerializable()
// class After extends BinaryExpression {
//   After(Expression left, Expression right, {ElmDateTimePrecision? precision})
//       : super([left, right]) {
//     this.precision = precision;
//   }
//   ElmDateTimePrecision? precision;
// }

// @JsonSerializable()
// class Meets extends BinaryExpression {
//   Meets(Expression left, Expression right, {ElmDateTimePrecision? precision})
//       : super([left, right]) {
//     this.precision = precision;
//   }
//   ElmDateTimePrecision? precision;
// }

// @JsonSerializable()
// class MeetsBefore extends BinaryExpression {
//   MeetsBefore(Expression left, Expression right, {ElmDateTimePrecision? precision})
//       : super([left, right]) {
//     this.precision = precision;
//   }
//   ElmDateTimePrecision? precision;
// }

// @JsonSerializable()
// class MeetsAfter extends BinaryExpression {
//   MeetsAfter(Expression left, Expression right, {ElmDateTimePrecision? precision})
//       : super([left, right]) {
//     this.precision = precision;
//   }
//   ElmDateTimePrecision? precision;
// }

// @JsonSerializable()
// class Overlaps extends BinaryExpression {
//   Overlaps(Expression left, Expression right, {ElmDateTimePrecision? precision})
//       : super([left, right]) {
//     this.precision = precision;
//   }
//   ElmDateTimePrecision? precision;
// }

// @JsonSerializable()
// class OverlapsBefore extends BinaryExpression {
//   OverlapsBefore(Expression left, Expression right, {ElmDateTimePrecision? precision})
//       : super([left, right]) {
//     this.precision = precision;
//   }
//   ElmDateTimePrecision? precision;
// }

// @JsonSerializable()
// class OverlapsAfter extends BinaryExpression {
//   OverlapsAfter(Expression left, Expression right, {ElmDateTimePrecision? precision})
//       : super([left, right]) {
//     this.precision = precision;
//   }
//   ElmDateTimePrecision? precision;
// }

// @JsonSerializable()
// class Starts extends BinaryExpression {
//   Starts(Expression left, Expression right, {ElmDateTimePrecision? precision})
//       : super([left, right]) {
//     this.precision = precision;
//   }
//   ElmDateTimePrecision? precision;
// }

// @JsonSerializable()
// class Ends extends BinaryExpression {
//   Ends(Expression left, Expression right, {ElmDateTimePrecision? precision})
//       : super([left, right]) {
//     this.precision = precision;
//   }
//   ElmDateTimePrecision? precision;
// }

// @JsonSerializable()
// class Collapse extends BinaryExpression {
//   Collapse(Expression left, Expression right) : super([left, right]);
// }

// @JsonSerializable()
// class Expand extends BinaryExpression {
//   Expand(Expression left, Expression right) : super([left, right]);
// }

// @JsonSerializable()
// class Union extends NaryExpression {
//   Union(List<Expression> arguments) : super(arguments);
// }

// @JsonSerializable()
// class Intersect extends NaryExpression {
//   Intersect(List<Expression> arguments) : super(arguments);
// }

// @JsonSerializable()
// class ExceptListList extends NaryExpression {
//   ExceptListList(Expression left, Expression right) : super([left, right]);
// }

// @JsonSerializable()
// class ExceptIntervalInterval extends NaryExpression {
//   ExceptIntervalInterval(Expression left, Expression right) : super([left, right]);
// }

// @JsonSerializable()
// class Exists extends UnaryExpression {
//   Exists(Expression operand) : super(operand);
// }

// @JsonSerializable()
// class Times extends BinaryExpression {
//   Times(Expression left, Expression right) : super(left, right);
// }

// @JsonSerializable()
// class Filter extends Expression {
//   Filter(Expression source, Expression condition, {String? scope})
//       : source = source,
//         condition = condition,
//         scope = scope;

//   Expression source;
//   Expression condition;
//   String? scope;
// }

// @JsonSerializable()
// class First extends OperatorExpression {
//   First(Expression source, {String? orderBy})
//       : source = source,
//         orderBy = orderBy;

//   Expression source;
//   String? orderBy;
// }

// @JsonSerializable()
// class Last extends OperatorExpression {
//   Last(Expression source, {String? orderBy})
//       : source = source,
//         orderBy = orderBy;

//   Expression source;
//   String? orderBy;
// }

// @JsonSerializable()
// class Slice extends OperatorExpression {
//   Slice(Expression source, Expression startIndex, Expression endIndex)
//       : source = source,
//         startIndex = startIndex,
//         endIndex = endIndex;

//   Expression source;
//   Expression startIndex;
//   Expression endIndex;
// }

// @JsonSerializable()
// class IndexOf extends OperatorExpression {
//   IndexOf(Expression source, Expression element)
//       : source = source,
//         element = element;

//   Expression source;
//   Expression element;
// }

// // Flatten operator@JsonSerializable()
// @JsonSerializable()
// class Flatten extends UnaryExpression {}

// // Sort operator@JsonSerializable()
// @JsonSerializable()
// class Sort extends Expression {
//   Sort(Expression source, List<SortByItem> by)
//       : source = source,
//         by = by;

//   Expression source;
//   List<SortByItem> by;
// }

// // ForEach expression@JsonSerializable()
// @JsonSerializable()
// class ForEach extends Expression {
//   ForEach(Expression source, Expression element, {String? scope})
//       : source = source,
//         element = element,
//         scope = scope;

//   Expression source;
//   Expression element;
//   String? scope;
// }

// // Repeat expression@JsonSerializable()
// @JsonSerializable()
// class Repeat extends Expression {
//   Repeat(Expression source, Expression element, {String? scope})
//       : source = source,
//         element = element,
//         scope = scope;

//   Expression source;
//   Expression element;
//   String? scope;
// }

// // Distinct operator@JsonSerializable()
// @JsonSerializable()
// class Distinct extends UnaryExpression {}

// // Current expression@JsonSerializable()
// @JsonSerializable()
// class Current extends Expression {
//   Current({String? scope}) : scope = scope;

//   String? scope;
// }

// // Iteration expression@JsonSerializable()
// @JsonSerializable()
// class Iteration extends Expression {
//   Iteration({String? scope}) : scope = scope;

//   String? scope;
// }

// // Total expression@JsonSerializable()
// @JsonSerializable()
// class Total extends Expression {
//   Total({String? scope}) : scope = scope;

//   String? scope;
// }

// // SingletonFrom expression@JsonSerializable()
// @JsonSerializable()
// class SingletonFrom extends UnaryExpression {}

// // AggregateExpression abstract class
// @JsonSerializable()
// abstract class AggregateExpression extends Expression {
//   AggregateExpression(List<TypeSpecifier> signature, Expression source,
//       {String? path})
//       : signature = signature,
//         source = source,
//         path = path;

//   List<TypeSpecifier> signature;
//   Expression source;
//   String? path;
// }

// // Aggregate operator@JsonSerializable()
// @JsonSerializable()
// class Aggregate extends AggregateExpression {
//   Aggregate(Expression source, Expression iteration,
//       {Expression? initialValue})
//       : super([], source) {
//     this.iteration = iteration;
//     this.initialValue = initialValue;
//   }

//   Expression iteration;
//   Expression? initialValue;
// }

// // Count operator@JsonSerializable()
// @JsonSerializable()
// class Count extends AggregateExpression {
//   Count(Expression source, {String? path}) : super([], source, path: path);
// }

// // Sum operator@JsonSerializable()
// @JsonSerializable()
// class Sum extends AggregateExpression {
//   Sum(Expression source, {String? path}) : super([], source, path: path);
// }

// // Product operator@JsonSerializable()
// @JsonSerializable()
// class Product extends AggregateExpression {
//   Product(Expression source, {String? path}) : super([], source, path: path);
// }

// // Min operator@JsonSerializable()
// @JsonSerializable()
// class Min extends AggregateExpression {
//   Min(Expression source, {String? path}) : super([], source, path: path);
// }

// // Max operator@JsonSerializable()
// @JsonSerializable()
// class Max extends AggregateExpression {
//   Max(Expression source, {String? path}) : super([], source, path: path);
// }

// // Avg operator@JsonSerializable()
// @JsonSerializable()
// class Avg extends AggregateExpression {
//   Avg(Expression source, {String? path}) : super([], source, path: path);
// }

// // GeometricMean operator@JsonSerializable()
// @JsonSerializable()
// class GeometricMean extends AggregateExpression {
//   GeometricMean(Expression source, {String? path}) : super([], source, path: path);
// }

// // Median operator@JsonSerializable()
// @JsonSerializable()
// class Median extends AggregateExpression {
//   Median(Expression source, {String? path}) : super([], source, path: path);
// }

// // Mode operator@JsonSerializable()
// @JsonSerializable()
// class Mode extends AggregateExpression {
//   Mode(Expression source, {String? path}) : super([], source, path: path);
// }

// // Variance operator@JsonSerializable()
// @JsonSerializable()
// class Variance extends AggregateExpression {
//   Variance(Expression source, {String? path}) : super([], source, path: path);
// }

// // PopulationVariance operator@JsonSerializable()
// @JsonSerializable()
// class PopulationVariance extends AggregateExpression {
//   PopulationVariance(Expression source, {String? path}) : super([], source, path: path);
// }

// // StdDev operator@JsonSerializable()
// @JsonSerializable()
// class StdDev extends AggregateExpression {
//   StdDev(Expression source, {String? path}) : super([], source, path: path);
// }

// // PopulationStdDev operator@JsonSerializable()
// @JsonSerializable()
// class PopulationStdDev extends AggregateExpression {
//   PopulationStdDev(Expression source, {String? path}) : super([], source, path: path);
// }

// // AllTrue operator@JsonSerializable()
// @JsonSerializable()
// class AllTrue extends AggregateExpression {
//   AllTrue(Expression source, {String? path}) : super([], source, path: path);
// }

// // AnyTrue operator@JsonSerializable()
// @JsonSerializable()
// class AnyTrue extends AggregateExpression {
//   AnyTrue(Expression source, {String? path}) : super([], source, path: path);
// }

// Property operator@JsonSerializable()
@JsonSerializable()
class Property extends Expression {
  final String path;
  final String? scope;

  Property({required this.path, this.scope}) : super();

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyToJson(this);
}

// // AliasedQuerySource element@JsonSerializable()
// @JsonSerializable()
// class AliasedQuerySource extends Element {
//   AliasedQuerySource(Expression expression, String alias)
//       : super(sequence: [expression], attributes: {'alias': alias});
// }

// // LetClause element@JsonSerializable()
// @JsonSerializable()
// class LetClause extends Element {
//   LetClause(Expression expression, String identifier)
//       : super(sequence: [expression], attributes: {'identifier': identifier});
// }

// // RelationshipClause element
// @JsonSerializable()
// abstract class RelationshipClause extends AliasedQuerySource {
//   RelationshipClause(Expression expression, String alias, Expression suchThat)
//       : super(expression, alias) {
//     sequence.add(suchThat);
//   }
// }

// // With clause@JsonSerializable()
// @JsonSerializable()
// class With extends RelationshipClause {
//   With(Expression expression, String alias, Expression suchThat)
//       : super(expression, alias, suchThat);
// }

// // Without clause@JsonSerializable()
// @JsonSerializable()
// class Without extends RelationshipClause {
//   Without(Expression expression, String alias, Expression suchThat)
//       : super(expression, alias, suchThat);
// }

// // SortDirection enumeration
// enum SortDirection { asc, ascending, desc, descending }

// // SortByItem abstract type
// @JsonSerializable()
// abstract class SortByItem extends Element {
//   SortByItem({SortDirection? direction})
//       : super(attributes: {'direction': direction.toString().split('.').last});
// }

// // ByDirection element@JsonSerializable()
// @JsonSerializable()
// class ByDirection extends SortByItem {
//   ByDirection({SortDirection? direction}) : super(direction: direction);
// }

// // ByColumn element@JsonSerializable()
// @JsonSerializable()
// class ByColumn extends SortByItem {
//   ByColumn({SortDirection? direction, String? path})
//       : super(direction: direction, attributes: {'path': path});
// }

// // ByExpression element@JsonSerializable()
// @JsonSerializable()
// class ByExpression extends SortByItem {
//   ByExpression(Expression expression, {SortDirection? direction})
//       : super(direction: direction, sequence: [expression]);
// }

// // SortClause element@JsonSerializable()
// @JsonSerializable()
// class SortClause extends Element {
//   SortClause(List<SortByItem> by)
//       : super(sequence: by.map((item) => item).toList());
// }

// // ReturnClause element@JsonSerializable()
// @JsonSerializable()
// class ReturnClause extends Element {
//   ReturnClause(Expression expression, {bool distinct = true})
//       : super(sequence: [expression], attributes: {'distinct': distinct});
// }

// // AggregateClause element@JsonSerializable()
// @JsonSerializable()
// class AggregateClause extends Element {
//   AggregateClause(Expression expression,
//       {Expression? starting, required String identifier, bool distinct = false})
//       : super(
//             sequence: starting != null ? [expression, starting] : [expression],
//             attributes: {'identifier': identifier, 'distinct': distinct});
// }

// // Query operator@JsonSerializable()
// @JsonSerializable()
// class Query extends Expression {
//   Query(List<AliasedQuerySource> source,
//       {List<LetClause>? let,
//       List<RelationshipClause>? relationship,
//       Expression? where,
//       ReturnClause? returnClause,
//       AggregateClause? aggregate,
//       SortClause? sort})
//       : super(
//             sequence: [
//               ...source,
//               if (let != null) ...let,
//               if (relationship != null) ...relationship,
//               if (where != null) where,
//               if (returnClause != null) returnClause,
//               if (aggregate != null) aggregate,
//               if (sort != null) sort,
//             ],
//             attributes: {});
// }

// // AliasRef expression@JsonSerializable()
// @JsonSerializable()
// class AliasRef extends Expression {
//   AliasRef(String name) : super(attributes: {'name': name});
// }

// // QueryLetRef expression@JsonSerializable()
// @JsonSerializable()
// class QueryLetRef extends Expression {
//   QueryLetRef(String name) : super(attributes: {'name': name});
// }

// // Children operator@JsonSerializable()
// @JsonSerializable()
// class Children extends OperatorExpression {
//   Children(Expression source) : super(sequence: [source]);
// }

// // Descendents operator@JsonSerializable()
// @JsonSerializable()
// class Descendents extends OperatorExpression {
//   Descendents(Expression source) : super(sequence: [source]);
// }

// // Message operator@JsonSerializable()
// @JsonSerializable()
// class Message extends OperatorExpression {
//   Message(Expression source,
//       {Expression? condition,
//       Expression? code,
//       Expression? severity,
//       Expression? message})
//       : super(
//             sequence: [source, condition, code, severity, message],
//             attributes: {});
// }
