import 'src.dart';

class Relationship {
  ModelContext? context;
  List<String> relatedKeys = [];

  Relationship(ModelContext context, Iterable<String> relatedKeys) {
    this.context = context;
    this.relatedKeys.addAll(relatedKeys);
  }

  ModelContext? getContext() {
    return context;
  }

  Iterable<String> getRelatedKeys() {
    return relatedKeys;
  }
}
