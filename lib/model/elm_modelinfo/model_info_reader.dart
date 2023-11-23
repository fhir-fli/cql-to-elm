import 'dart:io';

import 'elm_modelinfo.dart';

abstract class ModelInfoReader {
  ModelInfo readFromFile(File src);

  ModelInfo readFromInputStream(Stream src);

  ModelInfo readFromUrl(Uri url);

  ModelInfo readFromUri(Uri uri);

  ModelInfo readFromString(String string);
}
