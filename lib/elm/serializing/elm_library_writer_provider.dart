import 'serializing.dart';

abstract class ElmLibraryWriterProvider {
  ElmLibraryWriter create(String contentType);
}
