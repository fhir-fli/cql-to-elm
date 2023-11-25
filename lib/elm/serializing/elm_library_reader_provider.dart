import 'serializing.dart';

abstract class ElmLibraryReaderProvider {
  ElmLibraryReader create(String contentType);
}
