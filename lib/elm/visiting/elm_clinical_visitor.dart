import 'package:fhir/r4.dart';

import '../../cql_lm/cql_lm.dart';
import 'visiting.dart';

abstract class ElmClinicalVisitor<T, C> implements ElmVisitor<T, C> {
  T visitCodeFilterElement(CodeFilterElement elm, C context);
  T visitDateFilterElement(DateFilterElement elm, C context);
  T visitOtherFilterElement(OtherFilterElement elm, C context);
  T visitIncludeElement(IncludeElement elm, C context);
  T visitRetrieve(Retrieve elm, C context);
  T visitSearch(Search elm, C context);
  T visitCodeSystemDef(CodeSystemDef elm, C context);
  T visitValueSetDef(ValueSetDef elm, C context);
  T visitCodeDef(CodeDef elm, C context);
  T visitConceptDef(ConceptDef elm, C context);
  T visitCodeSystemRef(CodeSystemRef elm, C context);
  T visitValueSetRef(ValueSetRef elm, C context);
  T visitCodeRef(CodeRef elm, C context);
  T visitConceptRef(ConceptRef elm, C context);
  T visitCode(ElmCode elm, C context);
  T visitConcept(Concept elm, C context);
  T visitInCodeSystem(InCodeSystem elm, C context);
  T visitAnyInCodeSystem(AnyInCodeSystem elm, C context);
  T visitInValueSet(InValueSet elm, C context);
  T visitAnyInValueSet(AnyInValueSet elm, C context);
  T visitSubsumes(Subsumes elm, C context);
  T visitSubsumedBy(SubsumedBy elm, C context);
  T visitQuantity(Quantity elm, C context);
  T visitRatio(Ratio elm, C context);
  T visitCalculateAge(CalculateAge elm, C context);
  T visitCalculateAgeAt(CalculateAgeAt elm, C context);
}
