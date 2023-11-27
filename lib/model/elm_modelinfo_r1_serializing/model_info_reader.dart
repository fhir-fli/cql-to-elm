import 'dart:io';

import '../../cql_lm/cql_lm.dart';

abstract class ModelInfoReader {
  ModelInfo readFromFile(File src);

  ModelInfo readFromInputStream(Stream src);

  ModelInfo readFromUrl(Uri url);

  ModelInfo readFromUri(Uri uri);

  ModelInfo readFromString(String string);
}
