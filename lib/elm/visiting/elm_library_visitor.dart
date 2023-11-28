import '../../cql_lm/cql_lm.dart';
import 'elm_clinical_visitor.dart';

abstract class ElmLibraryVisitor<T, C> extends ElmClinicalVisitor<T, C> {
  T visitLibrary(ElmLibrary elm, C context);
  T visitUsingDef(UsingDef elm, C context);
  T visitIncludeDef(IncludeDef elm, C context);
  T visitContextDef(ContextDef elm, C context);
}
