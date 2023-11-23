import 'src.dart';

class TupleTypeElement {
  String name;
  DataType type;
  bool oneBased;

  TupleTypeElement(this.name, this.type, [this.oneBased = false]) {
    if (name.isEmpty) {
      throw ArgumentError('name');
    }
  }

  String getName() {
    return name;
  }

  DataType getType() {
    return type;
  }

  @override
  int get hashCode {
    return (17 * name.hashCode) +
        (33 * type.hashCode) +
        (31 * (oneBased ? 1 : 0));
  }

  @override
  bool operator ==(Object o) {
    if (o is TupleTypeElement) {
      TupleTypeElement that = o;
      return name == that.name &&
          type == that.type &&
          oneBased == that.oneBased;
    }
    return false;
  }

  bool isSubTypeOf(TupleTypeElement that) {
    return getName() == that.getName() && getType().isSubTypeOf(that.getType());
  }

  bool isSuperTypeOf(TupleTypeElement that) {
    return getName() == that.getName() &&
        getType().isSuperTypeOf(that.getType());
  }

  @override
  String toString() {
    return '$name:${type.toString()}';
  }

  String toLabel() {
    return '$name: ${type.toLabel()}';
  }
}
