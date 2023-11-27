import 'cql_model.dart';

class TypeParameter extends DataType {
  String identifier;
  TypeParameterConstraint constraint = TypeParameterConstraint.NONE;
  DataType? constraintType;

  TypeParameter(this.identifier) : super(null) {
    if (identifier.isEmpty) {
      throw ArgumentError('identifier is null');
    }
  }

  TypeParameter.withConstraint(
    this.identifier,
    this.constraint,
    this.constraintType,
  ) : super(constraintType?.baseType) {
    if (identifier.isEmpty) {
      throw ArgumentError('identifier is null');
    }
  }

  String getIdentifier() {
    return identifier;
  }

  TypeParameterConstraint getConstraint() {
    return constraint;
  }

  DataType? getConstraintType() {
    return constraintType;
  }

  bool canBind(DataType callType) {
    switch (constraint) {
      case TypeParameterConstraint.CHOICE:
        return callType is ChoiceType;
      case TypeParameterConstraint.TUPLE:
        return callType is TupleType;
      case TypeParameterConstraint.INTERVAL:
        return callType is IntervalType;
      case TypeParameterConstraint.CLASS:
        return callType is ClassType;
      case TypeParameterConstraint.VALUE:
        return callType is SimpleType && callType != DataType.ANY;
      case TypeParameterConstraint.TYPE:
        return callType.isSubTypeOf(constraintType!);
      case TypeParameterConstraint.NONE:
      default:
        return true;
    }
  }

  @override
  int get hashCode {
    return identifier.hashCode;
  }

  @override
  bool operator ==(Object o) {
    if (o is TypeParameter) {
      TypeParameter that = o;
      return this.identifier == that.identifier;
    }
    return false;
  }

  @override
  String toString() {
    return identifier;
  }

  @override
  bool isGeneric() {
    return true;
  }

  @override
  bool isInstantiable(DataType callType, InstantiationContext context) {
    return context.isInstantiable(this, callType);
  }

  @override
  DataType instantiate(InstantiationContext context) {
    return context.instantiate(this);
  }
}

enum TypeParameterConstraint {
  NONE,
  CLASS,
  VALUE,
  TUPLE,
  INTERVAL,
  CHOICE,
  TYPE,
}
