import '../../model/model.dart';
import 'serializing.dart';

abstract class ElmLibraryWriter {
  void write(Library library, Writer writer);

  String writeAsString(Library library);
}
