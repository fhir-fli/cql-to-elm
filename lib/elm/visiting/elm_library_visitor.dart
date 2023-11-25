import '../../model/model.dart';
import 'visiting.dart';

abstract class ElmLibraryVisitor<T, C> extends ElmClinicalVisitor<T, C> {
  T visitLibrary(Library elm, C context);
  T visitUsingDef(UsingDef elm, C context);
  T visitIncludeDef(IncludeDef elm, C context);
  T visitContextDef(ContextDef elm, C context);
}
