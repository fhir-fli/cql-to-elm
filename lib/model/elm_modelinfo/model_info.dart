class ModelInfo {
  String? name;
  String? version;
  String? url;
  String? schemaLocation;
  String? patientClassName;
  String? patientClassIdentifier;
  String? patientBirthDatePropertyName;
  bool? caseSensitive;
  bool? strictRetrieveTyping;

  ModelInfo({
    this.name,
    this.version,
    this.url,
    this.schemaLocation,
    this.patientClassName,
    this.patientClassIdentifier,
    this.patientBirthDatePropertyName,
    this.caseSensitive,
    this.strictRetrieveTyping,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ModelInfo &&
        other.name == name &&
        other.version == version &&
        other.url == url &&
        other.schemaLocation == schemaLocation &&
        other.patientClassName == patientClassName &&
        other.patientClassIdentifier == patientClassIdentifier &&
        other.patientBirthDatePropertyName == patientBirthDatePropertyName &&
        other.caseSensitive == caseSensitive &&
        other.strictRetrieveTyping == strictRetrieveTyping;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        version.hashCode ^
        url.hashCode ^
        schemaLocation.hashCode ^
        patientClassName.hashCode ^
        patientClassIdentifier.hashCode ^
        patientBirthDatePropertyName.hashCode ^
        caseSensitive.hashCode ^
        strictRetrieveTyping.hashCode;
  }

  @override
  String toString() {
    return 'ModelInfo{requiredModelInfo: name: $name, version: $version, url: $url, '
        'schemaLocation: $schemaLocation, patientClassName: $patientClassName, '
        'patientClassIdentifier: $patientClassIdentifier, '
        'patientBirthDatePropertyName: $patientBirthDatePropertyName, '
        'caseSensitive: $caseSensitive, strictRetrieveTyping: $strictRetrieveTyping}';
  }
}
