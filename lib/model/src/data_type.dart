import 'src.dart';

class DataType {
  static final SimpleType ANY = SimpleType('System.Any');

  DataType(this.baseType);

  final DataType? baseType;

  DataType? getBaseType() {
    return baseType;
  }

  String toLabel() {
    return toString();
  }

  bool isSubTypeOf(DataType other) {
    DataType? currentType = this;
    while (currentType != null) {
      if (currentType == other) {
        return true;
      }
      currentType = currentType.baseType;
    }
    return false;
  }

  bool isSuperTypeOf(DataType other) {
    DataType? temp = other;
    while (temp != null) {
      if (this == temp) {
        return true;
      }
      temp = temp.baseType;
    }
    return false;
  }

  DataType? getCommonSuperTypeOf(DataType other) {
    DataType? currentType = this;
    while (currentType != null) {
      if (currentType.isSuperTypeOf(other)) {
        return currentType;
      }
      currentType = currentType.baseType;
    }
    return null;
  }

  bool isCompatibleWith(DataType other) {
    if (other is ChoiceType) {
      for (var choice in other.types) {
        if (this.isSubTypeOf(choice)) {
          return true;
        }
      }
    }
    return this == other;
  }

  bool isGeneric() {
    // Abstract method implementation
    return false;
  }

  bool isInstantiable(DataType callType, InstantiationContext context) {
    // Abstract method implementation
    return false;
  }

  DataType instantiate(InstantiationContext context) {
    // Abstract method implementation
    return this;
  }
}
