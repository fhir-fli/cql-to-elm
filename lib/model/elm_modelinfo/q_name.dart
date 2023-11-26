class QName {
  final String namespaceURI;
  final String localPart;
  final String prefix;

  QName(this.namespaceURI, this.localPart, [this.prefix = ""]);

  factory QName.fromLocalPart(String localPart) {
    return QName("", localPart, "");
  }

  @override
  bool operator ==(Object objectToTest) {
    if (objectToTest == this) {
      return true;
    } else if (objectToTest is QName) {
      QName qName = objectToTest;
      return localPart == qName.localPart && namespaceURI == qName.namespaceURI;
    } else {
      return false;
    }
  }

  @override
  int get hashCode {
    return namespaceURI.hashCode ^ localPart.hashCode;
  }

  @override
  String toString() {
    return namespaceURI.isEmpty ? localPart : "{$namespaceURI}$localPart";
  }

  static QName valueOf(String qNameAsString) {
    if (qNameAsString.isEmpty) {
      throw ArgumentError("cannot create QName from \"null\" or \"\" String");
    } else if (qNameAsString.startsWith("{") == false) {
      return QName("", qNameAsString, "");
    } else if (qNameAsString.startsWith("{}")) {
      throw ArgumentError(
          'Namespace URI .equals(XMLConstants.NULL_NS_URI), .equals(""), only '
          'the local part, "${qNameAsString.substring(2 + ''.length)}", should be provided.');
    } else {
      final endOfNamespaceURI = qNameAsString.indexOf('}');
      if (endOfNamespaceURI == -1) {
        throw ArgumentError(
            'cannot create QName from "$qNameAsString", missing closing "}"');
      } else {
        return QName(qNameAsString.substring(1, endOfNamespaceURI),
            qNameAsString.substring(endOfNamespaceURI + 1), "");
      }
    }
  }
}
