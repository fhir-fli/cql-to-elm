import '../../cql_lm/cql_lm.dart';
import 'visiting.dart';

class ElmBaseVisitor<T, C> implements ElmVisitor<T, C> {
  T defaultResult(Trackable elm, C context) {
    return null;
  }

  T aggregateResult(T aggregate, T nextResult) {
    return nextResult;
  }

  @override
  T visitElement(Element elm, C context) {
    if (elm is AliasedQuerySource)
      return visitAliasedQuerySource(elm, context);
    else if (elm is CaseItem)
      return visitCaseItem(elm, context);
    else if (elm is Expression)
      return visitExpression(elm, context);
    else if (elm is LetClause)
      return visitLetClause(elm, context);
    else if (elm is OperandDef)
      return visitOperandDef(elm, context);
    else if (elm is ParameterDef)
      return visitParameterDef(elm, context);
    else if (elm is ReturnClause)
      return visitReturnClause(elm, context);
    else if (elm is AggregateClause)
      return visitAggregateClause(elm, context);
    else if (elm is SortByItem)
      return visitSortByItem(elm, context);
    else if (elm is SortClause)
      return visitSortClause(elm, context);
    else if (elm is TupleElementDefinition)
      return visitTupleElementDefinition(elm, context);
    else if (elm is TypeSpecifier)
      return visitTypeSpecifier(elm, context);
    else
      return defaultResult(elm, context);
  }

  @override
  T visitTypeSpecifier(TypeSpecifier elm, C context) {
    if (elm is NamedTypeSpecifier)
      return visitNamedTypeSpecifier(elm, context);
    else if (elm is IntervalTypeSpecifier)
      return visitIntervalTypeSpecifier(elm, context);
    else if (elm is ListTypeSpecifier)
      return visitListTypeSpecifier(elm, context);
    else if (elm is TupleTypeSpecifier)
      return visitTupleTypeSpecifier(elm, context);
    else if (elm is ChoiceTypeSpecifier)
      return visitChoiceTypeSpecifier(elm, context);
    else
      return defaultResult(elm, context);
  }

  @override
  T visitNamedTypeSpecifier(NamedTypeSpecifier elm, C context) {
    return defaultResult(elm, context);
  }

  @override
  T visitIntervalTypeSpecifier(IntervalTypeSpecifier elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitTypeSpecifier(elm.pointType, context);
    return aggregateResult(result, childResult);
  }

  @override
  T visitListTypeSpecifier(ListTypeSpecifier elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitTypeSpecifier(elm.elementType, context);
    return aggregateResult(result, childResult);
  }

  @override
  T visitTupleElementDefinition(TupleElementDefinition elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitTypeSpecifier(elm.elementType, context);
    return aggregateResult(result, childResult);
  }

  @override
  T visitTupleTypeSpecifier(TupleTypeSpecifier elm, C context) {
    T result = defaultResult(elm, context);
    for (TupleElementDefinition element in elm.element) {
      T childResult = visitTupleElementDefinition(element, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  @override
  T visitChoiceTypeSpecifier(ChoiceTypeSpecifier elm, C context) {
    T result = defaultResult(elm, context);
    for (TypeSpecifier choice in elm.choice) {
      T childResult = visitElement(choice, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  @override
  T visitExpression(Expression elm, C context) {
    if (elm is AggregateExpression)
      return visitAggregateExpression(elm, context);
    else if (elm is OperatorExpression)
      return visitOperatorExpression(elm, context);
    else if (elm is AliasRef)
      return visitAliasRef(elm, context);
    else if (elm is Case)
      return visitCase(elm, context);
    else if (elm is Current)
      return visitCurrent(elm, context);
    else if (elm is ExpressionRef)
      return visitExpressionRef(elm, context);
    else if (elm is Filter)
      return visitFilter(elm, context);
    else if (elm is ForEach)
      return visitForEach(elm, context);
    else if (elm is IdentifierRef)
      return visitIdentifierRef(elm, context);
    else if (elm is If)
      return visitIf(elm, context);
    else if (elm is Instance)
      return visitInstance(elm, context);
    else if (elm is Interval)
      return visitInterval(elm, context);
    else if (elm is Iteration)
      return visitIteration(elm, context);
    else if (elm is List)
      return visitList(elm, context);
    else if (elm is Literal)
      return visitLiteral(elm, context);
    else if (elm is MaxValue)
      return visitMaxValue(elm, context);
    else if (elm is MinValue)
      return visitMinValue(elm, context);
    else if (elm is OperandRef)
      return visitOperandRef(elm, context);
    else if (elm is ParameterRef)
      return visitParameterRef(elm, context);
    else if (elm is Property)
      return visitProperty(elm, context);
    else if (elm is Query)
      return visitQuery(elm, context);
    else if (elm is QueryLetRef)
      return visitQueryLetRef(elm, context);
    else if (elm is Repeat)
      return visitRepeat(elm, context);
    else if (elm is Sort)
      return visitSort(elm, context);
    else if (elm is Total)
      return visitTotal(elm, context);
    else if (elm is Tuple)
      return visitTuple(elm, context);
    else
      return defaultResult(elm, context);
  }

  T visitOperatorExpression(OperatorExpression elm, C context) {
    if (elm is UnaryExpression) {
      return visitUnaryExpression(elm, context);
    } else if (elm is BinaryExpression) {
      return visitBinaryExpression(elm, context);
    } else if (elm is TernaryExpression) {
      return visitTernaryExpression(elm, context);
    } else if (elm is NaryExpression) {
      return visitNaryExpression(elm, context);
    } else if (elm is Round) {
      return visitRound(elm, context);
    } else if (elm is Combine) {
      return visitCombine(elm, context);
    } else if (elm is Split) {
      return visitSplit(elm, context);
    } else if (elm is SplitOnMatches) {
      return visitSplitOnMatches(elm, context);
    } else if (elm is PositionOf) {
      return visitPositionOf(elm, context);
    } else if (elm is LastPositionOf) {
      return visitLastPositionOf(elm, context);
    } else if (elm is Substring) {
      return visitSubstring(elm, context);
    } else if (elm is TimeOfDay) {
      return visitTimeOfDay(elm, context);
    } else if (elm is Today) {
      return visitToday(elm, context);
    } else if (elm is Now) {
      return visitNow(elm, context);
    } else if (elm is Time) {
      return visitTime(elm as Time, context);
    } else if (elm is Date) {
      return visitDate(elm as Date, context);
    } else if (elm is DateTime) {
      return visitDateTime(elm, context);
    } else if (elm is First) {
      return visitFirst(elm as First, context);
    } else if (elm is Last) {
      return visitLast(elm as Last, context);
    } else if (elm is IndexOf) {
      return visitIndexOf(elm as IndexOf, context);
    } else if (elm is Slice) {
      return visitSlice(elm as Slice, context);
    } else if (elm is Children) {
      return visitChildren(elm as Children, context);
    } else if (elm is Descendents) {
      return visitDescendents(elm as Descendents, context);
    } else if (elm is Message) {
      return visitMessage(elm as Message, context);
    }
    return defaultResult(elm, context);
  }

  T visitChildren(UnaryExpression elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitElement(elm.operand, context);
    result = aggregateResult(result, childResult);
    return result;
  }

  T visitUnaryExpression(UnaryExpression elm, C context) {
    if (elm is Abs) {
      return visitAbs(elm, context);
    } else if (elm is As) {
      return visitAs(elm as As, context);
    } else if (elm is Ceiling) {
      return visitCeiling(elm, context);
    } else if (elm is CanConvert) {
      return visitCanConvert(elm as CanConvert, context);
    } else if (elm is Convert) {
      return visitConvert(elm as Convert, context);
    } else if (elm is ConvertsToBoolean) {
      return visitConvertsToBoolean(elm, context);
    } else if (elm is ConvertsToDate) {
      return visitConvertsToDate(elm, context);
    } else if (elm is ConvertsToDateTime) {
      return visitConvertsToDateTime(elm, context);
    } else if (elm is ConvertsToDecimal) {
      return visitConvertsToDecimal(elm, context);
    } else if (elm is ConvertsToInteger) {
      return visitConvertsToInteger(elm, context);
    } else if (elm is ConvertsToLong) {
      return visitConvertsToLong(elm, context);
    } else if (elm is ConvertsToQuantity) {
      return visitConvertsToQuantity(elm, context);
    } else if (elm is ConvertsToRatio) {
      return visitConvertsToRatio(elm, context);
    } else if (elm is ConvertsToString) {
      return visitConvertsToString(elm, context);
    } else if (elm is ConvertsToTime) {
      return visitConvertsToTime(elm, context);
    } else if (elm is DateFrom) {
      return visitDateFrom(elm, context);
    } else if (elm is DateTimeComponentFrom) {
      return visitDateTimeComponentFrom(elm, context);
    } else if (elm is Distinct) {
      return visitDistinct(elm as Distinct, context);
    } else if (elm is End) {
      return visitEnd(elm, context);
    } else if (elm is Exists) {
      return visitExists(elm as Exists, context);
    } else if (elm is Exp) {
      return visitExp(elm, context);
    } else if (elm is Flatten) {
      return visitFlatten(elm as Flatten, context);
    } else if (elm is Floor) {
      return visitFloor(elm, context);
    } else if (elm is Is) {
      return visitIs(elm as Is, context);
    } else if (elm is IsFalse) {
      return visitIsFalse(elm as IsFalse, context);
    } else if (elm is IsNull) {
      return visitIsNull(elm, context);
    } else if (elm is IsTrue) {
      return visitIsTrue(elm as IsTrue, context);
    } else if (elm is Length) {
      return visitLength(elm, context);
    } else if (elm is Ln) {
      return visitLn(elm, context);
    } else if (elm is Lower) {
      return visitLower(elm, context);
    } else if (elm is Negate) {
      return visitNegate(elm, context);
    } else if (elm is Not) {
      return visitNot(elm, context);
    } else if (elm is PointFrom) {
      return visitPointFrom(elm, context);
    } else if (elm is Precision) {
      return visitPrecision(elm, context);
    } else if (elm is Predecessor) {
      return visitPredecessor(elm, context);
    } else if (elm is SingletonFrom) {
      return visitSingletonFrom(elm as SingletonFrom, context);
    } else if (elm is Size) {
      return visitSize(elm, context);
    } else if (elm is Start) {
      return visitStart(elm, context);
    } else if (elm is Successor) {
      return visitSuccessor(elm, context);
    } else if (elm is TimeFrom) {
      return visitTimeFrom(elm, context);
    } else if (elm is TimezoneFrom) {
      return visitTimezoneFrom(elm, context);
    } else if (elm is TimezoneOffsetFrom) {
      return visitTimezoneOffsetFrom(elm, context);
    } else if (elm is ToBoolean) {
      return visitToBoolean(elm, context);
    } else if (elm is ToConcept) {
      return visitToConcept(elm, context);
    } else if (elm is ToChars) {
      return visitToChars(elm, context);
    } else if (elm is ToDate) {
      return visitToDate(elm, context);
    } else if (elm is ToDateTime) {
      return visitToDateTime(elm, context);
    } else if (elm is ToDecimal) {
      return visitToDecimal(elm, context);
    } else if (elm is ToInteger) {
      return visitToInteger(elm, context);
    } else if (elm is ToLong) {
      return visitToLong(elm, context);
    } else if (elm is ToList) {
      return visitToList(elm, context);
    } else if (elm is ToQuantity) {
      return visitToQuantity(elm, context);
    } else if (elm is ToRatio) {
      return visitToRatio(elm, context);
    } else if (elm is ToString) {
      return visitToString(elm, context);
    } else if (elm is ToTime) {
      return visitToTime(elm, context);
    } else if (elm is Truncate) {
      return visitTruncate(elm, context);
    } else if (elm is Upper) {
      return visitUpper(elm, context);
    } else if (elm is Width) {
      return visitWidth(elm, context);
    }
    return visitChildren(elm, context);
  }

  T visitChildren(BinaryExpression elm, C context) {
    T result = defaultResult(elm, context);
    for (Expression e in elm.operand) {
      T childResult = visitElement(e, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitBinaryExpression(BinaryExpression elm, C context) {
    if (elm is Add) {
      return visitAdd(elm, context);
    } else if (elm is After) {
      return visitAfter(elm as After, context);
    } else if (elm is And) {
      return visitAnd(elm, context);
    } else if (elm is Before) {
      return visitBefore(elm as Before, context);
    } else if (elm is CanConvertQuantity) {
      return visitCanConvertQuantity(elm, context);
    } else if (elm is Contains) {
      return visitContains(elm as Contains, context);
    } else if (elm is ConvertQuantity) {
      return visitConvertQuantity(elm, context);
    } else if (elm is Collapse) {
      return visitCollapse(elm as Collapse, context);
    } else if (elm is DifferenceBetween) {
      return visitDifferenceBetween(elm, context);
    } else if (elm is Divide) {
      return visitDivide(elm, context);
    } else if (elm is DurationBetween) {
      return visitDurationBetween(elm, context);
    } else if (elm is Ends) {
      return visitEnds(elm as Ends, context);
    } else if (elm is EndsWith) {
      return visitEndsWith(elm, context);
    } else if (elm is Equal) {
      return visitEqual(elm, context);
    } else if (elm is Equivalent) {
      return visitEquivalent(elm, context);
    } else if (elm is Expand) {
      return visitExpand(elm as Expand, context);
    } else if (elm is Greater) {
      return visitGreater(elm, context);
    } else if (elm is GreaterOrEqual) {
      return visitGreaterOrEqual(elm, context);
    } else if (elm is HighBoundary) {
      return visitHighBoundary(elm, context);
    } else if (elm is Implies) {
      return visitImplies(elm, context);
    } else if (elm is In) {
      return visitIn(elm as In, context);
    } else if (elm is IncludedIn) {
      return visitIncludedIn(elm as IncludedIn, context);
    } else if (elm is Includes) {
      return visitIncludes(elm as Includes, context);
    } else if (elm is Indexer) {
      return visitIndexer(elm, context);
    } else if (elm is Less) {
      return visitLess(elm, context);
    } else if (elm is LessOrEqual) {
      return visitLessOrEqual(elm, context);
    } else if (elm is Log) {
      return visitLog(elm, context);
    } else if (elm is LowBoundary) {
      return visitLowBoundary(elm, context);
    } else if (elm is Matches) {
      return visitMatches(elm, context);
    } else if (elm is Meets) {
      return visitMeets(elm as Meets, context);
    } else if (elm is MeetsAfter) {
      return visitMeetsAfter(elm as MeetsAfter, context);
    } else if (elm is MeetsBefore) {
      return visitMeetsBefore(elm as MeetsBefore, context);
    } else if (elm is Modulo) {
      return visitModulo(elm, context);
    } else if (elm is Multiply) {
      return visitMultiply(elm, context);
    } else if (elm is NotEqual) {
      return visitNotEqual(elm, context);
    } else if (elm is Or) {
      return visitOr(elm, context);
    } else if (elm is Overlaps) {
      return visitOverlaps(elm as Overlaps, context);
    } else if (elm is OverlapsAfter) {
      return visitOverlapsAfter(elm as OverlapsAfter, context);
    } else if (elm is OverlapsBefore) {
      return visitOverlapsBefore(elm as OverlapsBefore, context);
    } else if (elm is Power) {
      return visitPower(elm, context);
    } else if (elm is ProperContains) {
      return visitProperContains(elm as ProperContains, context);
    } else if (elm is ProperIn) {
      return visitProperIn(elm as ProperIn, context);
    } else if (elm is ProperIncludedIn) {
      return visitProperIncludedIn(elm as ProperIncludedIn, context);
    } else if (elm is ProperIncludes) {
      return visitProperIncludes(elm as ProperIncludes, context);
    } else if (elm is SameAs) {
      return visitSameAs(elm, context);
    } else if (elm is SameOrAfter) {
      return visitSameOrAfter(elm, context);
    } else if (elm is SameOrBefore) {
      return visitSameOrBefore(elm, context);
    } else if (elm is Starts) {
      return visitStarts(elm as Starts, context);
    } else if (elm is StartsWith) {
      return visitStartsWith(elm, context);
    } else if (elm is Subtract) {
      return visitSubtract(elm, context);
    } else if (elm is Times) {
      return visitTimes(elm as Times, context);
    } else if (elm is TruncatedDivide) {
      return visitTruncatedDivide(elm, context);
    } else if (elm is Xor) {
      return visitXor(elm, context);
    }
    return visitChildren(elm, context);
  }

  T visitChildren(TernaryExpression elm, C context) {
    T result = defaultResult(elm, context);
    for (Expression e in elm.operand) {
      T childResult = visitElement(e, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitTernaryExpression(TernaryExpression elm, C context) {
    for (Expression element in elm.operand) {
      visitElement(element, context);
    }
    if (elm is ReplaceMatches) {
      return visitReplaceMatches(elm, context);
    }
    return visitChildren(elm, context);
  }

  T visitChildren(NaryExpression elm, C context) {
    T result = defaultResult(elm, context);
    for (Expression e in elm.operand) {
      T childResult = visitElement(e, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitNaryExpression(NaryExpression elm, C context) {
    if (elm is Coalesce) {
      return visitCoalesce(elm as Coalesce, context);
    } else if (elm is Concatenate) {
      return visitConcatenate(elm, context);
    } else if (elm is Except) {
      return visitExcept(elm as Except, context);
    } else if (elm is Intersect) {
      return visitIntersect(elm as Intersect, context);
    } else if (elm is Union) {
      return visitUnion(elm as Union, context);
    }
    return visitChildren(elm, context);
  }

  T visitChildren(ExpressionDef elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitAccessModifier(elm.accessLevel, context);
    result = aggregateResult(result, childResult);
    if (elm.expression != null) {
      T childResult = visitElement(elm.expression, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitExpressionDef(ExpressionDef elm, C context) {
    if (elm is FunctionDef) {
      return visitFunctionDef(elm, context);
    }
    return visitChildren(elm, context);
  }

  T visitFunctionDef(FunctionDef elm, C context) {
    T result = visitChildren(elm, context);
    for (Element operand in elm.operand) {
      T childResult = visitElement(operand, context);
      result = aggregateResult(result, childResult);
    }
    if (elm.resultTypeSpecifier != null) {
      T childResult = visitElement(elm.resultTypeSpecifier, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitAccessModifier(AccessModifier elm, C context) {
    // NOTE: AccessModifier isn't trackable?
    return defaultResult(null, context);
  }

  T visitExpressionRef(ExpressionRef elm, C context) {
    if (elm is FunctionRef) {
      return visitFunctionRef(elm, context);
    }
    return defaultResult(elm, context);
  }

  T visitFunctionRef(FunctionRef elm, C context) {
    T result = defaultResult(elm, context);
    for (Expression element in elm.operand) {
      T childResult = visitElement(element, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitParameterDef(ParameterDef elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.parameterTypeSpecifier != null) {
      T childResult = visitElement(elm.parameterTypeSpecifier, context);
      result = aggregateResult(result, childResult);
    }

    if (elm.defaultValue != null) {
      T childResult = visitElement(elm.defaultValue, context);
      result = aggregateResult(result, childResult);
    }

    return result;
  }

  T visitParameterRef(ParameterRef elm, C context) {
    return defaultResult(elm, context);
  }

  T visitOperandDef(OperandDef elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.operandTypeSpecifier != null) {
      T childResult = visitElement(elm.operandTypeSpecifier, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitOperandRef(OperandRef elm, C context) {
    return defaultResult(elm, context);
  }

  T visitIdentifierRef(IdentifierRef elm, C context) {
    return defaultResult(elm, context);
  }

  T visitLiteral(Literal elm, C context) {
    return defaultResult(elm, context);
  }

  T visitTupleElement(TupleElement elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitExpression(elm.value, context);
    result = aggregateResult(result, childResult);
    return result;
  }

  T visitTuple(Tuple elm, C context) {
    T result = defaultResult(elm, context);
    for (TupleElement element in elm.element) {
      T childResult = visitTupleElement(element, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitInstanceElement(InstanceElement elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitExpression(elm.value, context);
    result = aggregateResult(result, childResult);
    return result;
  }

  T visitInstance(Instance elm, C context) {
    T result = defaultResult(elm, context);
    for (InstanceElement element in elm.element) {
      T childResult = visitInstanceElement(element, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitInterval(Interval elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.low != null) {
      T childResult = visitElement(elm.low, context);
      result = aggregateResult(result, childResult);
    }
    if (elm.lowClosedExpression != null) {
      T childResult = visitElement(elm.lowClosedExpression, context);
      result = aggregateResult(result, childResult);
    }
    if (elm.high != null) {
      T childResult = visitElement(elm.high, context);
      result = aggregateResult(result, childResult);
    }
    if (elm.highClosedExpression != null) {
      T childResult = visitElement(elm.highClosedExpression, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitList(List elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.typeSpecifier != null) {
      T childResult = visitElement(elm.typeSpecifier, context);
      result = aggregateResult(result, childResult);
    }
    for (Expression element in elm.element) {
      T childResult = visitElement(element, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitAnd(And elm, C context) {
    return visitChildren(elm, context);
  }

  T visitOr(Or elm, C context) {
    return visitChildren(elm, context);
  }

  T visitXor(Xor elm, C context) {
    return visitChildren(elm, context);
  }

  T visitImplies(Implies elm, C context) {
    return visitChildren(elm, context);
  }

  T visitNot(Not elm, C context) {
    return visitChildren(elm, context);
  }

  T visitIf(If elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitElement(elm.condition, context);
    result = aggregateResult(result, childResult);
    T childResult = visitElement(elm.then, context);
    result = aggregateResult(result, childResult);
    if (elm.elze != null) {
      T childResult = visitElement(elm.elze, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitCaseItem(CaseItem elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitElement(elm.when, context);
    result = aggregateResult(result, childResult);
    T childResult = visitElement(elm.then, context);
    result = aggregateResult(result, childResult);
    return result;
  }

  T visitCase(Case elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.comparand != null) {
      T childResult = visitElement(elm.comparand, context);
      result = aggregateResult(result, childResult);
    }
    for (CaseItem ci in elm.caseItem) {
      T childResult = visitElement(ci, context);
      result = aggregateResult(result, childResult);
    }
    if (elm.elze != null) {
      T childResult = visitElement(elm.elze, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitNull(Null elm, C context) {
    return defaultResult(elm, context);
  }

  T visitIsNull(IsNull elm, C context) {
    return visitChildren(elm, context);
  }

  T visitIsTrue(IsTrue elm, C context) {
    return visitChildren(elm, context);
  }

  T visitIsFalse(IsFalse elm, C context) {
    return visitChildren(elm, context);
  }

  T visitCoalesce(Coalesce elm, C context) {
    return visitChildren(elm, context);
  }

  T visitIs(Is elm, C context) {
    T result = visitChildren(elm, context);
    if (elm.isTypeSpecifier != null) {
      T childResult = visitElement(elm.isTypeSpecifier, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitAs(As elm, C context) {
    T result = visitChildren(elm, context);
    if (elm.asTypeSpecifier != null) {
      T childResult = visitElement(elm.asTypeSpecifier, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitConvert(Convert elm, C context) {
    T result = visitChildren(elm, context);
    if (elm.toTypeSpecifier != null) {
      T childResult = visitElement(elm.toTypeSpecifier, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitCanConvert(CanConvert elm, C context) {
    T result = visitChildren(elm, context);
    if (elm.toTypeSpecifier != null) {
      T childResult = visitElement(elm.toTypeSpecifier, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitConvertsToBoolean(ConvertsToBoolean elm, C context) {
    return visitChildren(elm, context);
  }

  T visitToBoolean(ToBoolean elm, C context) {
    return visitChildren(elm, context);
  }

  T visitToChars(ToChars elm, C context) {
    return visitChildren(elm, context);
  }

  T visitToConcept(ToConcept elm, C context) {
    return visitChildren(elm, context);
  }

  T visitConvertsToDate(ConvertsToDate elm, C context) {
    return visitChildren(elm, context);
  }

  T visitConvertsToDateTime(ConvertsToDateTime elm, C context) {
    return visitChildren(elm, context);
  }

  T visitToDateTime(ToDateTime elm, C context) {
    return visitChildren(elm, context);
  }

  T visitConvertsToLong(ConvertsToLong elm, C context) {
    return visitChildren(elm, context);
  }

  T visitToLong(ToLong elm, C context) {
    return visitChildren(elm, context);
  }

  T visitConvertsToDecimal(ConvertsToDecimal elm, C context) {
    return visitChildren(elm, context);
  }

  T visitToDecimal(ToDecimal elm, C context) {
    return visitChildren(elm, context);
  }

  T visitConvertsToInteger(ConvertsToInteger elm, C context) {
    return visitChildren(elm, context);
  }

  T visitToInteger(ToInteger elm, C context) {
    return visitChildren(elm, context);
  }

  T visitToList(ToList elm, C context) {
    return visitChildren(elm, context);
  }

  T visitConvertQuantity(ConvertQuantity elm, C context) {
    return visitChildren(elm, context);
  }

  T visitCanConvertQuantity(CanConvertQuantity elm, C context) {
    return visitChildren(elm, context);
  }

  T visitConvertsToQuantity(ConvertsToQuantity elm, C context) {
    return visitChildren(elm, context);
  }

  T visitToQuantity(ToQuantity elm, C context) {
    return visitChildren(elm, context);
  }

  T visitConvertsToRatio(ConvertsToRatio elm, C context) {
    return visitChildren(elm, context);
  }

  T visitToRatio(ToRatio elm, C context) {
    return visitChildren(elm, context);
  }

  T visitConvertsToString(ConvertsToString elm, C context) {
    return visitChildren(elm, context);
  }

  T visitToString(ToString elm, C context) {
    return visitChildren(elm, context);
  }

  T visitConvertsToTime(ConvertsToTime elm, C context) {
    return visitChildren(elm, context);
  }

  T visitToTime(ToTime elm, C context) {
    return visitChildren(elm, context);
  }

  T visitEqual(Equal elm, C context) {
    return visitChildren(elm, context);
  }

  T visitEquivalent(Equivalent elm, C context) {
    return visitChildren(elm, context);
  }

  T visitNotEqual(NotEqual elm, C context) {
    return visitChildren(elm, context);
  }

  T visitLess(Less elm, C context) {
    return visitChildren(elm, context);
  }

  T visitGreater(Greater elm, C context) {
    return visitChildren(elm, context);
  }

  T visitLessOrEqual(LessOrEqual elm, C context) {
    return visitChildren(elm, context);
  }

  T visitGreaterOrEqual(GreaterOrEqual elm, C context) {
    return visitChildren(elm, context);
  }

  T visitAdd(Add elm, C context) {
    return visitChildren(elm, context);
  }

  T visitSubtract(Subtract elm, C context) {
    return visitChildren(elm, context);
  }

  T visitMultiply(Multiply elm, C context) {
    return visitChildren(elm, context);
  }

  T visitDivide(Divide elm, C context) {
    return visitChildren(elm, context);
  }

  T visitTruncatedDivide(TruncatedDivide elm, C context) {
    return visitChildren(elm, context);
  }

  T visitModulo(Modulo elm, C context) {
    return visitChildren(elm, context);
  }

  T visitCeiling(Ceiling elm, C context) {
    return visitChildren(elm, context);
  }

  T visitFloor(Floor elm, C context) {
    return visitChildren(elm, context);
  }

  T visitTruncate(Truncate elm, C context) {
    return visitChildren(elm, context);
  }

  T visitAbs(Abs elm, C context) {
    return visitChildren(elm, context);
  }

  T visitNegate(Negate elm, C context) {
    return visitChildren(elm, context);
  }

  T visitRound(Round elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getOperand() != null) {
      T childResult = visitElement(elm.getOperand(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getPrecision() != null) {
      T childResult = visitElement(elm.getPrecision(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitLn(Ln elm, C context) {
    return visitChildren(elm, context);
  }

  T visitExp(Exp elm, C context) {
    return visitChildren(elm, context);
  }

  T visitLog(Log elm, C context) {
    return visitChildren(elm, context);
  }

  T visitPower(Power elm, C context) {
    return visitChildren(elm, context);
  }

  T visitSuccessor(Successor elm, C context) {
    return visitChildren(elm, context);
  }

  T visitPredecessor(Predecessor elm, C context) {
    return visitChildren(elm, context);
  }

  T visitMinValue(MinValue elm, C context) {
    return defaultResult(elm, context);
  }

  T visitMaxValue(MaxValue elm, C context) {
    return defaultResult(elm, context);
  }

  T visitPrecision(Precision elm, C context) {
    return visitChildren(elm, context);
  }

  T visitLowBoundary(LowBoundary elm, C context) {
    return visitChildren(elm, context);
  }

  T visitHighBoundary(HighBoundary elm, C context) {
    return visitChildren(elm, context);
  }

  T visitConcatenate(Concatenate elm, C context) {
    return visitChildren(elm, context);
  }

  T visitCombine(Combine elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getSource() != null) {
      T childResult = visitElement(elm.getSource(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getSeparator() != null) {
      T childResult = visitElement(elm.getSeparator(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitSplit(Split elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getStringToSplit() != null) {
      T childResult = visitExpression(elm.getStringToSplit(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getSeparator() != null) {
      T childResult = visitExpression(elm.getSeparator(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitSplitOnMatches(SplitOnMatches elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getStringToSplit() != null) {
      T childResult = visitExpression(elm.getStringToSplit(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getSeparatorPattern() != null) {
      T childResult = visitExpression(elm.getSeparatorPattern(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitLength(Length elm, C context) {
    return visitChildren(elm, context);
  }

  T visitUpper(Upper elm, C context) {
    return visitChildren(elm, context);
  }

  T visitLower(Lower elm, C context) {
    return visitChildren(elm, context);
  }

  T visitIndexer(Indexer elm, C context) {
    return visitChildren(elm, context);
  }

  T visitPositionOf(PositionOf elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getPattern() != null) {
      T childResult = visitExpression(elm.getPattern(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getString() != null) {
      T childResult = visitExpression(elm.getString(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitLastPositionOf(LastPositionOf elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getPattern() != null) {
      T childResult = visitExpression(elm.getPattern(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getString() != null) {
      T childResult = visitExpression(elm.getString(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitSubstring(Substring elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getStringToSub() != null) {
      T childResult = visitExpression(elm.getStringToSub(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getStartIndex() != null) {
      T childResult = visitExpression(elm.getStartIndex(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getLength() != null) {
      T childResult = visitExpression(elm.getLength(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitStartsWith(StartsWith elm, C context) {
    return visitChildren(elm, context);
  }

  T visitEndsWith(EndsWith elm, C context) {
    return visitChildren(elm, context);
  }

  T visitMatches(Matches elm, C context) {
    return visitChildren(elm, context);
  }

  T visitReplaceMatches(ReplaceMatches elm, C context) {
    return visitChildren(elm, context);
  }

  T visitDurationBetween(DurationBetween elm, C context) {
    return visitChildren(elm, context);
  }

  T visitDifferenceBetween(DifferenceBetween elm, C context) {
    return visitChildren(elm, context);
  }

  T visitDateFrom(DateFrom elm, C context) {
    return visitChildren(elm, context);
  }

  T visitTimeFrom(TimeFrom elm, C context) {
    return visitChildren(elm, context);
  }

  T visitTimezoneFrom(TimezoneFrom elm, C context) {
    return visitChildren(elm, context);
  }

  T visitTimezoneOffsetFrom(TimezoneOffsetFrom elm, C context) {
    return visitChildren(elm, context);
  }

  T visitDateTimeComponentFrom(DateTimeComponentFrom elm, C context) {
    return visitChildren(elm, context);
  }

  T visitTimeOfDay(TimeOfDay elm, C context) {
    return defaultResult(elm, context);
  }

  T visitToday(Today elm, C context) {
    return defaultResult(elm, context);
  }

  T visitNow(Now elm, C context) {
    return defaultResult(elm, context);
  }

  T visitDateTime(DateTime elm, C context) {
    T result = defaultResult(elm, context);
    T childResult = visitExpression(elm.year, context);
    result = aggregateResult(result, childResult);
    T childResult = visitExpression(elm.month, context);
    result = aggregateResult(result, childResult);
    T childResult = visitExpression(elm.day, context);
    result = aggregateResult(result, childResult);
    T childResult = visitExpression(elm.hour, context);
    result = aggregateResult(result, childResult);
    T childResult = visitExpression(elm.minute, context);
    result = aggregateResult(result, childResult);
    T childResult = visitExpression(elm.second, context);
    result = aggregateResult(result, childResult);
    T childResult = visitExpression(elm.millisecond, context);
    result = aggregateResult(result, childResult);
    if (elm.timezoneOffset != null) {
      T childResult = visitExpression(elm.timezoneOffset, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitDate(Date elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.year != null) {
      T childResult = visitExpression(elm.year, context);
      result = aggregateResult(result, childResult);
    }
    if (elm.month != null) {
      T childResult = visitExpression(elm.month, context);
      result = aggregateResult(result, childResult);
    }
    if (elm.day != null) {
      T childResult = visitExpression(elm.day, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitTime(Time elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.hour != null) {
      T childResult = visitExpression(elm.hour, context);
      result = aggregateResult(result, childResult);
    }
    if (elm.minute != null) {
      T childResult = visitExpression(elm.minute, context);
      result = aggregateResult(result, childResult);
    }
    if (elm.second != null) {
      T childResult = visitExpression(elm.second, context);
      result = aggregateResult(result, childResult);
    }
    if (elm.millisecond != null) {
      T childResult = visitExpression(elm.millisecond, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitSameAs(SameAs elm, C context) {
    return visitChildren(elm, context);
  }

  T visitSameOrBefore(SameOrBefore elm, C context) {
    return visitChildren(elm, context);
  }

  T visitSameOrAfter(SameOrAfter elm, C context) {
    return visitChildren(elm, context);
  }

  T visitWidth(Width elm, C context) {
    return visitChildren(elm, context);
  }

  T visitSize(Size elm, C context) {
    return visitChildren(elm, context);
  }

  T visitPointFrom(PointFrom elm, C context) {
    return visitChildren(elm, context);
  }

  T visitStart(Start elm, C context) {
    return visitChildren(elm, context);
  }

  T visitEnd(End elm, C context) {
    return visitChildren(elm, context);
  }

  T visitContains(Contains elm, C context) {
    return visitChildren(elm, context);
  }

  T visitProperContains(ProperContains elm, C context) {
    return visitChildren(elm, context);
  }

  T visitIn(In elm, C context) {
    return visitChildren(elm, context);
  }

  T visitProperIn(ProperIn elm, C context) {
    return visitChildren(elm, context);
  }

  T visitIncludes(Includes elm, C context) {
    return visitChildren(elm, context);
  }

  T visitIncludedIn(IncludedIn elm, C context) {
    return visitChildren(elm, context);
  }

  T visitProperIncludes(ProperIncludes elm, C context) {
    return visitChildren(elm, context);
  }

  T visitProperIncludedIn(ProperIncludedIn elm, C context) {
    return visitChildren(elm, context);
  }

  T visitBefore(Before elm, C context) {
    return visitChildren(elm, context);
  }

  T visitAfter(After elm, C context) {
    return visitChildren(elm, context);
  }

  T visitMeets(Meets elm, C context) {
    return visitChildren(elm, context);
  }

  T visitMeetsBefore(MeetsBefore elm, C context) {
    return visitChildren(elm, context);
  }

  T visitMeetsAfter(MeetsAfter elm, C context) {
    return visitChildren(elm, context);
  }

  T visitOverlaps(Overlaps elm, C context) {
    return visitChildren(elm, context);
  }

  T visitOverlapsBefore(OverlapsBefore elm, C context) {
    return visitChildren(elm, context);
  }

  T visitOverlapsAfter(OverlapsAfter elm, C context) {
    return visitChildren(elm, context);
  }

  T visitStarts(Starts elm, C context) {
    return visitChildren(elm, context);
  }

  T visitEnds(Ends elm, C context) {
    return visitChildren(elm, context);
  }

  T visitCollapse(Collapse elm, C context) {
    return visitChildren(elm, context);
  }

  T visitExpand(Expand elm, C context) {
    return visitChildren(elm, context);
  }

  T visitUnion(Union elm, C context) {
    return visitChildren(elm, context);
  }

  T visitIntersect(Intersect elm, C context) {
    return visitChildren(elm, context);
  }

  T visitExcept(Except elm, C context) {
    return visitChildren(elm, context);
  }

  T visitExists(Exists elm, C context) {
    return visitChildren(elm, context);
  }

  T visitTimes(Times elm, C context) {
    return visitChildren(elm, context);
  }

  T visitFilter(Filter elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getSource() != null) {
      T childResult = visitElement(elm.getSource(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getCondition() != null) {
      T childResult = visitElement(elm.getCondition(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitFirst(First elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getSource() != null) {
      T childResult = visitElement(elm.getSource(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitLast(Last elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getSource() != null) {
      T childResult = visitElement(elm.getSource(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitSlice(Slice elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getSource() != null) {
      T childResult = visitElement(elm.getSource(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getStartIndex() != null) {
      T childResult = visitElement(elm.getStartIndex(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getEndIndex() != null) {
      T childResult = visitElement(elm.getEndIndex(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitChildren(Children elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getSource() != null) {
      T childResult = visitElement(elm.getSource(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitDescendents(Descendents elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getSource() != null) {
      T childResult = visitElement(elm.getSource(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitMessage(Message elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getSource() != null) {
      T childResult = visitElement(elm.getSource(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getCondition() != null) {
      T childResult = visitElement(elm.getCondition(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getCode() != null) {
      T childResult = visitElement(elm.getCode(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getSeverity() != null) {
      T childResult = visitElement(elm.getSeverity(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getMessage() != null) {
      T childResult = visitElement(elm.getMessage(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitIndexOf(IndexOf elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getSource() != null) {
      T childResult = visitElement(elm.getSource(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getElement() != null) {
      T childResult = visitElement(elm.getElement(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitFlatten(Flatten elm, C context) {
    return visitChildren(elm, context);
  }

  T visitSort(Sort elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getSource() != null) {
      T childResult = visitElement(elm.getSource(), context);
      result = aggregateResult(result, childResult);
    }
    for (SortByItem sbi in elm.getBy()) {
      T childResult = visitElement(elm, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitForEach(ForEach elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getSource() != null) {
      T childResult = visitElement(elm.getSource(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getElement() != null) {
      T childResult = visitElement(elm.getElement(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitRepeat(Repeat elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getSource() != null) {
      T childResult = visitElement(elm.getSource(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getElement() != null) {
      T childResult = visitElement(elm.getElement(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitDistinct(Distinct elm, C context) {
    return visitChildren(elm, context);
  }

  T visitCurrent(Current elm, C context) {
    return defaultResult(elm, context);
  }

  T visitIteration(Iteration elm, C context) {
    return defaultResult(elm, context);
  }

  T visitTotal(Total elm, C context) {
    return defaultResult(elm, context);
  }

  T visitSingletonFrom(SingletonFrom elm, C context) {
    return visitChildren(elm, context);
  }

  T visitChildren(AggregateExpression elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getSource() != null) {
      T childResult = visitElement(elm.getSource(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitAggregateExpression(AggregateExpression elm, C context) {
    if (elm is Aggregate)
      return visitAggregate(elm, context);
    else if (elm is Count)
      return visitCount(elm, context);
    else if (elm is Sum)
      return visitSum(elm, context);
    else if (elm is Product)
      return visitProduct(elm, context);
    else if (elm is Min)
      return visitMin(elm, context);
    else if (elm is Max)
      return visitMax(elm, context);
    else if (elm is Avg)
      return visitAvg(elm, context);
    else if (elm is GeometricMean)
      return visitGeometricMean(elm, context);
    else if (elm is Median)
      return visitMedian(elm, context);
    else if (elm is Mode)
      return visitMode(elm, context);
    else if (elm is Variance)
      return visitVariance(elm, context);
    else if (elm is StdDev)
      return visitStdDev(elm, context);
    else if (elm is PopulationVariance)
      return visitPopulationVariance(elm, context);
    else if (elm is PopulationStdDev)
      return visitPopulationStdDev(elm, context);
    else if (elm is AllTrue)
      return visitAllTrue(elm, context);
    else if (elm is AnyTrue) return visitAnyTrue(elm, context);
    return visitChildren(elm, context);
  }

  T visitAggregate(Aggregate elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getInitialValue() != null) {
      T childResult = visitExpression(elm.getInitialValue(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getIteration() != null) {
      T childResult = visitExpression(elm.getIteration(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitCount(Count elm, C context) {
    return visitChildren(elm, context);
  }

  T visitSum(Sum elm, C context) {
    return visitChildren(elm, context);
  }

  T visitProduct(Product elm, C context) {
    return visitChildren(elm, context);
  }

  T visitGeometricMean(GeometricMean elm, C context) {
    return visitChildren(elm, context);
  }

  T visitMin(Min elm, C context) {
    return visitChildren(elm, context);
  }

  T visitMax(Max elm, C context) {
    return visitChildren(elm, context);
  }

  T visitAvg(Avg elm, C context) {
    return visitChildren(elm, context);
  }

  T visitMedian(Median elm, C context) {
    return visitChildren(elm, context);
  }

  T visitMode(Mode elm, C context) {
    return visitChildren(elm, context);
  }

  T visitVariance(Variance elm, C context) {
    return visitChildren(elm, context);
  }

  T visitPopulationVariance(PopulationVariance elm, C context) {
    return visitChildren(elm, context);
  }

  T visitStdDev(StdDev elm, C context) {
    return visitChildren(elm, context);
  }

  T visitPopulationStdDev(PopulationStdDev elm, C context) {
    return visitChildren(elm, context);
  }

  T visitAllTrue(AllTrue elm, C context) {
    return visitChildren(elm, context);
  }

  T visitAnyTrue(AnyTrue elm, C context) {
    return visitChildren(elm, context);
  }

  T visitChildren(Property elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getSource() != null) {
      T childResult = visitExpression(elm.getSource(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitProperty(Property elm, C context) {
    return visitChildren(elm, context);
  }

  T visitChildren(AliasedQuerySource elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getExpression() != null) {
      T childResult = visitExpression(elm.getExpression(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitAliasedQuerySource(AliasedQuerySource elm, C context) {
    if (elm is RelationshipClause) {
      return visitRelationshipClause(elm, context);
    }
    return visitChildren(elm, context);
  }

  T visitLetClause(LetClause elm, C context) {
    if (elm.getExpression() != null) {
      return visitElement(elm.getExpression(), context);
    }
    return null;
  }

  T visitSuchThatClause(Expression elm, bool isWith, C context) {
    return visitElement(elm, context);
  }

  T visitChildren(RelationshipClause elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getExpression() != null) {
      T childResult = visitElement(elm.getExpression(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getSuchThat() != null) {
      T childResult =
          visitSuchThatClause(elm.getSuchThat(), elm is With, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitRelationshipClause(RelationshipClause elm, C context) {
    if (elm is With) {
      return visitWith(elm, context);
    } else if (elm is Without) {
      return visitWithout(elm, context);
    }
    return visitChildren(elm, context);
  }

  T visitWith(With elm, C context) {
    return visitChildren(elm, context);
  }

  T visitWithout(Without elm, C context) {
    return visitChildren(elm, context);
  }

  T visitSortByItem(SortByItem elm, C context) {
    T result = defaultResult(elm, context);
    if (elm is ByDirection) {
      T childResult = visitByDirection(elm, context);
      result = aggregateResult(result, childResult);
    } else if (elm is ByColumn) {
      T childResult = visitByColumn(elm, context);
      result = aggregateResult(result, childResult);
    } else if (elm is ByExpression) {
      T childResult = visitByExpression(elm, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitByDirection(ByDirection elm, C context) {
    return defaultResult(elm, context);
  }

  T visitByColumn(ByColumn elm, C context) {
    return defaultResult(elm, context);
  }

  T visitByExpression(ByExpression elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getExpression() != null) {
      T childResult = visitElement(elm.getExpression(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitSortClause(SortClause elm, C context) {
    T result = defaultResult(elm, context);
    for (SortByItem sbi in elm.getBy()) {
      T childResult = visitElement(sbi, context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitAggregateClause(AggregateClause elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getExpression() != null) {
      T childResult = visitElement(elm.getExpression(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getStarting() != null) {
      T childResult = visitElement(elm.getStarting(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitReturnClause(ReturnClause elm, C context) {
    T result = defaultResult(elm, context);
    if (elm.getExpression() != null) {
      T childResult = visitExpression(elm.getExpression(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitWhereClause(Expression elm, C context) {
    return visitElement(elm, context);
  }

  T visitQuery(Query elm, C context) {
    T result = defaultResult(elm, context);
    for (AliasedQuerySource source in elm.getSource()) {
      T childResult = visitElement(source, context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getLet() != null && elm.getLet().isNotEmpty) {
      for (Element let in elm.getLet()) {
        T childResult = visitElement(let, context);
        result = aggregateResult(result, childResult);
      }
    }
    if (elm.getRelationship() != null && elm.getRelationship().isNotEmpty) {
      for (Element relationship in elm.getRelationship()) {
        T childResult = visitElement(relationship, context);
        result = aggregateResult(result, childResult);
      }
    }
    if (elm.getWhere() != null) {
      T childResult = visitWhereClause(elm.getWhere(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getReturn() != null) {
      T childResult = visitElement(elm.getReturn(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getAggregate() != null) {
      T childResult = visitElement(elm.getAggregate(), context);
      result = aggregateResult(result, childResult);
    }
    if (elm.getSort() != null) {
      T childResult = visitElement(elm.getSort(), context);
      result = aggregateResult(result, childResult);
    }
    return result;
  }

  T visitAliasRef(AliasRef elm, C context) {
    return defaultResult(elm, context);
  }

  T visitQueryLetRef(QueryLetRef elm, C context) {
    return defaultResult(elm, context);
  }

  @override
  T visitToDate(ToDate elm, C context) {
    return defaultResult(elm, context);
  }
}
