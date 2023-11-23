import 'src.dart';

class TupleType extends DataType {
  List<TupleTypeElement> elements = [];
  List<TupleTypeElement>? sortedElements;

  TupleType([Iterable<TupleTypeElement>? elements]) : super(null) {
    if (elements != null) {
      this.elements.addAll(elements);
    }
  }

  Iterable<TupleTypeElement> getElements() {
    return elements;
  }

  void addElement(TupleTypeElement element) {
    elements.add(element);
    sortedElements = null;
  }

  void addElements(Iterable<TupleTypeElement> elements) {
    this.elements.addAll(elements);
    sortedElements = null;
  }

  List<TupleTypeElement> getSortedElements() {
    sortedElements ??= List<TupleTypeElement>.from(elements)
      ..sort((left, right) => left.getName().compareTo(right.getName()));
    return sortedElements!;
  }

  @override
  int get hashCode {
    int result = 13;
    for (var element in elements) {
      result += 37 * element.hashCode;
    }
    return result;
  }

  @override
  bool operator ==(Object o) {
    if (o is TupleType) {
      TupleType that = o;
      if (this.elements.length == that.elements.length) {
        var theseElements = this.getSortedElements();
        var thoseElements = that.getSortedElements();
        for (int i = 0; i < theseElements.length; i++) {
          if (theseElements[i] != thoseElements[i]) {
            return false;
          }
        }
        return true;
      }
    }
    return false;
  }

  @override
  bool isSubTypeOf(DataType other) {
    if (other is TupleType) {
      TupleType that = other;
      if (this.elements.length == that.elements.length) {
        var theseElements = this.getSortedElements();
        var thoseElements = that.getSortedElements();
        for (int i = 0; i < theseElements.length; i++) {
          if (!theseElements[i].isSubTypeOf(thoseElements[i])) {
            return false;
          }
        }
        return true;
      }
    }
    return super.isSubTypeOf(other);
  }

  @override
  bool isSuperTypeOf(DataType other) {
    if (other is TupleType) {
      TupleType that = other;
      if (this.elements.length == that.elements.length) {
        var theseElements = this.getSortedElements();
        var thoseElements = that.getSortedElements();
        for (int i = 0; i < theseElements.length; i++) {
          if (!theseElements[i].isSuperTypeOf(thoseElements[i])) {
            return false;
          }
        }
        return true;
      }
    }
    return super.isSuperTypeOf(other);
  }

  @override
  String toString() {
    var builder = StringBuffer();
    builder.write('tuple{');
    for (int i = 0; i < elements.length; i++) {
      if (i > 0) {
        builder.write(',');
      }
      builder.write(elements[i].toString());
    }
    builder.write('}');
    return builder.toString();
  }

  @override
  String toLabel() {
    var builder = StringBuffer();
    builder.write('tuple of ');
    for (int i = 0; i < elements.length; i++) {
      if (i > 0) {
        builder.write(', ');
      }
      builder.write(elements[i].toLabel());
    }
    return builder.toString();
  }

  @override
  bool isCompatibleWith(DataType other) {
    if (other is ClassType) {
      ClassType classType = other;
      return this == classType.getTupleType();
    }
    return super.isCompatibleWith(other);
  }

  @override
  bool isGeneric() {
    for (var e in elements) {
      if (e.getType().isGeneric()) {
        return true;
      }
    }
    return false;
  }

  @override
  bool isInstantiable(DataType callType, InstantiationContext context) {
    if (callType is TupleType) {
      TupleType tupleType = callType;
      if (elements.length == tupleType.elements.length) {
        var theseElements = getSortedElements();
        var thoseElements = tupleType.getSortedElements();
        for (int i = 0; i < theseElements.length; i++) {
          if (theseElements[i].getName() != thoseElements[i].getName() ||
              !theseElements[i]
                  .getType()
                  .isInstantiable(thoseElements[i].getType(), context)) {
            return false;
          }
        }
        return true;
      }
    }
    return false;
  }

  @override
  DataType instantiate(InstantiationContext context) {
    if (!isGeneric()) {
      return this;
    }
    var result = TupleType();
    for (var element in elements) {
      result.addElement(TupleTypeElement(
        element.getName(),
        element.getType().instantiate(context),
      ));
    }
    return result;
  }
}
