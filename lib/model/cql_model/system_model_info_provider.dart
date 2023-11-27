// This translation assumes similar functionality in Dart; adjust as needed.
import 'dart:io';

import 'package:xml/xml.dart';

import '../../cql_lm/cql_lm.dart';
import '../model.dart';

class SystemModelInfoProvider implements ModelInfoProvider {
  NamespaceManager? namespaceManager;

  void setNamespaceManager(NamespaceManager manager) {
    this.namespaceManager = manager;
  }

  bool isSystemModelIdentifier(ModelIdentifier modelIdentifier) {
    if (namespaceManager != null && namespaceManager!.hasNamespaces) {
      return modelIdentifier.getId() == 'System' &&
          (modelIdentifier.getSystem() == null ||
              modelIdentifier.getSystem() == 'urn:hl7-org:elm-types:r1');
    }

    return modelIdentifier.getId() == 'System';
  }

  Future<ModelInfo?> load(ModelIdentifier modelIdentifier) async {
    if (isSystemModelIdentifier(modelIdentifier)) {
      try {
        return ModelInfoReaderFactory.getReader('application/xml')
            .readFromString(
                (await readXmlFile('/org/hl7/elm/r1/system-modelinfo.xml')
                    .toString()));
      } catch (e) {
        if (e is IOException) {
          print(e);
        }
        // Do not throw, allow other providers to resolve
        // throw new IllegalArgumentException(
        //   "Unknown version ${localVersion} of the System model."
        // );
      }
    }
    return null;
  }
}

// Function to read XML file
Future<XmlDocument> readXmlFile(String filePath) async {
  try {
    final File file = File(filePath);
    if (!(await file.exists())) {
      throw FileSystemException("File not found");
    }

    final contents = await file.readAsString();
    return XmlDocument.parse(contents);
  } catch (e) {
    print("Error reading XML file: $e");
    rethrow;
  }
}
