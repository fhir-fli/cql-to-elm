import 'cql_model.dart';

class NamespaceManager {
  final Map<String, String> namespaces = {};
  final Map<String, String> reverseNamespaces = {};

  bool get hasNamespaces => namespaces.isNotEmpty;

  void ensureNamespaceRegistered(NamespaceInfo? namespaceInfo) {
    if (namespaceInfo == null) {
      throw ArgumentError('namespaceInfo is required');
    }

    if (!namespaces.containsKey(namespaceInfo.name)) {
      createAndAddNamespace(namespaceInfo.name, namespaceInfo.uri);
    }
  }

  void addNamespace(NamespaceInfo? namespaceInfo) {
    if (namespaceInfo == null) {
      throw ArgumentError('namespaceInfo is required');
    }

    createAndAddNamespace(namespaceInfo.name, namespaceInfo.uri);
  }

  void createAndAddNamespace(String namespaceName, String namespaceUri) {
    if (namespaceName.isEmpty) {
      throw ArgumentError('namespaceName is required');
    }

    if (namespaceUri.isEmpty) {
      throw ArgumentError('namespaceUri is required');
    }

    if (namespaces.containsKey(namespaceName)) {
      throw ArgumentError(
          'A namespace named $namespaceName is already defined.');
    }

    if (reverseNamespaces.containsKey(namespaceUri)) {
      throw ArgumentError(
          'A namespace name for uri $namespaceUri is already defined.');
    }

    namespaces[namespaceName] = namespaceUri;
    reverseNamespaces[namespaceUri] = namespaceName;
  }

  String? resolveNamespaceUri(String namespaceName) {
    return namespaces[namespaceName];
  }

  NamespaceInfo? getNamespaceInfoFromUri(String namespaceUri) {
    if (reverseNamespaces.containsKey(namespaceUri)) {
      return NamespaceInfo(reverseNamespaces[namespaceUri]!, namespaceUri);
    }
    return null;
  }

  static String getPath(String? namespaceUri, String name) {
    return namespaceUri != null ? '$namespaceUri/$name' : name;
  }

  static String? getUriPart(String? namespaceQualifiedName) {
    if (namespaceQualifiedName == null) return null;

    final i = namespaceQualifiedName.lastIndexOf('/');
    return i > 0 ? namespaceQualifiedName.substring(0, i) : null;
  }

  static String? getNamePart(String? namespaceQualifiedName) {
    if (namespaceQualifiedName == null) return null;

    final i = namespaceQualifiedName.lastIndexOf('/');
    return i > 0
        ? namespaceQualifiedName.substring(i + 1)
        : namespaceQualifiedName;
  }
}
