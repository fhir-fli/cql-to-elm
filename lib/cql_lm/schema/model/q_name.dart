import 'package:json_annotation/json_annotation.dart';

part 'q_name.g.dart';

@JsonSerializable()
class QName {
  final String namespaceURI;
  final String localPart;
  final String prefix;

  QName(this.namespaceURI, this.localPart, [this.prefix = ""]);

  factory QName.fromJson(Map<String, dynamic> json) => _$QNameFromJson(json);

  Map<String, dynamic> toJson() => _$QNameToJson(this);

  QName.fromLocalPart(String localPart) : this("", localPart, "");

  bool equals(Object? objectToTest) {
    if (objectToTest == this) {
      return true;
    } else if (objectToTest != null && objectToTest is QName) {
      QName qName = objectToTest;
      return localPart == qName.localPart && namespaceURI == qName.namespaceURI;
    } else {
      return false;
    }
  }

  int get hashCode => namespaceURI.hashCode ^ localPart.hashCode;

  String toString() {
    return namespaceURI == "" ? localPart : "{$namespaceURI}$localPart";
  }

  static QName valueOf(String qNameAsString) {
    if (qNameAsString.isEmpty) {
      throw ArgumentError("cannot create QName from \"null\" or \"\" String");
    } else if (qNameAsString[0] != '{') {
      return QName("", qNameAsString, "");
    } else if (qNameAsString.startsWith("{}")) {
      throw ArgumentError(
          "Namespace URI .equals(XMLConstants.NULL_NS_URI), .equals(\"\"), only the local part, \"${qNameAsString.substring(2 + "".length)}\", should be provided.");
    } else {
      int endOfNamespaceURI = qNameAsString.indexOf('}');
      if (endOfNamespaceURI == -1) {
        throw ArgumentError(
            "cannot create QName from \"$qNameAsString\", missing closing \"}\"");
      } else {
        return QName(
          qNameAsString.substring(1, endOfNamespaceURI),
          qNameAsString.substring(endOfNamespaceURI + 1),
        );
      }
    }
  }
}
