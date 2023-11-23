import '../elm_modelinfo/elm_modelinfo.dart';
import 'src.dart';

abstract class ModelInfoProvider {
  Future<ModelInfo?> load(ModelIdentifier modelIdentifier);
}
