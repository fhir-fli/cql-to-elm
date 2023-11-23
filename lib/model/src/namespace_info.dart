class NamespaceInfo {
  final String name;
  final String uri;

  NamespaceInfo(this.name, this.uri) {
    if (name.isEmpty) {
      throw ArgumentError('Name is required');
    }
    if (uri.isEmpty) {
      throw ArgumentError('Uri is required');
    }
  }

  @override
  int get hashCode => 17 * name.hashCode ^ 39 * uri.hashCode;

  @override
  bool operator ==(Object other) {
    return other is NamespaceInfo &&
        this.name == other.name &&
        this.uri == other.uri;
  }

  @override
  String toString() {
    return '$name: $uri';
  }
}
