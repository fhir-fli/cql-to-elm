import 'dart:io';

import '../../cql_lm/cql_lm.dart';
import 'elm_modelinfo_r1_serializing.dart';

class ModelInfoReaderFactory {
  static final List<ModelInfoReaderProvider> _providers = [
    ModelJacksonReaderProvider(),
    ModelJaxbReaderProvider(),
  ];

  static List<ModelInfoReaderProvider> _getProviders() {
    // Simulated refresh behavior, may differ from Java's ServiceLoader.reload()
    return _providers;
  }

  static ModelInfoReader getReader(String contentType) {
    final providers = _getProviders();
    if (providers.isNotEmpty) {
      final provider = providers.first;
      if (providers.length > 1) {
        throw Exception("Multiple ModelInfoReaderProviders found.");
      }
      return provider.create(contentType);
    }

    throw Exception("No ModelInfoReaderProviders found.");
  }
}

class ModelJacksonReaderProvider implements ModelInfoReaderProvider {
  @override
  ModelInfoReader create(String contentType) {
    return JacksonModelInfoReader();
  }
}

class ModelJaxbReaderProvider implements ModelInfoReaderProvider {
  @override
  ModelInfoReader create(String contentType) {
    return JaxbModelInfoReader();
  }
}

class JacksonModelInfoReader implements ModelInfoReader {
  @override
  ModelInfo readFromFile(File src) {
    // Implement reading ModelInfo from File
    throw UnimplementedError();
  }

  @override
  ModelInfo readFromInputStream(Stream src) {
    // Implement reading ModelInfo from InputStream
    throw UnimplementedError();
  }

  @override
  ModelInfo readFromUrl(Uri url) {
    // Implement reading ModelInfo from Url
    throw UnimplementedError();
  }

  @override
  ModelInfo readFromUri(Uri uri) {
    // Implement reading ModelInfo from Uri
    throw UnimplementedError();
  }

  @override
  ModelInfo readFromString(String string) {
    // Implement reading ModelInfo from String
    throw UnimplementedError();
  }
}

class JaxbModelInfoReader implements ModelInfoReader {
  @override
  ModelInfo readFromFile(File src) {
    // Implement reading ModelInfo from File
    throw UnimplementedError();
  }

  @override
  ModelInfo readFromInputStream(Stream src) {
    // Implement reading ModelInfo from InputStream
    throw UnimplementedError();
  }

  @override
  ModelInfo readFromUrl(Uri url) {
    // Implement reading ModelInfo from Url
    throw UnimplementedError();
  }

  @override
  ModelInfo readFromUri(Uri uri) {
    // Implement reading ModelInfo from Uri
    throw UnimplementedError();
  }

  @override
  ModelInfo readFromString(String string) {
    // Implement reading ModelInfo from String
    throw UnimplementedError();
  }
}
