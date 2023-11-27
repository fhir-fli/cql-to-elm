import 'cql_model.dart';

class ChoiceType extends DataType {
  final List<DataType> _types = [];

  ChoiceType(Iterable<DataType> types) : super(null) {
    for (var type in types) {
      _addType(type);
    }
  }

  Iterable<DataType> get types => _types;

  void _addType(DataType type) {
    if (type is ChoiceType) {
      final choiceType = type;
      for (var choice in choiceType.types) {
        _addType(choice);
      }
    } else {
      _types.add(type);
    }
  }

  @override
  int get hashCode {
    var result = 13;
    for (var type in _types) {
      result += (37 * type.hashCode);
    }
    return result;
  }

  @override
  bool operator ==(Object other) {
    if (other is ChoiceType) {
      final that = other;

      if (_types.length == that.types.length) {
        for (var i = 0; i < _types.length; i++) {
          if (_types[i] != that.types.elementAt(i)) {
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
    return super.isSubTypeOf(other);
  }

  bool isSubSetOf(ChoiceType other) {
    for (var type in _types) {
      var currentIsSubType = false;
      for (var otherType in other.types) {
        currentIsSubType = type.isSubTypeOf(otherType);
        if (currentIsSubType) {
          break;
        }
      }
      if (!currentIsSubType) {
        return false;
      }
    }
    return true;
  }

  @override
  bool isSuperTypeOf(DataType other) {
    return super.isSuperTypeOf(other);
  }

  bool isSuperSetOf(ChoiceType other) {
    return other.isSubSetOf(this);
  }

  @override
  bool isCompatibleWith(DataType other) {
    if (other is ChoiceType) {
      return this.isSubSetOf(other) || this.isSuperSetOf(other);
    }

    for (var type in _types) {
      if (other.isCompatibleWith(type)) {
        return true;
      }
    }
    return super.isCompatibleWith(other);
  }

  @override
  String toString() {
    final sb = StringBuffer();
    sb.write('choice<');
    var first = true;
    for (var type in _types) {
      if (!first) {
        sb.write(',');
      } else {
        first = false;
      }
      sb.write(type.toString());
    }
    sb.write('>');
    return sb.toString();
  }

  @override
  bool isGeneric() {
    for (var type in _types) {
      if (type.isGeneric()) {
        return true;
      }
    }
    return false;
  }

  @override
  bool isInstantiable(DataType callType, InstantiationContext context) {
    return isSuperTypeOf(callType);
  }

  @override
  DataType instantiate(InstantiationContext context) {
    return this;
  }
}
