import 'cql_model.dart';

class ModelContext {
  final String name;
  final ClassType type;
  final String birthDateElement;
  final List<String> keys;

  ModelContext(
      this.name, this.type, Iterable<String>? keys, this.birthDateElement)
      : keys = List<String>.from(keys ?? <String>[]);
}
