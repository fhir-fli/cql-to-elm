import 'elm_modelinfo_r1_serializing.dart';

abstract class ModelInfoReaderProvider {
  ModelInfoReader create(String contentType);
}
