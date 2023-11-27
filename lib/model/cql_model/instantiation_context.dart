import 'cql_model.dart';

abstract class InstantiationContext {
  bool isInstantiable(TypeParameter parameter, DataType callType);
  DataType instantiate(TypeParameter parameter);
  Iterable<SimpleType> getSimpleConversionTargets(DataType callType);
  Iterable<IntervalType> getIntervalConversionTargets(DataType callType);
  Iterable<ListType> getListConversionTargets(DataType callType);
}
