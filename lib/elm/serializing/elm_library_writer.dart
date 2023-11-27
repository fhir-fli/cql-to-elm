import '../../cql_lm/cql_lm.dart';
import 'serializing.dart';

abstract class ElmLibraryWriter {
  void write(ElmLibrary library, Writer writer);

  String writeAsString(ElmLibrary library);
}
