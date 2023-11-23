import 'src.dart';

class ClassTypeElement {
  String name;
  DataType type;
  bool prohibited;
  bool oneBased;
  String? target;

  ClassTypeElement(
    this.name,
    this.type, {
    bool? prohibited,
    bool? oneBased,
    this.target,
  })  : prohibited = prohibited ?? false,
        oneBased = oneBased ?? false {
    if (name.isEmpty) {
      throw ArgumentError('name');
    }
  }

  ClassTypeElement.simple(this.name, this.type)
      : prohibited = false,
        oneBased = false,
        target = null;

  String getName() {
    return this.name;
  }

  DataType getType() {
    return this.type;
  }

  bool isProhibited() {
    return prohibited;
  }

  bool isOneBased() {
    return oneBased;
  }

  String? getTarget() {
    return target;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }
    if (o is! ClassTypeElement) {
      return false;
    }
    ClassTypeElement that = o;
    return name == that.name &&
        type == that.type &&
        prohibited == that.prohibited &&
        oneBased == that.oneBased &&
        target == that.target;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        type.hashCode ^
        prohibited.hashCode ^
        oneBased.hashCode ^
        target.hashCode;
  }

  bool isSubTypeOf(ClassTypeElement that) {
    return this.getName() == that.getName() &&
        this.getType().isSubTypeOf(that.getType());
  }

  bool isSuperTypeOf(ClassTypeElement that) {
    return this.getName() == that.getName() &&
        this.getType().isSuperTypeOf(that.getType());
  }

  @override
  String toString() {
    return '${this.name}:${this.type.toString()}${this.prohibited ? " (prohibited)" : ""}${this.oneBased ? " (one-based)" : ""}${this.target != null ? " (target: ${this.target})" : ""}';
  }
}
