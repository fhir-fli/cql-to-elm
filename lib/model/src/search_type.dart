import 'src.dart';

class SearchType {
  String name;
  String path;
  DataType type;

  SearchType(this.name, this.path, this.type)
      : assert(name.isNotEmpty, 'A name is required to construct a Search'),
        assert(path.isNotEmpty, 'A path is required to construct a Search');

  String getName() {
    return name;
  }

  String getPath() {
    return path;
  }

  DataType getType() {
    return type;
  }
}
