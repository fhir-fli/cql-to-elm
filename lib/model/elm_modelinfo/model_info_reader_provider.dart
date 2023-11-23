import 'elm_modelinfo.dart';

abstract class ModelInfoReaderProvider {
  ModelInfoReader create(String contentType);
}
