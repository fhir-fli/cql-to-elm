// ignore_for_file: annotate_overrides, noop_primitive_operations, avoid_equals_and_hash_code_on_mutable_classes, library_private_types_in_public_api, avoid_bool_literals_in_conditional_expressions

// Package imports:
import 'package:fhir/r4.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:units_converter/units_converter.dart';

// Project imports:
import '../cql_lm/cql_lm.dart';
import 'duration_code.dart';
import 'ratios.dart' as unitRatios;
import 'string_unit_to_property.dart';
import 'unit_code.dart';

part 'elm_quantity.freezed.dart';
part 'elm_quantity.g.dart';

@freezed
class ElmQuantity extends ElmElement with _$ElmQuantity implements Quantity {
  ElmQuantity._();

  factory ElmQuantity({
    FhirDecimal? value,
    String? unit,
    FhirUri? system,
    FhirCode? code,
  }) = _ElmQuantity;

  ElmQuantity copyWith({
    FhirDecimal? value,
    String? unit,
    FhirUri? system,
    FhirCode? code,
  }) =>
      ElmQuantity(
        value: value,
        unit: unit,
        system: system,
        code: code,
      );

  factory ElmQuantity.fromJson(Map<String, dynamic> json) =>
      _$ElmQuantityFromJson(json);

  factory ElmQuantity.fromString(String quantityString) {
    if (ElmQuantity.ElmQuantityRegex.hasMatch(
        quantityString.replaceAll(r"\'", "'"))) {
      final match = ElmQuantity.ElmQuantityRegex.firstMatch(
          quantityString.replaceAll(r"\'", "'"));
      final value = match?.namedGroup('value');
      if (value == null) {
        throw Exception('Malformed quantity: $quantityString');
      }
      final unit = match?.namedGroup('unit');
      final time = match?.namedGroup('time');
      String unitString = '';

      if (unit == null && time == null) {
        // Special logic for UCUM, where the empty unit is '1';
        unitString = '1';
      } else if (unit != null) {
        unitString = unit;
      } else if (time != null) {
        unitString = time;
      }

      // Cannot just replace all apostrophes, as some units have one in the middle.
      if (unitString.startsWith("'")) {
        unitString = unitString.substring(1, unitString.length - 1);
      }

      // Escaped ' can all be removed
      unitString.replaceAll(r"\'", '');

      // Try to normalize time-valued units
      unitString = timeValuedQuantitiesUnits[unitString] ?? unitString;

      return ElmQuantity(
          value: FhirDecimal(double.parse(value)), unit: unitString);
    } else {
      throw Exception('Malformed quantity: $quantityString');
    }
  }

  static RegExp ElmQuantityRegex = RegExp(
      r"^(?<value>(\+|-)?\d+(\.\d+)?)\s*('(?<unit>[^']+)'|(?<time>[a-zA-Z]+))?$");

  num? get amount => value?.value;
  bool get isNaN => value?.value?.isNaN ?? true;
  bool get isTimeValued => timeValuedQuantitiesUnits.containsValue(unit);
  bool get isDefiniteDuration =>
      definiteQuantityDurationUnits.containsKey(unit);
  double? getValue() => value?.value?.toDouble();
  String? getUnit() => unit;

  Quantity abs() => this.copyWith(
      value: value?.value?.abs() == null
          ? null
          : FhirDecimal(value!.value!.abs().toDouble()));

  bool _eq(Object o, bool equivalent) {
    if (identical(this, o)) {
      return true;
    } else if (o is! Quantity) {
      return false;
    } else {
      double? thisAmount = value?.value;
      double? thatAmount = o.value?.value;
      final fromUnit = stringUnitToProperty[unit];
      final toUnit = stringUnitToProperty[o.unit];
      if (fromUnit == null || toUnit == null) {
        if (fromUnit == null && toUnit == null) {
          if ((num.tryParse(unit.toString()) == 1) &&
              (num.tryParse(o.unit.toString()) == 1)) {
            if (equivalent) {
              final sigDigsLhs = thisAmount?.toStringAsExponential().split('e');
              final sigDigsRhs = thatAmount?.toStringAsExponential().split('e');
              if ((sigDigsLhs == null && sigDigsRhs != null) ||
                  (sigDigsLhs != null && sigDigsRhs == null)) {
                return false;
              }
              if (sigDigsLhs != null && sigDigsRhs != null) {
                if (sigDigsLhs.first.length < sigDigsRhs.first.length) {
                  thatAmount = double.parse(
                      '${sigDigsRhs.first.toString().substring(0, sigDigsLhs.first.length)}'
                      'e${sigDigsRhs.last}');
                } else {
                  thisAmount = double.parse(
                      '${sigDigsLhs.first.toString().substring(0, sigDigsRhs.first.length)}'
                      'e${sigDigsLhs.last}');
                }
              }
              return thisAmount == thatAmount;
            } else {
              return thisAmount == thatAmount;
            }
          } else {
            return false;
          }
        } else {
          return false;
        }
      } else {
        if ((fromUnit is Ratio && toUnit is! Ratio) ||
            (fromUnit is! Ratio && toUnit is Ratio)) {
          return false;
        } else if (fromUnit is Ratio) {
          if (equivalent) {
            final sigDigsLhs = thisAmount?.toStringAsExponential().split('e');
            final sigDigsRhs = thatAmount?.toStringAsExponential().split('e');
            if ((sigDigsLhs == null && sigDigsRhs != null) ||
                (sigDigsLhs != null && sigDigsRhs == null)) {
              return false;
            }
            if (sigDigsLhs != null && sigDigsRhs != null) {
              if (sigDigsLhs.first.length < sigDigsRhs.first.length) {
                thatAmount = double.parse(
                    '${sigDigsRhs.first.toString().substring(0, sigDigsLhs.first.length)}'
                    'e${sigDigsRhs.last}');
              } else {
                thisAmount = double.parse(
                    '${sigDigsLhs.first.toString().substring(0, sigDigsRhs.first.length)}'
                    'e${sigDigsLhs.last}');
              }
            }
          }
          return thisAmount?.convertRatioFromTo(
                  fromUnit as unitRatios.Ratio, toUnit as unitRatios.Ratio) ==
              thatAmount;
        } else {
          if (equivalent) {
            final sigDigsLhs = thisAmount?.toStringAsExponential().split('e');
            final sigDigsRhs = thatAmount?.toStringAsExponential().split('e');
            if ((sigDigsLhs == null && sigDigsRhs != null) ||
                (sigDigsLhs != null && sigDigsRhs == null)) {
              return false;
            }
            if (sigDigsLhs != null && sigDigsRhs != null) {
              if (sigDigsLhs.first.length < sigDigsRhs.first.length) {
                thatAmount = double.parse(
                    '${sigDigsRhs.first.toString().substring(0, sigDigsLhs.first.length)}'
                    'e${sigDigsRhs.last}');
              } else {
                thisAmount = double.parse(
                    '${sigDigsLhs.first.toString().substring(0, sigDigsRhs.first.length)}'
                    'e${sigDigsLhs.last}');
              }
            }
          }
          // TODO(Dokotela): Fix this
          return false;
          // thisAmount
          //         ?.toString()
          //         .unitRatios
          //         .convertFromTo(from, to)
          //         .convertFromTo(from, to)
          //         .convertFromTo(
          //             fromUnit as NUMERAL_SYSTEMS, toUnit as NUMERAL_SYSTEMS) ==
          // thatAmount;
        }
      }
    }
  }

  bool equals(Object other) => _eq(other, false);

  bool equivalent(Object o) => _eq(o, true);

  bool compare(_Comparator comparator, Object o) {
    if (identical(this, o)) {
      return true;
    } else if (o is! Quantity) {
      return false;
    } else {
      final fromUnit = stringUnitToProperty[unit];
      final toUnit = stringUnitToProperty[o.unit];
      if ((fromUnit is unitRatios.Ratio && toUnit is! unitRatios.Ratio) ||
          (fromUnit is! unitRatios.Ratio && toUnit is unitRatios.Ratio)) {
        return false;
      } else if (fromUnit is Ratio) {
        if (toUnit is! Ratio) {
          return false;
        } else {
          final convertedAmount = value?.value?.convertRatioFromTo(
              fromUnit as unitRatios.Ratio, toUnit as unitRatios.Ratio);

          if (convertedAmount != null) {
            if (o.value == null || o.value!.value == null) {
              return false;
            }
            switch (comparator) {
              case _Comparator.gt:
                return convertedAmount > o.value!.value!;
              case _Comparator.gte:
                return convertedAmount >= o.value!.value!;
              case _Comparator.lt:
                return convertedAmount < o.value!.value!;
              case _Comparator.lte:
                return convertedAmount <= o.value!.value!;
            }
          } else {
            return false;
          }
        }
      } else {
        final convertedAmount = value?.value?.convertFromTo(fromUnit, toUnit);
        if (convertedAmount != null) {
          if (o.value == null || o.value!.value == null) {
            return false;
          }
          switch (comparator) {
            case _Comparator.gt:
              return convertedAmount > o.value!.value!;
            case _Comparator.gte:
              return convertedAmount >= o.value!.value!;
            case _Comparator.lt:
              return convertedAmount < o.value!.value!;
            case _Comparator.lte:
              return convertedAmount <= o.value!.value!;
          }
        } else {
          return false;
        }
      }
    }
  }

  bool operator >(Object o) => compare(_Comparator.gt, o);
  bool operator >=(Object o) => compare(_Comparator.gte, o);
  bool operator <(Object o) => compare(_Comparator.lt, o);
  bool operator <=(Object o) => compare(_Comparator.lte, o);

  Quantity operator +(Object o) {
    if (o is! Quantity) {
      throw InvalidTypes<Quantity>(
          'A + operator was attemped with an object that was not a Quantity: '
          'instead this was passed $o which is a type ${o.runtimeType}');
    } else if (unit == o.unit) {
      final amount = (value?.value ?? 0) + (o.value?.value ?? 0);
      return Quantity(value: FhirDecimal(amount.toDouble()), unit: unit);
    } else {
      final fromUnit = stringUnitToProperty[o.unit];
      final toUnit = stringUnitToProperty[unit];
      final convertedAmount = o.value?.value?.convertFromTo(fromUnit, toUnit);
      if (convertedAmount == null) {
        throw InvalidTypes<Quantity>(
            'A + operator was attemped with two units types that are not '
            'comparable: $this and $o');
      } else {
        final newAmount = (amount ?? 0) + convertedAmount;
        final index = stringUnitToProperty.values
            .toList()
            .indexWhere((element) => element == toUnit);
        if (index == -1) {
          throw InvalidTypes<Quantity>(
              'A + operator was attemped with an object that did not have a '
              'recognized unit. The given unit was $toUnit');
        } else {
          return this.copyWith(
              value: FhirDecimal(newAmount.toDouble()),
              unit: stringUnitToProperty.keys.toList()[index]);
        }
      }
    }
  }

  Quantity operator -(Object o) {
    if (o is! Quantity) {
      throw InvalidTypes<Quantity>(
          'A + operator was attemped with an object that was not a Quantity: '
          'instead this was passed $o which is a type ${o.runtimeType}');
    } else if (unit == o.unit) {
      final value = (amount ?? 0) - (o.value?.value ?? 0);
      return Quantity(value: FhirDecimal(value), unit: unit);
    } else {
      final fromUnit = stringUnitToProperty[o.unit];
      final toUnit = stringUnitToProperty[unit];
      final convertedAmount = o.value?.value?.convertFromTo(fromUnit, toUnit);
      if (convertedAmount == null) {
        throw InvalidTypes<Quantity>(
            'A + operator was attemped with two units types that are not '
            'comparable: $this and $o');
      } else {
        final newAmount = (amount ?? 0) + convertedAmount;
        final index = stringUnitToProperty.values
            .toList()
            .indexWhere((element) => element == toUnit);
        if (index == -1) {
          throw InvalidTypes<Quantity>(
              'A + operator was attemped with an object that did not have a '
              'recognized unit. The given unit was $toUnit');
        } else {
          return this.copyWith(
              value: FhirDecimal(newAmount.toDouble()),
              unit: stringUnitToProperty.keys.toList()[index]);
        }
      }
    }
  }

  Quantity operator *(Object o) {
    if (o is! Quantity) {
      throw InvalidTypes<Quantity>(
          'A * operator was attemped with an object that was not a Quantity: '
          'instead this was passed $o which is a type ${o.runtimeType}');
    } else if (unit == o.unit) {
      final value = (amount ?? 1) * (o.value?.value ?? 1);
      return Quantity(value: FhirDecimal(value), unit: unit);
    } else {
      // TODO(Dokotela): Should work on being able to multiply these values
      throw InvalidTypes<Quantity>(
          'A * operator was attemped with an object that was not a Quantity: '
          'instead this was passed $o which is a type ${o.runtimeType}');
    }
  }

  Quantity operator /(Object o) {
    if (o is! Quantity) {
      throw InvalidTypes<Quantity>(
          'A / operator was attemped with an object that was not a Quantity: '
          'instead this was passed $o which is a type ${o.runtimeType}');
    } else if (unit == o.unit) {
      final value = (amount ?? 1) / (o.value?.value ?? 1);
      return Quantity(value: FhirDecimal(value), unit: unit);
    } else {
      // TODO(Dokotela): Should work on being able to divide these values
      throw InvalidTypes<Quantity>(
          'A / operator was attemped with an object that was not a Quantity: '
          'instead this was passed $o which is a type ${o.runtimeType}');
    }
  }

  Quantity operator %(Object o) {
    if (o is! Quantity) {
      throw InvalidTypes<Quantity>(
          'A / operator was attemped with an object that was not a Quantity: '
          'instead this was passed $o which is a type ${o.runtimeType}');
    } else if (unit == o.unit) {
      final value = (amount ?? 0) % (o.value?.value ?? 0);
      return Quantity(value: FhirDecimal(value), unit: unit);
    } else {
      // TODO(Dokotela): Should work on being able to % these values
      throw InvalidTypes<Quantity>(
          'A / operator was attemped with an object that was not a Quantity: '
          'instead this was passed $o which is a type ${o.runtimeType}');
    }
  }

  dynamic subtract(dynamic lhs) => add((amount ?? 0) * -1);

  dynamic add(dynamic lhs) {
    if (!(unit == 'year' ||
        unit == 'month' ||
        unit == 'week' ||
        unit == 'day' ||
        unit == 'hour' ||
        unit == 'minute' ||
        unit == 'second' ||
        unit == 'milisecond')) {
      throw Exception(
        'Date & Time additions must be done with the proper units.\n'
        '$lhs + $amount $unit was attempted, this is invalid',
      );
    }
    final yearAmount = (unit == 'year'
            ? amount
            : unit == 'month'
                ? ((amount ?? 0) / 12).truncate()
                : 0)!
        .toInt();
    final monthAmount =
        (unit == 'month' ? (amount ?? 0).remainder(12) : 0).toInt();
    final dayAmount = (unit == 'week'
            ? (amount ?? 0) * 7
            : unit == 'day'
                ? amount
                : 0)!
        .toInt();
    final hourAmount = (unit == 'hour' ? amount : 0)!.toInt();
    final minuteAmount = (unit == 'minute' ? amount : 0)!.toInt();
    final secondAmount = (unit == 'second' ? amount : 0)!.toInt();
    final millisecondAmount = (unit == 'millisecond' ? amount : 0)!.toInt();
    if ((lhs is FhirDate &&
            (hourAmount != 0 ||
                minuteAmount != 0 ||
                secondAmount != 0 ||
                millisecondAmount != 0)) ||
        (lhs is FhirTime &&
            (yearAmount != 0 || monthAmount != 0 || dayAmount != 0))) {
      throw Exception(
        'Date & Time additions must be done with the proper units.\n'
        '$lhs + $amount $unit was attempted, this is invalid',
      );
    }
    if (lhs is FhirDate && lhs.isValid && lhs.value != null) {
      final newDate = DateTime.utc(lhs.value!.year + yearAmount,
          lhs.value!.month + monthAmount, lhs.value!.day + dayAmount);
      if (lhs.precision == DatePrecision.YYYY) {
        return FhirDate(newDate.toString().substring(0, 4));
      } else if (lhs.precision == DatePrecision.YYYYMM) {
        return FhirDate(newDate.toString().substring(0, 7));
      } else {
        return FhirDate(newDate.toString().substring(0, 10));
      }
    } else if (lhs is FhirTime && lhs.isValid && lhs.value != null) {
      final timeList = lhs.value!.split(':');
      final duration = Duration(
        hours: int.tryParse(timeList.first) ?? 0 + hourAmount,
        minutes: (timeList.length > 1 ? int.tryParse(timeList[1]) ?? 0 : 0) +
            minuteAmount,
        seconds: (timeList.length > 2
                ? int.tryParse(timeList[2].split('.').first) ?? 0
                : 0) +
            secondAmount,
        milliseconds: (timeList.length > 2 && timeList[2].split('.').length > 1
                ? int.tryParse(timeList[2].split('.').last) ?? 0
                : 0) +
            millisecondAmount,
      );
      final durationList = duration.toString().split(':');
      durationList.first =
          int.parse(durationList.first).remainder(24).toString();
      return FhirTime(durationList.join(':'));
    } else if (lhs is FhirDateTime && lhs.isValid && lhs.value != null) {
      final oldDateTime = lhs.value!;
      final newDateTime = DateTime.utc(
        oldDateTime.year + yearAmount,
        oldDateTime.month + monthAmount,
        oldDateTime.day + dayAmount,
        oldDateTime.hour + hourAmount,
        oldDateTime.minute + minuteAmount,
        oldDateTime.second + secondAmount,
        oldDateTime.millisecond + millisecondAmount,
      );
      if (lhs.precision == DateTimePrecision.YYYY) {
        return FhirDateTime(newDateTime.toIso8601String().substring(0, 4));
      } else if (lhs.precision == DateTimePrecision.YYYYMM) {
        return FhirDateTime(newDateTime.toIso8601String().substring(0, 7));
      } else if (lhs.precision == DateTimePrecision.YYYYMMDD) {
        return FhirDateTime(newDateTime.toIso8601String().substring(0, 10));
      } else {
        return FhirDateTime(newDateTime);
      }
    }
  }

  @override
  Element? get codeElement => codeElement;

  @override
  QuantityComparator? get comparator => comparator;

  @override
  Element? get comparatorElement => comparatorElement;

  @override
  List<FhirExtension>? get extension_ => extension_;

  @override
  String? get fhirId => fhirId;

  @override
  Element? get systemElement => systemElement;

  @override
  Map<String, dynamic> toJson() => toJson();

  @override
  String toJsonString() => toJsonString();

  @override
  String toYaml() => toYaml();

  @override
  Element? get unitElement => unitElement;

  @override
  Element? get valueElement => valueElement;
}

enum _Comparator { gt, gte, lt, lte }

/// Validating function. First checks if passed value is a Quantity or a
/// Quantity from any type of FHIR version. If not, it  checks if it is a Map
/// that contains both a numerical value, as well as a unit as defined by the [UCUM]
/// specification (https://hl7.org/fhirpath/#UCUM), as long as it meets these requirements
/// it is considered a valid Quantity for FHIRPath (https://hl7.org/fhirpath/#quantity)
bool isQuantity(value) => value is Quantity
    ? true
    : value is Map
        ? value['value'] != null &&
            num.tryParse(value['value'].toString()) != null &&
            value['code'] != null &&
            unitCode.contains(value['code'])
        : false;
