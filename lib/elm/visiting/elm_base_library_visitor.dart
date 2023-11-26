import 'package:fhir/r4.dart';

import '../../model/model.dart';
import 'visiting.dart';

class ElmBaseLibraryVisitor<T, C> extends ElmBaseClinicalVisitor<T, C>
    implements ElmLibraryVisitor<T, C> {
  @override
  T visitElement(Element elm, C context) {
    if (elm is IncludeDef) return visitIncludeDef(elm, context);
    if (elm is ContextDef) return visitContextDef(elm, context);
    if (elm is Library) return visitLibrary(elm, context);
    if (elm is UsingDef) return visitUsingDef(elm, context);
    return super.visitElement(elm, context);
  }

  T visitLibrary(Library elm, C context) {
    T result = defaultResult(elm, context);
    _visitElements(elm.usings?.def, context);
    _visitElements(elm.includes?.def, context);
    _visitElements(elm.codeSystems?.def, context);
    _visitElements(elm.valueSets?.def, context);
    _visitElements(elm.codes?.def, context);
    _visitElements(elm.concepts?.def, context);
    _visitElements(elm.parameters?.def, context);
    _visitElements(elm.contexts?.def, context);
    _visitElements(elm.statements?.def, context);
    return result;
  }

  T visitUsingDef(UsingDef elm, C context) {
    return defaultResult(elm, context);
  }

  T visitIncludeDef(IncludeDef elm, C context) {
    return defaultResult(elm, context);
  }

  T visitContextDef(ContextDef elm, C context) {
    return defaultResult(elm, context);
  }

  void _visitElements(List<Element>? elements, C context) {
    if (elements != null && elements.isNotEmpty) {
      for (var def in elements) {
        var childResult = visitElement(def, context);
        result = aggregateResult(result, childResult);
      }
    }
  }
}
