import 'cql_model.dart';

class ListType extends DataType {
  final DataType elementType;

  ListType(this.elementType) : super(elementType.baseType);

  @override
  int get hashCode => 67 * elementType.hashCode;

  DataType getElementType() {
    return this.elementType;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ListType && elementType == o.elementType;
  }

  @override
  bool isSubTypeOf(DataType other) {
    if (other is ListType) {
      return elementType.isSubTypeOf(other.elementType);
    }
    return super.isSubTypeOf(other);
  }

  @override
  bool isSuperTypeOf(DataType other) {
    if (other is ListType) {
      return elementType.isSuperTypeOf(other.elementType);
    }
    return super.isSuperTypeOf(other);
  }

  @override
  String toString() => 'list<$elementType>';

  @override
  String toLabel() => 'List of $elementType';

  @override
  bool isGeneric() => elementType.isGeneric();

  @override
  bool isInstantiable(DataType callType, InstantiationContext context) {
    if (callType is ListType) {
      final listType = callType;
      return elementType.isInstantiable(listType.elementType, context);
    }

    var isAlreadyInstantiable = false;
    for (var targetListType in context.getListConversionTargets(callType)) {
      final isInstantiable =
          elementType.isInstantiable(targetListType.elementType, context);
      if (isInstantiable) {
        if (isAlreadyInstantiable) {
          throw ArgumentError(
              'Ambiguous generic instantiation involving $callType to $targetListType.');
        }
        isAlreadyInstantiable = true;
      }
    }

    return isAlreadyInstantiable;
  }

  @override
  DataType instantiate(InstantiationContext context) {
    return ListType(elementType.instantiate(context));
  }
}
