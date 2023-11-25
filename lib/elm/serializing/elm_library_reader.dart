import 'dart:io';

import '../../model/model.dart';

abstract class ElmLibraryReader {
  Library readFromFile(File file);

  Library readFromUrl(Uri url);

  Library readFromUri(Uri uri);

  Library readFromString(String string);

  Library readFromInputStream(Stream inputStream);
}
