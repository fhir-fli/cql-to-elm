import 'dart:io';

import '../../cql_lm/cql_lm.dart';

abstract class ElmLibraryReader {
  ElmLibrary readFromFile(File file);

  ElmLibrary readFromUrl(Uri url);

  ElmLibrary readFromUri(Uri uri);

  ElmLibrary readFromString(String string);

  ElmLibrary readFromInputStream(Stream inputStream);
}
