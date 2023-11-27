import '../../cql_lm/cql_lm.dart';
import 'cql_model.dart';

abstract class ModelInfoProvider {
  Future<ModelInfo?> load(ModelIdentifier modelIdentifier);
}
