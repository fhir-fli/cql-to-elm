import 'package:json_annotation/json_annotation.dart';

part 'types.g.dart';

@JsonSerializable()
class Element {
  Element();

  factory Element.fromJson(Map<String, dynamic> json) =>
      _$ElementFromJson(json);

  Map<String, dynamic> toJson() => _$ElementToJson(this);
}

@JsonSerializable()
class Any {
  Any();
  factory Any.fromJson(Map<String, dynamic> json) => _$AnyFromJson(json);
  Map<String, dynamic> toJson() => _$AnyToJson(this);
}

@JsonSerializable()
class Boolean extends Any {
  Boolean(this.value);
  bool value;
  factory Boolean.fromJson(Map<String, dynamic> json) =>
      _$BooleanFromJson(json);
  Map<String, dynamic> toJson() => _$BooleanToJson(this);
}

@JsonSerializable()
class Code extends Any {
  Code({required this.code, this.display, this.system, this.version});
  String code;
  String? display;
  String? system;
  String? version;
  factory Code.fromJson(Map<String, dynamic> json) => _$CodeFromJson(json);
  Map<String, dynamic> toJson() => _$CodeToJson(this);
}

@JsonSerializable()
class Concept {
  Concept({required this.codes, this.display});
  List<Code> codes;
  String? display;
  factory Concept.fromJson(Map<String, dynamic> json) =>
      _$ConceptFromJson(json);
  Map<String, dynamic> toJson() => _$ConceptToJson(this);
}

@JsonSerializable()
class Date extends Any {
  Date(this.value);
  String value;

  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);
  Map<String, dynamic> toJson() => _$DateToJson(this);
}

@JsonSerializable()
class DateTime extends Any {
  DateTime(this.value);
  String value;
  factory DateTime.fromJson(Map<String, dynamic> json) =>
      _$DateTimeFromJson(json);

  Map<String, dynamic> toJson() => _$DateTimeToJson(this);
}

@JsonSerializable()
class Decimal extends Any {
  Decimal(this.value);
  double value;
  factory Decimal.fromJson(Map<String, dynamic> json) =>
      _$DecimalFromJson(json);
  Map<String, dynamic> toJson() => _$DecimalToJson(this);
}

@JsonSerializable()
class Integer extends Any {
  Integer(this.value);
  int value;
  factory Integer.fromJson(Map<String, dynamic> json) =>
      _$IntegerFromJson(json);
  Map<String, dynamic> toJson() => _$IntegerToJson(this);
}

@JsonSerializable()
class Quantity extends Any {
  Quantity({required this.value, this.unit});
  Decimal value;
  String? unit;
  factory Quantity.fromJson(Map<String, dynamic> json) =>
      _$QuantityFromJson(json);
  Map<String, dynamic> toJson() => _$QuantityToJson(this);
}

@JsonSerializable()
class Ratio extends Any {
  Ratio({required this.numerator, required this.denominator});
  Quantity numerator;
  Quantity denominator;
  factory Ratio.fromJson(Map<String, dynamic> json) => _$RatioFromJson(json);
  Map<String, dynamic> toJson() => _$RatioToJson(this);
}

@JsonSerializable()
class StringElm extends Any {
  StringElm(this.value);
  String value;
  factory StringElm.fromJson(Map<String, dynamic> json) =>
      _$StringElmFromJson(json);
  Map<String, dynamic> toJson() => _$StringElmToJson(this);
}

@JsonSerializable()
class Time extends Any {
  Time(this.value);
  String? value;
  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);
  Map<String, dynamic> toJson() => _$TimeToJson(this);
}

@JsonSerializable()
class Interval extends Any {
  Interval({this.lowClosed, this.highClosed});
  Boolean? lowClosed;
  Boolean? highClosed;
  factory Interval.fromJson(Map<String, dynamic> json) =>
      _$IntervalFromJson(json);
  Map<String, dynamic> toJson() => _$IntervalToJson(this);
}

@JsonSerializable()
class IntegerInterval extends Interval {
  IntegerInterval({this.low, this.high});
  Integer? low;
  Integer? high;
  factory IntegerInterval.fromJson(Map<String, dynamic> json) =>
      _$IntegerIntervalFromJson(json);
  Map<String, dynamic> toJson() => _$IntegerIntervalToJson(this);
}

@JsonSerializable()
class DecimalInterval extends Interval {
  DecimalInterval({this.low, this.high});
  Decimal? low;
  Decimal? high;
  factory DecimalInterval.fromJson(Map<String, dynamic> json) =>
      _$DecimalIntervalFromJson(json);
  Map<String, dynamic> toJson() => _$DecimalIntervalToJson(this);
}

@JsonSerializable()
class QuantityInterval extends Interval {
  QuantityInterval({this.low, this.high});
  Quantity? low;
  Quantity? high;
  factory QuantityInterval.fromJson(Map<String, dynamic> json) =>
      _$QuantityIntervalFromJson(json);
  Map<String, dynamic> toJson() => _$QuantityIntervalToJson(this);
}

@JsonSerializable()
class DateInterval extends Interval {
  DateInterval({this.low, this.high});
  Date? low;
  Date? high;
  factory DateInterval.fromJson(Map<String, dynamic> json) =>
      _$DateIntervalFromJson(json);
  Map<String, dynamic> toJson() => _$DateIntervalToJson(this);
}

@JsonSerializable()
class DateTimeInterval extends Interval {
  DateTimeInterval({this.low, this.high});
  DateTime? low;
  DateTime? high;
  factory DateTimeInterval.fromJson(Map<String, dynamic> json) =>
      _$DateTimeIntervalFromJson(json);
  Map<String, dynamic> toJson() => _$DateTimeIntervalToJson(this);
}

@JsonSerializable()
class TimeInterval extends Interval {
  TimeInterval({this.low, this.high});
  Time? low;
  Time? high;
  factory TimeInterval.fromJson(Map<String, dynamic> json) =>
      _$TimeIntervalFromJson(json);
  Map<String, dynamic> toJson() => _$TimeIntervalToJson(this);
}
