import 'package:meta/meta.dart';

import 'src.dart';

@immutable
class IntervalType extends DataType {
  final DataType pointType;

  IntervalType(this.pointType) : super(pointType);

  @override
  int get hashCode => 53 * pointType.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is IntervalType) {
      return this.pointType == other.pointType;
    }
    return false;
  }

  DataType getPointType() {
    return this.pointType;
  }

  @override
  bool isSubTypeOf(DataType other) {
    if (other is IntervalType) {
      return this.pointType.isSubTypeOf(other.pointType);
    }
    return super.isSubTypeOf(other);
  }

  @override
  bool isSuperTypeOf(DataType other) {
    if (other is IntervalType) {
      return this.pointType.isSuperTypeOf(other.pointType);
    }
    return super.isSuperTypeOf(other);
  }

  @override
  String toString() => 'interval<$pointType>';

  String toLabel() => 'Interval of ${pointType.toLabel()}';

  @override
  bool isGeneric() => pointType.isGeneric();

  @override
  bool isInstantiable(DataType callType, InstantiationContext context) {
    if (callType is IntervalType) {
      final IntervalType intervalType = callType;
      return pointType.isInstantiable(intervalType.pointType, context);
    }

    bool isAlreadyInstantiable = false;
    for (IntervalType targetIntervalType
        in context.getIntervalConversionTargets(callType)) {
      final isInstantiable =
          pointType.isInstantiable(targetIntervalType.pointType, context);
      if (isInstantiable) {
        if (isAlreadyInstantiable) {
          throw ArgumentError(
              'Ambiguous generic instantiation involving $callType to $targetIntervalType.');
        }
        isAlreadyInstantiable = true;
      }
    }

    return isAlreadyInstantiable;
  }

  @override
  DataType instantiate(InstantiationContext context) =>
      IntervalType(pointType.instantiate(context));
}
