// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Element _$ElementFromJson(Map<String, dynamic> json) => Element();

Map<String, dynamic> _$ElementToJson(Element instance) => <String, dynamic>{};

Any _$AnyFromJson(Map<String, dynamic> json) => Any();

Map<String, dynamic> _$AnyToJson(Any instance) => <String, dynamic>{};

Boolean _$BooleanFromJson(Map<String, dynamic> json) => Boolean(
      json['value'] as bool,
    );

Map<String, dynamic> _$BooleanToJson(Boolean instance) => <String, dynamic>{
      'value': instance.value,
    };

Code _$CodeFromJson(Map<String, dynamic> json) => Code(
      code: json['code'] as String,
      display: json['display'] as String?,
      system: json['system'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$CodeToJson(Code instance) {
  final val = <String, dynamic>{
    'code': instance.code,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('display', instance.display);
  writeNotNull('system', instance.system);
  writeNotNull('version', instance.version);
  return val;
}

Concept _$ConceptFromJson(Map<String, dynamic> json) => Concept(
      codes: (json['codes'] as List<dynamic>)
          .map((e) => Code.fromJson(e as Map<String, dynamic>))
          .toList(),
      display: json['display'] as String?,
    );

Map<String, dynamic> _$ConceptToJson(Concept instance) {
  final val = <String, dynamic>{
    'codes': instance.codes.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('display', instance.display);
  return val;
}

Date _$DateFromJson(Map<String, dynamic> json) => Date(
      json['value'] as String,
    );

Map<String, dynamic> _$DateToJson(Date instance) => <String, dynamic>{
      'value': instance.value,
    };

DateTime _$DateTimeFromJson(Map<String, dynamic> json) => DateTime(
      json['value'] as String,
    );

Map<String, dynamic> _$DateTimeToJson(DateTime instance) => <String, dynamic>{
      'value': instance.value,
    };

Decimal _$DecimalFromJson(Map<String, dynamic> json) => Decimal(
      (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$DecimalToJson(Decimal instance) => <String, dynamic>{
      'value': instance.value,
    };

Integer _$IntegerFromJson(Map<String, dynamic> json) => Integer(
      json['value'] as int,
    );

Map<String, dynamic> _$IntegerToJson(Integer instance) => <String, dynamic>{
      'value': instance.value,
    };

Quantity _$QuantityFromJson(Map<String, dynamic> json) => Quantity(
      value: Decimal.fromJson(json['value'] as Map<String, dynamic>),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$QuantityToJson(Quantity instance) {
  final val = <String, dynamic>{
    'value': instance.value.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('unit', instance.unit);
  return val;
}

Ratio _$RatioFromJson(Map<String, dynamic> json) => Ratio(
      numerator: Quantity.fromJson(json['numerator'] as Map<String, dynamic>),
      denominator:
          Quantity.fromJson(json['denominator'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RatioToJson(Ratio instance) => <String, dynamic>{
      'numerator': instance.numerator.toJson(),
      'denominator': instance.denominator.toJson(),
    };

StringElm _$StringElmFromJson(Map<String, dynamic> json) => StringElm(
      json['value'] as String,
    );

Map<String, dynamic> _$StringElmToJson(StringElm instance) => <String, dynamic>{
      'value': instance.value,
    };

Time _$TimeFromJson(Map<String, dynamic> json) => Time(
      json['value'] as String?,
    );

Map<String, dynamic> _$TimeToJson(Time instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('value', instance.value);
  return val;
}

Interval _$IntervalFromJson(Map<String, dynamic> json) => Interval(
      lowClosed: json['lowClosed'] == null
          ? null
          : Boolean.fromJson(json['lowClosed'] as Map<String, dynamic>),
      highClosed: json['highClosed'] == null
          ? null
          : Boolean.fromJson(json['highClosed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IntervalToJson(Interval instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lowClosed', instance.lowClosed?.toJson());
  writeNotNull('highClosed', instance.highClosed?.toJson());
  return val;
}

IntegerInterval _$IntegerIntervalFromJson(Map<String, dynamic> json) =>
    IntegerInterval(
      low: json['low'] == null
          ? null
          : Integer.fromJson(json['low'] as Map<String, dynamic>),
      high: json['high'] == null
          ? null
          : Integer.fromJson(json['high'] as Map<String, dynamic>),
    )
      ..lowClosed = json['lowClosed'] == null
          ? null
          : Boolean.fromJson(json['lowClosed'] as Map<String, dynamic>)
      ..highClosed = json['highClosed'] == null
          ? null
          : Boolean.fromJson(json['highClosed'] as Map<String, dynamic>);

Map<String, dynamic> _$IntegerIntervalToJson(IntegerInterval instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lowClosed', instance.lowClosed?.toJson());
  writeNotNull('highClosed', instance.highClosed?.toJson());
  writeNotNull('low', instance.low?.toJson());
  writeNotNull('high', instance.high?.toJson());
  return val;
}

DecimalInterval _$DecimalIntervalFromJson(Map<String, dynamic> json) =>
    DecimalInterval(
      low: json['low'] == null
          ? null
          : Decimal.fromJson(json['low'] as Map<String, dynamic>),
      high: json['high'] == null
          ? null
          : Decimal.fromJson(json['high'] as Map<String, dynamic>),
    )
      ..lowClosed = json['lowClosed'] == null
          ? null
          : Boolean.fromJson(json['lowClosed'] as Map<String, dynamic>)
      ..highClosed = json['highClosed'] == null
          ? null
          : Boolean.fromJson(json['highClosed'] as Map<String, dynamic>);

Map<String, dynamic> _$DecimalIntervalToJson(DecimalInterval instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lowClosed', instance.lowClosed?.toJson());
  writeNotNull('highClosed', instance.highClosed?.toJson());
  writeNotNull('low', instance.low?.toJson());
  writeNotNull('high', instance.high?.toJson());
  return val;
}

QuantityInterval _$QuantityIntervalFromJson(Map<String, dynamic> json) =>
    QuantityInterval(
      low: json['low'] == null
          ? null
          : Quantity.fromJson(json['low'] as Map<String, dynamic>),
      high: json['high'] == null
          ? null
          : Quantity.fromJson(json['high'] as Map<String, dynamic>),
    )
      ..lowClosed = json['lowClosed'] == null
          ? null
          : Boolean.fromJson(json['lowClosed'] as Map<String, dynamic>)
      ..highClosed = json['highClosed'] == null
          ? null
          : Boolean.fromJson(json['highClosed'] as Map<String, dynamic>);

Map<String, dynamic> _$QuantityIntervalToJson(QuantityInterval instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lowClosed', instance.lowClosed?.toJson());
  writeNotNull('highClosed', instance.highClosed?.toJson());
  writeNotNull('low', instance.low?.toJson());
  writeNotNull('high', instance.high?.toJson());
  return val;
}

DateInterval _$DateIntervalFromJson(Map<String, dynamic> json) => DateInterval(
      low: json['low'] == null
          ? null
          : Date.fromJson(json['low'] as Map<String, dynamic>),
      high: json['high'] == null
          ? null
          : Date.fromJson(json['high'] as Map<String, dynamic>),
    )
      ..lowClosed = json['lowClosed'] == null
          ? null
          : Boolean.fromJson(json['lowClosed'] as Map<String, dynamic>)
      ..highClosed = json['highClosed'] == null
          ? null
          : Boolean.fromJson(json['highClosed'] as Map<String, dynamic>);

Map<String, dynamic> _$DateIntervalToJson(DateInterval instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lowClosed', instance.lowClosed?.toJson());
  writeNotNull('highClosed', instance.highClosed?.toJson());
  writeNotNull('low', instance.low?.toJson());
  writeNotNull('high', instance.high?.toJson());
  return val;
}

DateTimeInterval _$DateTimeIntervalFromJson(Map<String, dynamic> json) =>
    DateTimeInterval(
      low: json['low'] == null
          ? null
          : DateTime.fromJson(json['low'] as Map<String, dynamic>),
      high: json['high'] == null
          ? null
          : DateTime.fromJson(json['high'] as Map<String, dynamic>),
    )
      ..lowClosed = json['lowClosed'] == null
          ? null
          : Boolean.fromJson(json['lowClosed'] as Map<String, dynamic>)
      ..highClosed = json['highClosed'] == null
          ? null
          : Boolean.fromJson(json['highClosed'] as Map<String, dynamic>);

Map<String, dynamic> _$DateTimeIntervalToJson(DateTimeInterval instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lowClosed', instance.lowClosed?.toJson());
  writeNotNull('highClosed', instance.highClosed?.toJson());
  writeNotNull('low', instance.low?.toJson());
  writeNotNull('high', instance.high?.toJson());
  return val;
}

TimeInterval _$TimeIntervalFromJson(Map<String, dynamic> json) => TimeInterval(
      low: json['low'] == null
          ? null
          : Time.fromJson(json['low'] as Map<String, dynamic>),
      high: json['high'] == null
          ? null
          : Time.fromJson(json['high'] as Map<String, dynamic>),
    )
      ..lowClosed = json['lowClosed'] == null
          ? null
          : Boolean.fromJson(json['lowClosed'] as Map<String, dynamic>)
      ..highClosed = json['highClosed'] == null
          ? null
          : Boolean.fromJson(json['highClosed'] as Map<String, dynamic>);

Map<String, dynamic> _$TimeIntervalToJson(TimeInterval instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lowClosed', instance.lowClosed?.toJson());
  writeNotNull('highClosed', instance.highClosed?.toJson());
  writeNotNull('low', instance.low?.toJson());
  writeNotNull('high', instance.high?.toJson());
  return val;
}
