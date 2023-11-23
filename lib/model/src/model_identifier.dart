class ModelIdentifier {
  String? id;
  String? system;
  String? version;

  String? getId() {
    return id;
  }

  void setId(String value) {
    this.id = value;
  }

  String? getSystem() {
    return system;
  }

  void setSystem(String value) {
    this.system = value;
  }

  String? getVersion() {
    return version;
  }

  void setVersion(String value) {
    this.version = value;
  }

  ModelIdentifier withId(String value) {
    setId(value);
    return this;
  }

  ModelIdentifier withSystem(String value) {
    setSystem(value);
    return this;
  }

  ModelIdentifier withVersion(String value) {
    setVersion(value);
    return this;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ModelIdentifier &&
        id == o.id &&
        system == o.system &&
        version == o.version;
  }

  @override
  int get hashCode => id.hashCode ^ system.hashCode ^ version.hashCode;

  @override
  String toString() {
    return 'ModelIdentifier{id: $id, system: $system, version: $version}';
  }
}
