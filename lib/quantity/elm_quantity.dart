// ignore_for_file: annotate_overrides, noop_primitive_operations, avoid_equals_and_hash_code_on_mutable_classes, library_private_types_in_public_api, avoid_bool_literals_in_conditional_expressions

// Package imports:
import 'package:fhir/r4.dart';
import 'package:units_converter/units_converter.dart';

// Project imports:
import 'duration_code.dart';
import 'ratios.dart' as unitRatios;
import 'string_unit_to_property.dart';

extension ElmQuantity on Quantity {
  Quantity fromString(String quantityString) {
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

      return Quantity(
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
  double? getValue() => amount?.toDouble();
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
          return thisAmount?.toString().convertFromTo(from, to).convertFromTo(
                  fromUnit as NUMERAL_SYSTEMS, toUnit as NUMERAL_SYSTEMS) ==
              thatAmount;
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
          final convertedAmount = thisAmount?.convertRatioFromTo(
              fromUnit as unitRatios.Ratio, toUnit as unitRatios.Ratio);

          if (convertedAmount != null) {
            if (o.amount == null) {
              return false;
            }
            switch (comparator) {
              case _Comparator.gt:
                return convertedAmount > o.amount!;
              case _Comparator.gte:
                return convertedAmount >= o.amount!;
              case _Comparator.lt:
                return convertedAmount < o.amount!;
              case _Comparator.lte:
                return convertedAmount <= o.amount!;
            }
          } else {
            return false;
          }
        }
      } else {
        final convertedAmount = amount.convertFromTo(fromUnit, toUnit);
        if (convertedAmount != null) {
          switch (comparator) {
            case _Comparator.gt:
              return convertedAmount > o.amount;
            case _Comparator.gte:
              return convertedAmount >= o.amount;
            case _Comparator.lt:
              return convertedAmount < o.amount;
            case _Comparator.lte:
              return convertedAmount <= o.amount;
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

  ElmQuantity operator +(Object o) {
    if (o is! ElmQuantity) {
      throw primitives.InvalidTypes<ElmQuantity>(
          'A + operator was attemped with an object that was not a ElmQuantity: '
          'instead this was passed $o which is a type ${o.runtimeType}');
    } else if (unit == o.unit) {
      final value = amount + o.amount;
      return ElmQuantity(value, unit);
    } else {
      final fromUnit = stringUnitToProperty[o.unit];
      final toUnit = stringUnitToProperty[unit];
      final convertedAmount = o.amount.convertFromTo(fromUnit, toUnit);
      if (convertedAmount == null) {
        throw primitives.InvalidTypes<ElmQuantity>(
            'A + operator was attemped with two units types that are not '
            'comparable: $this and $o');
      } else {
        amount = amount + convertedAmount;
        return this;
      }
    }
  }

  ElmQuantity operator -(Object o) {
    if (o is! ElmQuantity) {
      throw primitives.InvalidTypes<ElmQuantity>(
          'A + operator was attemped with an object that was not a ElmQuantity: '
          'instead this was passed $o which is a type ${o.runtimeType}');
    } else if (unit == o.unit) {
      final value = amount - o.amount;
      return ElmQuantity(value, unit);
    } else {
      final fromUnit = stringUnitToProperty[o.unit];
      final toUnit = stringUnitToProperty[unit];
      final convertedAmount = o.amount.convertFromTo(fromUnit, toUnit);
      if (convertedAmount == null) {
        throw primitives.InvalidTypes<ElmQuantity>(
            'A + operator was attemped with two units types that are not '
            'comparable: $this and $o');
      } else {
        amount = amount - convertedAmount;
        return this;
      }
    }
  }

  ElmQuantity operator *(Object o) {
    if (o is! ElmQuantity) {
      throw primitives.InvalidTypes<ElmQuantity>(
          'A * operator was attemped with an object that was not a ElmQuantity: '
          'instead this was passed $o which is a type ${o.runtimeType}');
    } else if (unit == o.unit) {
      final value = amount * o.amount;
      return ElmQuantity(value, unit);
    } else {
      // TODO(Dokotela): Should work on being able to multiply these values
      throw primitives.InvalidTypes<ElmQuantity>(
          'A * operator was attemped with an object that was not a ElmQuantity: '
          'instead this was passed $o which is a type ${o.runtimeType}');
    }
  }

  ElmQuantity operator /(Object o) {
    if (o is! ElmQuantity) {
      throw primitives.InvalidTypes<ElmQuantity>(
          'A / operator was attemped with an object that was not a ElmQuantity: '
          'instead this was passed $o which is a type ${o.runtimeType}');
    } else if (unit == o.unit) {
      final value = amount / o.amount;
      return ElmQuantity(value, unit);
    } else {
      // TODO(Dokotela): Should work on being able to divide these values
      throw primitives.InvalidTypes<ElmQuantity>(
          'A / operator was attemped with an object that was not a ElmQuantity: '
          'instead this was passed $o which is a type ${o.runtimeType}');
    }
  }

  ElmQuantity operator %(Object o) {
    if (o is! ElmQuantity) {
      throw primitives.InvalidTypes<ElmQuantity>(
          'A / operator was attemped with an object that was not a ElmQuantity: '
          'instead this was passed $o which is a type ${o.runtimeType}');
    } else if (unit == o.unit) {
      final value = amount % o.amount;
      return ElmQuantity(value, unit);
    } else {
      // TODO(Dokotela): Should work on being able to % these values
      throw primitives.InvalidTypes<ElmQuantity>(
          'A / operator was attemped with an object that was not a ElmQuantity: '
          'instead this was passed $o which is a type ${o.runtimeType}');
    }
  }

  dynamic subtract(dynamic lhs) {
    amount = amount * -1;
    final returnValue = add(lhs);
    amount = amount * -1;
    return returnValue;
  }

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
                ? (amount / 12).truncate()
                : 0)
        .toInt();
    final monthAmount = (unit == 'month' ? amount.remainder(12) : 0).toInt();
    final dayAmount = (unit == 'week'
            ? amount * 7
            : unit == 'day'
                ? amount
                : 0)
        .toInt();
    final hourAmount = (unit == 'hour' ? amount : 0).toInt();
    final minuteAmount = (unit == 'minute' ? amount : 0).toInt();
    final secondAmount = (unit == 'second' ? amount : 0).toInt();
    final millisecondAmount = (unit == 'millisecond' ? amount : 0).toInt();
    if ((lhs is primitives.FhirDate &&
            (hourAmount != 0 ||
                minuteAmount != 0 ||
                secondAmount != 0 ||
                millisecondAmount != 0)) ||
        (lhs is primitives.FhirTime &&
            (yearAmount != 0 || monthAmount != 0 || dayAmount != 0))) {
      throw Exception(
        'Date & Time additions must be done with the proper units.\n'
        '$lhs + $amount $unit was attempted, this is invalid',
      );
    }
    if (lhs is primitives.FhirDate && lhs.isValid && lhs.value != null) {
      final newDate = DateTime.utc(lhs.value!.year + yearAmount,
          lhs.value!.month + monthAmount, lhs.value!.day + dayAmount);
      if (lhs.precision == primitives.DatePrecision.YYYY) {
        return primitives.FhirDate(newDate.toString().substring(0, 4));
      } else if (lhs.precision == primitives.DatePrecision.YYYYMM) {
        return primitives.FhirDate(newDate.toString().substring(0, 7));
      } else {
        return primitives.FhirDate(newDate.toString().substring(0, 10));
      }
    } else if (lhs is primitives.FhirTime && lhs.isValid && lhs.value != null) {
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
      return primitives.FhirTime(durationList.join(':'));
    } else if (lhs is primitives.FhirDateTime &&
        lhs.isValid &&
        lhs.value != null) {
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
      if (lhs.precision == primitives.DateTimePrecision.YYYY) {
        return primitives.FhirDateTime(
            newDateTime.toIso8601String().substring(0, 4));
      } else if (lhs.precision == primitives.DateTimePrecision.YYYYMM) {
        return primitives.FhirDateTime(
            newDateTime.toIso8601String().substring(0, 7));
      } else if (lhs.precision == primitives.DateTimePrecision.YYYYMMDD) {
        return primitives.FhirDateTime(
            newDateTime.toIso8601String().substring(0, 10));
      } else {
        return primitives.FhirDateTime(newDateTime);
      }
    }
  }
}

enum _Comparator { gt, gte, lt, lte }

/// Validating function. First checks if passed value is a ElmQuantity or a
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
