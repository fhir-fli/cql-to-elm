// Vocabulary abstract type
import 'package:fhir/r4.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../quantity/quantity.dart';
import '../schema.dart';

part 'types.g.dart';

@JsonSerializable()
class Vocabulary {
  final String id;
  final String? version;
  final String? name;

  Vocabulary(this.id, {this.version, this.name});

  factory Vocabulary.fromJson(Map<String, dynamic> json) =>
      _$VocabularyFromJson(json);

  Map<String, dynamic> toJson() => _$VocabularyToJson(this);
}

// ValueSet type
@JsonSerializable()
class ValueSet extends Vocabulary {
  final List<CodeSystem>? codeSystem;

  ValueSet(String id, {String? version, String? name, this.codeSystem})
      : super(id, version: version, name: name);

  factory ValueSet.fromJson(Map<String, dynamic> json) =>
      _$ValueSetFromJson(json);

  Map<String, dynamic> toJson() => _$ValueSetToJson(this);
}

// CodeSystem type
@JsonSerializable()
class CodeSystem extends Vocabulary {
  CodeSystem(String id, {String? version, String? name})
      : super(id, version: version, name: name);

  factory CodeSystem.fromJson(Map<String, dynamic> json) =>
      _$CodeSystemFromJson(json);

  Map<String, dynamic> toJson() => _$CodeSystemToJson(this);
}

// IntegerInterval type
@JsonSerializable()
class IntegerInterval extends Interval {
  final FhirInteger? low;
  final FhirInteger? high;

  IntegerInterval({this.low, this.high});

  factory IntegerInterval.fromJson(Map<String, dynamic> json) =>
      _$IntegerIntervalFromJson(json);

  Map<String, dynamic> toJson() => _$IntegerIntervalToJson(this);
}

// DecimalInterval type
@JsonSerializable()
class DecimalInterval extends Interval {
  final FhirDecimal? low;
  final FhirDecimal? high;

  DecimalInterval({this.low, this.high});

  factory DecimalInterval.fromJson(Map<String, dynamic> json) =>
      _$DecimalIntervalFromJson(json);

  Map<String, dynamic> toJson() => _$DecimalIntervalToJson(this);
}

class QuantityInterval extends Interval {
  final ElmQuantity? low;
  final ElmQuantity? high;

  QuantityInterval({this.low, this.high});

  factory QuantityInterval.fromJson(Map<String, dynamic> json) =>
      QuantityInterval(
          low: ElmQuantity.fromJson(json['low']),
          high: ElmQuantity.fromJson(json['low']));

  Map<String, dynamic> toJson() {
    {
      final val = <String, dynamic>{};
      void writeNotNull(String key, dynamic value) {
        if (value != null) {
          val[key] = value;
        }
      }

      writeNotNull('low', low?.toJson());
      writeNotNull('high', high?.toJson());
      return val;
    }
  }
}

// DateInterval type
@JsonSerializable()
class DateInterval extends Interval {
  final FhirDate? low;
  final FhirDate? high;

  DateInterval({this.low, this.high});

  factory DateInterval.fromJson(Map<String, dynamic> json) =>
      _$DateIntervalFromJson(json);

  Map<String, dynamic> toJson() => _$DateIntervalToJson(this);
}

// DateTimeInterval type
@JsonSerializable()
class DateTimeInterval extends Interval {
  final FhirDateTime? low;
  final FhirDateTime? high;

  DateTimeInterval({this.low, this.high});

  factory DateTimeInterval.fromJson(Map<String, dynamic> json) =>
      _$DateTimeIntervalFromJson(json);

  Map<String, dynamic> toJson() => _$DateTimeIntervalToJson(this);
}

// TimeInterval type
@JsonSerializable()
class TimeInterval extends Interval {
  final FhirTime? low;
  final FhirTime? high;

  TimeInterval({this.low, this.high});

  factory TimeInterval.fromJson(Map<String, dynamic> json) =>
      _$TimeIntervalFromJson(json);

  Map<String, dynamic> toJson() => _$TimeIntervalToJson(this);
}
