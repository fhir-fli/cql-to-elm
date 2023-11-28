import 'package:cql_to_elm/cql_lm/cql_lm.dart';
import 'package:fhir/r4.dart';

import '../../quantity/quantity.dart';
import 'visiting.dart';

class ElmBaseClinicalVisitor<T, C> extends ElmBaseVisitor<T, C>
    implements ElmClinicalVisitor<T, C> {
  @override
  T visitElement(ElmElement elm, C context) {
    if (elm is ExpressionDef)
      return visitExpressionDef(elm, context);
    else if (elm is CodeDef)
      return visitCodeDef(elm, context);
    else if (elm is CodeSystemDef)
      return visitCodeSystemDef(elm, context);
    else if (elm is ValueSetDef)
      return visitValueSetDef(elm, context);
    else if (elm is ConceptDef)
      return visitConceptDef(elm, context);
    else if (elm is CodeFilterElement)
      return visitCodeFilterElement(elm, context);
    else if (elm is DateFilterElement)
      return visitDateFilterElement(elm, context);
    else if (elm is OtherFilterElement)
      return visitOtherFilterElement(elm, context);
    else if (elm is IncludeElement) return visitIncludeElement(elm, context);
    return super.visitElement(elm, context);
  }

  @override
  T visitExpression(Expression elm, C context) {
    if (elm is FunctionRef)
      return visitFunctionRef(elm, context);
    else if (elm is ExpressionRef)
      return visitExpressionRef(elm, context);
    else if (elm is CodeSystemRef)
      return visitCodeSystemRef(elm, context);
    else if (elm is ValueSetRef)
      return visitValueSetRef(elm, context);
    else if (elm is CodeRef)
      return visitCodeRef(elm, context);
    else if (elm is ConceptRef)
      return visitConceptRef(elm, context);
    else if (elm is ElmCode)
      return visitCode(elm, context);
    else if (elm is Concept)
      return visitConcept(elm, context);
    else if (elm is ElmQuantity)
      return visitQuantity(elm as Quantity, context);
    else if (elm is Ratio)
      return visitRatio(elm as Ratio, context);
    else if (elm is Retrieve) return visitRetrieve(elm, context);
    return super.visitExpression(elm, context);
  }

  @override
  T visitOperatorExpression(OperatorExpression elm, C context) {
    if (elm is InCodeSystem)
      return visitInCodeSystem(elm, context);
    else if (elm is AnyInCodeSystem)
      return visitAnyInCodeSystem(elm, context);
    else if (elm is InValueSet)
      return visitInValueSet(elm, context);
    else if (elm is AnyInValueSet) return visitAnyInValueSet(elm, context);
    return super.visitOperatorExpression(elm, context);
  }

  @override
  T visitUnaryExpression(UnaryExpression elm, C context) {
    if (elm is ExpandValueSet)
      return visitExpandValueSet(elm, context);
    else if (elm is CalculateAge) return visitCalculateAge(elm, context);
    return super.visitUnaryExpression(elm, context);
  }

  @override
  T visitBinaryExpression(BinaryExpression elm, C context) {
    if (elm is CalculateAgeAt)
      return visitCalculateAgeAt(elm, context);
    else if (elm is Subsumes)
      return visitSubsumes(elm, context);
    else if (elm is SubsumedBy) return visitSubsumedBy(elm, context);
    return super.visitBinaryExpression(elm, context);
  }

  T visitExpandValueSet(ExpandValueSet elm, C context) {
    return defaultResult(elm, context);
  }

  T visitCodeFilterElement(CodeFilterElement elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitElement(elm.value, context);
    result = aggregateResult(result, childResult);
    return result;
  }

  T visitDateFilterElement(DateFilterElement elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitElement(elm.value, context);
    result = aggregateResult(result, childResult);
    return result;
  }

  T visitOtherFilterElement(OtherFilterElement elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitElement(elm.value, context);
    result = aggregateResult(result, childResult);
    return result;
  }

  T visitIncludeElement(IncludeElement elm, C context) {
    return defaultResult(elm, context);
  }

  T visitRetrieve(Retrieve elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitElement(elm.codes, context);
    result = aggregateResult(result, childResult);
    childResult = visitElement(elm.dateRange, context);
    result = aggregateResult(result, childResult);
    childResult = visitElement(elm.context, context);
    result = aggregateResult(result, childResult);
    for (var ie in elm.include) {
      T childResult = visitElement(ie, context);
      result = aggregateResult(result, childResult);
    }
    for (var cfe in elm.codeFilter) {
      T childResult = visitElement(cfe, context);
      result = aggregateResult(result, childResult);
    }
    for (var dfe in elm.dateFilter) {
      T childResult = visitElement(dfe, context);
      result = aggregateResult(result, childResult);
    }
    for (var ofe in elm.otherFilter) {
      T childResult = visitElement(ofe, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitProperty(Property elm, C context) {
    if (elm is Search) {
      return visitSearch(elm, context);
    }
    return super.visitProperty(elm, context);
  }

  T visitSearch(Search elm, C context) {
    return visitChildren(elm, context);
  }

  T visitCodeSystemDef(CodeSystemDef elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitAccessModifier(elm.accessLevel, context);
    result = aggregateResult(result, childResult);
    return result;
  }

  T visitValueSetDef(ValueSetDef elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitAccessModifier(elm.accessLevel, context);
    result = aggregateResult(result, childResult);
    for (CodeSystemRef codeSystemRef in elm.codeSystem ?? []) {
      T childResult = visitElement(codeSystemRef, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitCodeDef(CodeDef elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitAccessModifier(elm.accessLevel, context);
    result = aggregateResult(result, childResult);
    if (elm.codeSystem != null) {
      T childResult = visitCodeSystemRef(elm.codeSystem!, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitConceptDef(ConceptDef elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitAccessModifier(elm.accessLevel, context);
    result = aggregateResult(result, childResult);
    for (CodeRef cr in elm.code) {
      T childResult = visitElement(cr, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitCodeSystemRef(CodeSystemRef elm, C context) {
    return defaultResult(elm, context);
  }

  T visitValueSetRef(ValueSetRef elm, C context) {
    return defaultResult(elm, context);
  }

  T visitCodeRef(CodeRef elm, C context) {
    return defaultResult(elm, context);
  }

  T visitConceptRef(ConceptRef elm, C context) {
    return defaultResult(elm, context);
  }

  T visitCode(ElmCode elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.system != null) {
      T childResult = visitElement(elm.system!, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitConcept(Concept elm, C context) {
    T result = defaultResult(elm, context);
    for (ElmCode c in elm.code) {
      T childResult = visitElement(c, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitInCodeSystem(InCodeSystem elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitElement(elm.code, context);
    result = aggregateResult(result, childResult);
    if (elm.codesystem != null) {
      childResult = visitElement(elm.codesystem!, context);
      result = aggregateResult(result, childResult);
    }
    if (elm.codesystemExpression != null) {
      T childResult = visitElement(elm.codesystemExpression!, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitAnyInCodeSystem(AnyInCodeSystem elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitElement(elm.codes, context);
    result = aggregateResult(result, childResult);
    if (elm.codesystem != null) {
      childResult = visitElement(elm.codesystem!, context);
      result = aggregateResult(result, childResult);
    }
    if (elm.codesystemExpression != null) {
      T childResult = visitElement(elm.codesystemExpression!, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitInValueSet(InValueSet elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitElement(elm.code, context);
    result = aggregateResult(result, childResult);
    if (elm.valueset != null) {
      childResult = visitElement(elm.valueset!, context);
      result = aggregateResult(result, childResult);
    }
    if (elm.valuesetExpression != null) {
      T childResult = visitElement(elm.valuesetExpression!, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitAnyInValueSet(AnyInValueSet elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitElement(elm.codes, context);
    result = aggregateResult(result, childResult);
    if (elm.valueset != null) {
      childResult = visitElement(elm.valueset!, context);
      result = aggregateResult(result, childResult);
    }
    if (elm.valuesetExpression != null) {
      T childResult = visitElement(elm.valuesetExpression!, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitSubsumes(Subsumes elm, C context) {
    return visitChildren(elm, context);
  }

  T visitSubsumedBy(SubsumedBy elm, C context) {
    return visitChildren(elm, context);
  }

  T visitQuantity(ElmQuantity elm, C context) {
    return defaultResult(elm, context);
  }

  T visitRatio(Ratio elm, C context) {
    T result = defaultResult(elm, context);
    T? childResult;
    if (elm.denominator != null) {
      if ((elm.denominator!.value?.isValid ?? false) &&
          elm.denominator!.unit != null) {
        childResult = visitElement(
          ElmQuantity(elm.denominator!.value!.value!, elm.denominator!.unit!),
          context,
        );
        result = aggregateResult(result, childResult!);
      }
    }
    if (elm.numerator != null) {
      if ((elm.numerator!.value?.isValid ?? false) &&
          elm.numerator!.unit != null) {
        childResult = visitElement(
          ElmQuantity(elm.numerator!.value!.value!, elm.numerator!.unit!),
          context,
        );
        result = aggregateResult(result, childResult!);
      }
    }
    return result;
  }

  T visitCalculateAge(CalculateAge elm, C context) {
    return visitChildren(elm, context);
  }

  T visitCalculateAgeAt(CalculateAgeAt elm, C context) {
    return visitChildren(elm, context);
  }

  @override
  T visitToDate(VisitToDate elm, C context) {
    return visitChildren(elm, context);
  }
}
