import 'package:fhir/r4.dart';

class SimpleElmEngine {
  SimpleElmEngine();

  bool literalsEqual(Literal? left, Literal? right) {
    return (left == null && right == null) ||
        (left != null &&
            left.getValueType() != null &&
            left.getValueType() == right?.getValueType() &&
            stringsEqual(left.getValue()!, right?.getValue()));
  }

  bool booleansEqual(Expression? left, Expression? right) {
    return expressionsEqual(left, right);
  }

  bool integersEqual(Expression? left, Expression? right) {
    return expressionsEqual(left, right);
  }

  bool decimalsEqual(Expression? left, Expression? right) {
    return expressionsEqual(left, right);
  }

  bool decimalsEqual(BigDecimal? left, BigDecimal? right) {
    if (left == null && right == null) {
      return true;
    }

    if (left == null || right == null) {
      return false;
    }

    return left == right;
  }

  bool quantitiesEqual(ElmQuantity? left, Quantity? right) {
    if (left == null && right == null) {
      return true;
    }

    if (left == null || right == null) {
      return true;
    }

    return decimalsEqual(left.getValue(), right.getValue()) &&
        stringsEqual(left.getUnit(), right.getUnit());
  }

  bool stringsEqual(Expression? left, Expression? right) {
    return expressionsEqual(left, right);
  }

  bool dateTimesEqual(Expression? left, Expression? right) {
    return expressionsEqual(left, right);
  }

  bool dateRangesEqual(Expression? left, Expression? right) {
    return expressionsEqual(left, right);
  }

  bool _stringsEqual(String? left, String? right) {
    return (left == null && right == null) || (left != null && left == right);
  }

  bool systemsEqual(CodeSystemRef? left, CodeSystemRef? right) {
    return (left == null && right == null) ||
        (left != null &&
            _stringsEqual(left.getLibraryName(), right?.getLibraryName()) &&
            _stringsEqual(left.getName(), right?.getName()));
  }

  bool valueSetsEqual(ValueSetRef? left, ValueSetRef? right) {
    return (left == null && right == null) ||
        (left != null &&
            _stringsEqual(left.getLibraryName(), right?.getLibraryName()) &&
            _stringsEqual(left.getName(), right?.getName()));
  }

  bool codesEqual(Expression? left, Expression? right) {
    return expressionsEqual(left, right);
  }

  bool qnamesEqual(QName? left, QName? right) {
    return (left == null && right == null) || (left != null && left == right);
  }

  bool typeSpecifiersEqual(TypeSpecifier? left, TypeSpecifier? right) {
    if (left == null && right == null) {
      return true;
    }

    if (left == null || right == null) {
      return false;
    }

    if (left is NamedTypeSpecifier) {
      if (right is NamedTypeSpecifier) {
        return qnamesEqual(left.getName(), right.getName());
      }
      return false;
    }

    if (left is IntervalTypeSpecifier) {
      if (right is IntervalTypeSpecifier) {
        return typeSpecifiersEqual(left.getPointType(), right.getPointType());
      }
      return false;
    }

    if (left is ListTypeSpecifier) {
      if (right is ListTypeSpecifier) {
        return typeSpecifiersEqual(
            left.getElementType(), right.getElementType());
      }
      return false;
    }

    if (left is TupleTypeSpecifier) {
      if (right is TupleTypeSpecifier) {
        final leftElements = left.getElement();
        final rightElements = right.getElement();

        if (leftElements != null &&
            rightElements != null &&
            leftElements.length == rightElements.length) {
          for (var i = 0; i < leftElements.length; i++) {
            final leftElement = leftElements[i];
            final rightElement = rightElements[i];
            if (!typeSpecifiersEqual(
                    leftElement.getType(), rightElement.getType()) ||
                !typeSpecifiersEqual(leftElement.getElementType(),
                    rightElement.getElementType()) ||
                !stringsEqual(leftElement.getName(), rightElement.getName())) {
              return false;
            }
          }
          return true;
        }
        return false;
      }
      return false;
    }

    if (left is ChoiceTypeSpecifier) {
      if (right is ChoiceTypeSpecifier) {
        final leftTypes = left.getType();
        final rightTypes = right.getType();

        if (leftTypes != null &&
            rightTypes != null &&
            leftTypes.length == rightTypes.length) {
          for (var i = 0; i < leftTypes.length; i++) {
            final leftType = leftTypes[i];
            final rightType = rightTypes[i];
            if (!typeSpecifiersEqual(leftType, rightType)) {
              return false;
            }
          }
        }

        final leftChoices = left.getChoice();
        final rightChoices = right.getChoice();

        if (leftChoices != null &&
            rightChoices != null &&
            leftChoices.length == rightChoices.length) {
          for (var i = 0; i < leftChoices.length; i++) {
            final leftChoice = leftChoices[i];
            final rightChoice = rightChoices[i];
            if (!typeSpecifiersEqual(leftChoice, rightChoice)) {
              return false;
            }
          }
          return true;
        }
        return false;
      }
      return false;
    }

    return false;
  }

  bool expressionsEqual(Expression? left, Expression? right) {
    if (left == null && right == null) {
      return true;
    }

    if (left == null || right == null) {
      return false;
    }

    if (left is Literal) {
      if (right is Literal) {
        return literalsEqual(left, right);
      }
      return false;
    }

    if (left is FhirDate) {
      if (right is FhirDate) {
        FhirDate leftDate = left;
        FhirDate rightDate = right;
        return integersEqual(leftDate.year, rightDate.year) &&
            integersEqual(leftDate.month, rightDate.month) &&
            integersEqual(leftDate.day, rightDate.day);
      }
      return false;
    }

    if (left is FhirTime) {
      if (right is FhirTime) {
        FhirTime leftTime = left;
        FhirTime rightTime = right;
        return integersEqual(leftTime.hour, rightTime.hour) &&
            integersEqual(leftTime.minute, rightTime.minute) &&
            integersEqual(leftTime.second, rightTime.second) &&
            integersEqual(leftTime.millisecond, rightTime.millisecond);
      }
      return false;
    }

    if (left is FhirDateTime) {
      if (right is FhirDateTime) {
        FhirDateTime leftDateTime = left;
        FhirDateTime rightDateTime = right;
        return integersEqual(leftDateTime.year, rightDateTime.year) &&
            integersEqual(leftDateTime.month, rightDateTime.month) &&
            integersEqual(leftDateTime.day, rightDateTime.day) &&
            integersEqual(leftDateTime.hour, rightDateTime.hour) &&
            integersEqual(leftDateTime.minute, rightDateTime.minute) &&
            integersEqual(leftDateTime.second, rightDateTime.second) &&
            integersEqual(
                leftDateTime.millisecond, rightDateTime.millisecond) &&
            decimalsEqual(
                leftDateTime.timezoneOffset, rightDateTime.timezoneOffset);
      }
      return false;
    }

    if (left is Interval) {
      if (right is Interval) {
        Interval leftInterval = left as Interval;
        Interval rightInterval = right as Interval;
        return booleansEqual(leftInterval.lowClosedExpression,
                rightInterval.lowClosedExpression) &&
            dateTimesEqual(leftInterval.low, rightInterval.low) &&
            leftInterval.isLowClosed == rightInterval.isLowClosed &&
            booleansEqual(leftInterval.highClosedExpression,
                rightInterval.highClosedExpression) &&
            dateTimesEqual(leftInterval.high, rightInterval.high) &&
            leftInterval.isHighClosed == rightInterval.isHighClosed;
      }
      return false;
    }

    bool expressionsEqual(Expression? left, Expression? right) {
      if (left == null && right == null) {
        return true;
      }

      if (left == null || right == null) {
        return false;
      }

      if (left is Literal) {
        if (right is Literal) {
          return literalsEqual(left, right);
        }
        return false;
      }

      if (left is FhirDate) {
        if (right is FhirDate) {
          FhirDate leftDate = left;
          FhirDate rightDate = right;
          return integersEqual(leftDate.year, rightDate.year) &&
              integersEqual(leftDate.month, rightDate.month) &&
              integersEqual(leftDate.day, rightDate.day);
        }
        return false;
      }

      if (left is FhirTime) {
        if (right is FhirTime) {
          FhirTime leftTime = left;
          FhirTime rightTime = right;
          return integersEqual(leftTime.hour, rightTime.hour) &&
              integersEqual(leftTime.minute, rightTime.minute) &&
              integersEqual(leftTime.second, rightTime.second) &&
              integersEqual(leftTime.millisecond, rightTime.millisecond);
        }
        return false;
      }

      if (left is FhirDateTime) {
        if (right is FhirDateTime) {
          FhirDateTime leftDateTime = left;
          FhirDateTime rightDateTime = right;
          return integersEqual(leftDateTime.year, rightDateTime.year) &&
              integersEqual(leftDateTime.month, rightDateTime.month) &&
              integersEqual(leftDateTime.day, rightDateTime.day) &&
              integersEqual(leftDateTime.hour, rightDateTime.hour) &&
              integersEqual(leftDateTime.minute, rightDateTime.minute) &&
              integersEqual(leftDateTime.second, rightDateTime.second) &&
              integersEqual(
                  leftDateTime.millisecond, rightDateTime.millisecond) &&
              decimalsEqual(
                  leftDateTime.timezoneOffset, rightDateTime.timezoneOffset);
        }
        return false;
      }

      if (left is Interval) {
        if (right is Interval) {
          Interval leftInterval = left as Interval;
          Interval rightInterval = right as Interval;
          return booleansEqual(leftInterval.lowClosedExpression,
                  rightInterval.lowClosedExpression) &&
              dateTimesEqual(leftInterval.low, rightInterval.low) &&
              leftInterval.isLowClosed == rightInterval.isLowClosed &&
              booleansEqual(leftInterval.highClosedExpression,
                  rightInterval.highClosedExpression) &&
              dateTimesEqual(leftInterval.high, rightInterval.high) &&
              leftInterval.isHighClosed == rightInterval.isHighClosed;
        }
        return false;
      }
    }

    if (left is ToList) {
      if (right is ToList) {
        Expression leftSingleton = (left as ToList).operand;
        Expression rightSingleton = (right as ToList).operand;
        return codesEqual(leftSingleton, rightSingleton);
      }
      return false;
    }

    // Quantity
    if (left is Quantity) {
      if (right is Quantity) {
        return quantitiesEqual(left, right);
      }
      return false;
    }

    // Ratio
    if (left is Ratio) {
      if (right is Ratio) {
        return quantitiesEqual((left).denominator, (right).denominator) &&
            quantitiesEqual((left).numerator, (right).numerator);
      }
      return false;
    }

    // TODO: Consider refactoring ComparableElmRequirement?
    // Retrieve

    // InCodeSystem
    if (left is InCodeSystem) {
      if (right is InCodeSystem) {
        InCodeSystem leftArg = left as InCodeSystem;
        InCodeSystem rightArg = right as InCodeSystem;
        return expressionsEqual(leftArg.code, rightArg.code) &&
            systemsEqual(leftArg.codesystem, rightArg.codesystem) &&
            expressionsEqual(
                leftArg.codesystemExpression, rightArg.codesystemExpression);
      }
      return false;
    }

    // AnyInCodeSystem
    if (left is AnyInCodeSystem) {
      if (right is AnyInCodeSystem) {
        AnyInCodeSystem leftArg = left as AnyInCodeSystem;
        AnyInCodeSystem rightArg = right as AnyInCodeSystem;
        return expressionsEqual(leftArg.codes, rightArg.codes) &&
            systemsEqual(leftArg.codesystem, rightArg.codesystem) &&
            expressionsEqual(
                leftArg.codesystemExpression, rightArg.codesystemExpression);
      }
      return false;
    }

    // InValueSet
    if (left is InValueSet) {
      if (right is InValueSet) {
        InValueSet leftArg = left as InValueSet;
        InValueSet rightArg = right as InValueSet;
        return expressionsEqual(leftArg.code, rightArg.code) &&
            valueSetsEqual(leftArg.valueset, rightArg.valueset) &&
            expressionsEqual(
                leftArg.valuesetExpression, rightArg.valuesetExpression);
      }
      return false;
    }

    // AnyInValueSet
    if (left is AnyInValueSet) {
      if (right is AnyInValueSet) {
        AnyInValueSet leftArg = left as AnyInValueSet;
        AnyInValueSet rightArg = right as AnyInValueSet;
        return expressionsEqual(leftArg.codes, rightArg.codes) &&
            valueSetsEqual(leftArg.valueset, rightArg.valueset) &&
            expressionsEqual(
                leftArg.valuesetExpression, rightArg.valuesetExpression);
      }
      return false;
    }

    // CalculateAge
    if (left is CalculateAge) {
      if (right is CalculateAge) {
        CalculateAge leftArg = left as CalculateAge;
        CalculateAge rightArg = right as CalculateAge;
        return expressionsEqual(leftArg.operand, rightArg.operand) &&
            leftArg.precision == rightArg.precision;
      }
      return false;
    }

    // Subsumes
    if (left is Subsumes) {
      if (right is Subsumes) {
        Subsumes leftArg = left as Subsumes;
        Subsumes rightArg = right as Subsumes;
        if (operandsEqual(leftArg, rightArg)) {
          return true;
        }
        return false;
      }
      return false;
    }

    // SubsumedBy
    if (left is SubsumedBy) {
      if (right is SubsumedBy) {
        SubsumedBy leftArg = left as SubsumedBy;
        SubsumedBy rightArg = right as SubsumedBy;
        if (operandsEqual(leftArg, rightArg)) {
          return true;
        }
        return false;
      }
      return false;
    }

    // AggregateExpression
    if (left is AggregateExpression) {
      if (right is AggregateExpression) {
        AggregateExpression leftArg = left as AggregateExpression;
        AggregateExpression rightArg = right as AggregateExpression;
        return aggregateExpressionsEqual(leftArg, rightArg);
      }
      return false;
    }

    // OperatorExpression
    if (left is OperatorExpression) {
      if (right is OperatorExpression) {
        OperatorExpression leftArg = left as OperatorExpression;
        OperatorExpression rightArg = right as OperatorExpression;
        return operatorExpressionsEqual(leftArg, rightArg);
      }
      return false;
    }

    if (!left.runtimeType.toString().startsWith(right.runtimeType.toString())) {
      return false;
    }

    // AliasRef
    if (left is AliasRef) {
      if (right is AliasRef) {
        AliasRef leftArg = left as AliasRef;
        AliasRef rightArg = right as AliasRef;
        return stringsEqual(leftArg.name, rightArg.name);
      }
      return false;
    }

    // Case
    if (left is Case) {
      if (right is Case) {
        Case leftArg = left as Case;
        Case rightArg = right as Case;
        if (!expressionsEqual(leftArg.comparand, rightArg.comparand)) {
          return false;
        }
        if (!expressionsEqual(leftArg.elseExpr, rightArg.elseExpr)) {
          return false;
        }
        if (leftArg.caseItem != null &&
            rightArg.caseItem != null &&
            leftArg.caseItem.length == rightArg.caseItem.length) {
          for (int i = 0; i < leftArg.caseItem.length; i++) {
            CaseItem leftCaseItem = leftArg.caseItem[i];
            CaseItem rightCaseItem = rightArg.caseItem[i];
            if (!expressionsEqual(leftCaseItem.when, rightCaseItem.when) ||
                !expressionsEqual(leftCaseItem.then, rightCaseItem.then)) {
              return false;
            }
          }
          return true;
        }
        return false;
      }
      return false;
    }

    // Current
    if (left is Current) {
      if (right is Current) {
        Current leftArg = left as Current;
        Current rightArg = right as Current;
        return stringsEqual(leftArg.scope, rightArg.scope);
      }
      return false;
    }

    // FunctionRef
    if (left is FunctionRef) {
      if (right is FunctionRef) {
        FunctionRef leftArg = left as FunctionRef;
        FunctionRef rightArg = right as FunctionRef;
        return stringsEqual(leftArg.libraryName, rightArg.libraryName) &&
            stringsEqual(leftArg.name, rightArg.name) &&
            operandsEqual(leftArg, rightArg);
      }
    }

    // ExpressionRef
    if (left is ExpressionRef) {
      if (right is ExpressionRef) {
        ExpressionRef leftArg = left as ExpressionRef;
        ExpressionRef rightArg = right as ExpressionRef;
        return stringsEqual(leftArg.libraryName, rightArg.libraryName) &&
            stringsEqual(leftArg.name, rightArg.name);
      }
      return false;
    }

    // Filter
    if (left is Filter) {
      if (right is Filter) {
        Filter leftArg = left as Filter;
        Filter rightArg = right as Filter;
        return expressionsEqual(leftArg.source, rightArg.source) &&
            expressionsEqual(leftArg.condition, rightArg.condition) &&
            stringsEqual(leftArg.scope, rightArg.scope);
      }
      return false;
    }

    // ForEach
    if (left is ForEach) {
      if (right is ForEach) {
        ForEach leftArg = left as ForEach;
        ForEach rightArg = right as ForEach;
        return expressionsEqual(leftArg.source, rightArg.source) &&
            expressionsEqual(leftArg.element, rightArg.element) &&
            stringsEqual(leftArg.scope, rightArg.scope);
      }
      return false;
    }

    // IdentifierRef
    if (left is IdentifierRef) {
      if (right is IdentifierRef) {
        IdentifierRef leftArg = left as IdentifierRef;
        IdentifierRef rightArg = right as IdentifierRef;
        return stringsEqual(leftArg.libraryName, rightArg.libraryName) &&
            stringsEqual(leftArg.name, rightArg.name);
      }
      return false;
    }

    // If
    if (left is If) {
      if (right is If) {
        If leftArg = left as If;
        If rightArg = right as If;
        return expressionsEqual(leftArg.condition, rightArg.condition) &&
            expressionsEqual(leftArg.thenExpr, rightArg.thenExpr) &&
            expressionsEqual(leftArg.elseExpr, rightArg.elseExpr);
      }
      return false;
    }

    // Instance
    if (left is Instance) {
      if (right is Instance) {
        Instance leftArg = left as Instance;
        Instance rightArg = right as Instance;
        if (!qnamesEqual(leftArg.classType, rightArg.classType)) {
          return false;
        }
        if (leftArg.elements != null &&
            rightArg.elements != null &&
            leftArg.elements.length == rightArg.elements.length) {
          for (int i = 0; i < leftArg.elements.length; i++) {
            InstanceElement leftElement = leftArg.elements[i];
            InstanceElement rightElement = rightArg.elements[i];
            if (!stringsEqual(leftElement.name, rightElement.name) ||
                !expressionsEqual(leftElement.value, rightElement.value)) {
              return false;
            }
          }
          return true;
        }
        return false;
      }
      return false;
    }

    // Iteration
    if (left is Iteration) {
      if (right is Iteration) {
        Iteration leftArg = left as Iteration;
        Iteration rightArg = right as Iteration;
        return stringsEqual(leftArg.scope, rightArg.scope);
      }
      return false;
    }

    // MaxValue
    if (left is MaxValue) {
      if (right is MaxValue) {
        MaxValue leftArg = left as MaxValue;
        MaxValue rightArg = right as MaxValue;
        return qnamesEqual(leftArg.valueType, rightArg.valueType);
      }
      return false;
    }

    // MinValue
    if (left is MinValue) {
      if (right is MinValue) {
        MinValue leftArg = left as MinValue;
        MinValue rightArg = right as MinValue;
        return qnamesEqual(leftArg.valueType, rightArg.valueType);
      }
      return false;
    }

    // Null
    if (left == null) {
      if (right == null) {
        return true;
      }
      return false;
    }

    // OperandRef
    if (left is OperandRef) {
      if (right is OperandRef) {
        OperandRef leftArg = left as OperandRef;
        OperandRef rightArg = right as OperandRef;
        return stringsEqual(leftArg.name, rightArg.name);
      }
      return false;
    }

    // Property
    if (left is Property) {
      if (right is Property) {
        Property leftArg = left as Property;
        Property rightArg = right as Property;
        return stringsEqual(leftArg.scope, rightArg.scope) &&
            stringsEqual(leftArg.path, rightArg.path);
      }
      return false;
    }

    // Query
    if (left is Query) {
      if (right is Query) {
        Query leftArg = left as Query;
        Query rightArg = right as Query;
        // Add comparison logic for Query if needed
        return true; // Adjust this based on comparison logic
      }
      return false;
    }
    return false;
  }

  bool operandsEqual_FunctionRef(FunctionRef left, FunctionRef right) {
    if (left.operand != null &&
        right.operand != null &&
        left.operand.length == right.operand.length) {
      for (int i = 0; i < left.operand.length; i++) {
        if (!expressionsEqual(left.operand[i], right.operand[i])) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  bool operandsEqual_BinaryExpression(
      BinaryExpression left, BinaryExpression right) {
    if (left.operand.length == right.operand.length) {
      for (int i = 0; i < left.operand.length; i++) {
        if (!expressionsEqual(left.operand[i], right.operand[i])) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  bool operandsEqual_TernaryExpression(
      TernaryExpression left, TernaryExpression right) {
    if (left.operand.length == right.operand.length) {
      for (int i = 0; i < left.operand.length; i++) {
        if (!expressionsEqual(left.operand[i], right.operand[i])) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  bool operandsEqual_NaryExpression(NaryExpression left, NaryExpression right) {
    if (left.operand != null &&
        right.operand != null &&
        left.operand.length == right.operand.length) {
      for (int i = 0; i < left.operand.length; i++) {
        if (!expressionsEqual(left.operand[i], right.operand[i])) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  bool operatorExpressionsEqual(
      OperatorExpression left, OperatorExpression right) {
    if (left == null && right == null) {
      return true;
    }

    if (right == null) {
      return false;
    }

    // UnaryExpression
    if (left is UnaryExpression) {
      if (right is UnaryExpression) {
        UnaryExpression leftArg = left;
        UnaryExpression rightArg = right;
        return unaryExpressionsEqual(leftArg, rightArg);
      }

      return false;
    }

    // BinaryExpression
    if (left is BinaryExpression) {
      if (right is BinaryExpression) {
        BinaryExpression leftArg = left;
        BinaryExpression rightArg = right;
        return binaryExpressionsEqual(leftArg, rightArg);
      }

      return false;
    }

    // TernaryExpression
    if (left is TernaryExpression) {
      if (right is TernaryExpression) {
        TernaryExpression leftArg = left;
        TernaryExpression rightArg = right;
        return ternaryExpressionsEqual(leftArg, rightArg);
      }

      return false;
    }

    // NaryExpression
    if (left is NaryExpression) {
      if (right is NaryExpression) {
        NaryExpression leftArg = left;
        NaryExpression rightArg = right;
        return naryExpressionsEqual(leftArg, rightArg);
      }

      return false;
    }

    if (!left.runtimeType.toString().contains(right.runtimeType.toString())) {
      return false;
    }

    // Round
    if (left is Round) {
      if (right is Round) {
        Round leftArg = left;
        Round rightArg = right;
        return expressionsEqual(leftArg.operand, rightArg.operand) &&
            expressionsEqual(leftArg.precision, rightArg.precision);
      }

      return false;
    }

    // Combine
    if (left is Combine) {
      if (right is Combine) {
        Combine leftArg = left;
        Combine rightArg = right;
        return expressionsEqual(leftArg.source, rightArg.source) &&
            expressionsEqual(leftArg.separator, rightArg.separator);
      }

      return false;
    }

    // Split
    if (left is Split) {
      if (right is Split) {
        Split leftArg = left;
        Split rightArg = right;
        return expressionsEqual(
                leftArg.stringToSplit, rightArg.stringToSplit) &&
            expressionsEqual(leftArg.separator, rightArg.separator);
      }

      return false;
    }

    // SplitOnMatches
    if (left is SplitOnMatches) {
      if (right is SplitOnMatches) {
        SplitOnMatches leftArg = left;
        SplitOnMatches rightArg = right;
        return expressionsEqual(
                leftArg.stringToSplit, rightArg.stringToSplit) &&
            expressionsEqual(
                leftArg.separatorPattern, rightArg.separatorPattern);
      }

      return false;
    }

    // PositionOf
    if (left is PositionOf) {
      if (right is PositionOf) {
        PositionOf leftArg = left;
        PositionOf rightArg = right;
        return expressionsEqual(leftArg.string, rightArg.string) &&
            expressionsEqual(leftArg.pattern, rightArg.pattern);
      }

      return false;
    }

    // LastPositionOf
    if (left is LastPositionOf) {
      if (right is LastPositionOf) {
        LastPositionOf leftArg = left;
        LastPositionOf rightArg = right;
        return expressionsEqual(leftArg.string, rightArg.string) &&
            expressionsEqual(leftArg.pattern, rightArg.pattern);
      }

      return false;
    }

    // Substring
    if (left is Substring) {
      if (right is Substring) {
        Substring leftArg = left;
        Substring rightArg = right;
        return expressionsEqual(leftArg.stringToSub, rightArg.stringToSub) &&
            expressionsEqual(leftArg.startIndex, rightArg.startIndex) &&
            expressionsEqual(leftArg.length, rightArg.length);
      }

      return false;
    }

    // TimeOfDay
    if (left is TimeOfDay) {
      if (right is TimeOfDay) {
        TimeOfDay leftArg = left as TimeOfDay;
        TimeOfDay rightArg = right as TimeOfDay;
        return expressionsEqual(leftArg.hour, rightArg.hour) &&
            expressionsEqual(leftArg.minute, rightArg.minute) &&
            expressionsEqual(leftArg.second, rightArg.second) &&
            expressionsEqual(leftArg.millisecond, rightArg.millisecond);
      }

      return false;
    }

    // Today
    if (left is Today) {
      if (right is Today) {
        return true; // Today Expression has no parameters to compare
      }

      return false;
    }

    // Now
    if (left is Now) {
      if (right is Now) {
        return true; // Now Expression has no parameters to compare
      }

      return false;
    }

    bool operandsEqual(FunctionRef left, FunctionRef right) {
      if (left.getOperand() != null &&
          right.getOperand() != null &&
          left.getOperand().length == right.getOperand().length) {
        for (int i = 0; i < left.getOperand().length; i++) {
          if (!expressionsEqual(left.getOperand()[i], right.getOperand()[i])) {
            return false;
          }
        }
        return true;
      }
      return false;
    }

    bool operatorExpressionsEqual(
        OperatorExpression left, OperatorExpression right) {
      if (left == null && right == null) {
        return true;
      }
      if (right == null) {
        return false;
      }

      if (left is UnaryExpression && right is UnaryExpression) {
        UnaryExpression leftArg = left;
        UnaryExpression rightArg = right;
        return unaryExpressionsEqual(leftArg, rightArg);
      }

      if (left is BinaryExpression && right is BinaryExpression) {
        BinaryExpression leftArg = left;
        BinaryExpression rightArg = right;
        return binaryExpressionsEqual(leftArg, rightArg);
      }

      if (left is TernaryExpression && right is TernaryExpression) {
        TernaryExpression leftArg = left;
        TernaryExpression rightArg = right;
        return ternaryExpressionsEqual(leftArg, rightArg);
      }

      if (left is NaryExpression && right is NaryExpression) {
        NaryExpression leftArg = left;
        NaryExpression rightArg = right;
        return naryExpressionsEqual(leftArg, rightArg);
      }

      // Handle other Expression types...
      // TimeOfDay, Today, Now, and other specific Expression types

      return true;
    }

    return true;
  }

  bool operandsEqual(UnaryExpression left, UnaryExpression right) {
    return expressionsEqual(left.getOperand(), right.getOperand());
  }

  bool unaryExpressionsEqual(UnaryExpression left, UnaryExpression right) {
    if (left == null && right == null) {
      return true;
    }

    if (right == null) {
      return false;
    }

    if (left.runtimeType != right.runtimeType) {
      return false;
    }

    if (!operandsEqual(left, right)) {
      return false;
    }

    if (left is As && right is As) {
      As leftArg = left;
      As rightArg = right;
      return qnamesEqual(leftArg.getAsType(), rightArg.getAsType()) &&
          typeSpecifiersEqual(
              leftArg.getAsTypeSpecifier(), rightArg.getAsTypeSpecifier()) &&
          leftArg.isStrict() == rightArg.isStrict();
    }

    if (left is CanConvert && right is CanConvert) {
      CanConvert leftArg = left as CanConvert;
      CanConvert rightArg = right as CanConvert;
      return qnamesEqual(leftArg.getToType(), rightArg.getToType()) &&
          typeSpecifiersEqual(
              leftArg.getToTypeSpecifier(), rightArg.getToTypeSpecifier());
    }

    if (left is Convert && right is Convert) {
      Convert leftArg = left;
      Convert rightArg = right;
      return qnamesEqual(leftArg.getToType(), rightArg.getToType()) &&
          typeSpecifiersEqual(
              leftArg.getToTypeSpecifier(), rightArg.getToTypeSpecifier());
    }

    if (left is DateTimeComponentFrom) {
      if (right is DateTimeComponentFrom) {
        DateTimeComponentFrom leftArg = left as DateTimeComponentFrom;
        DateTimeComponentFrom rightArg = right as DateTimeComponentFrom;
        return leftArg.getPrecision() == rightArg.getPrecision();
      }
      return false;
    }

    if (left is Is) {
      if (right is Is) {
        Is leftArg = left;
        Is rightArg = right;
        return qnamesEqual(leftArg.getIsType(), rightArg.getIsType()) &&
            typeSpecifiersEqual(
                leftArg.getIsTypeSpecifier(), rightArg.getIsTypeSpecifier());
      }
      return false;
    }

    return true;
  }

  bool binaryExpressionsEqual(BinaryExpression left, BinaryExpression right) {
    if (left == null && right == null) {
      return true;
    }

    if (right == null) {
      return false;
    }

    if (left.runtimeType != right.runtimeType) {
      return false;
    }

    if (!operandsEqual(left, right)) {
      return false;
    }

    // Handle special cases for operators that have a precision modifier
    // TODO: Implement logic for specific binary expressions

    return true;
  }

  bool ternaryExpressionsEqual(
      TernaryExpression left, TernaryExpression right) {
    if (left == null && right == null) {
      return true;
    }

    if (right == null) {
      return false;
    }

    if (left.runtimeType != right.runtimeType) {
      return false;
    }

    if (!operandsEqual(left, right)) {
      return false;
    }

    // ReplaceMatches
    return true;
  }

  bool naryExpressionsEqual(NaryExpression left, NaryExpression right) {
    if (left == null && right == null) {
      return true;
    }

    if (right == null) {
      return false;
    }

    if (left.runtimeType != right.runtimeType) {
      return false;
    }

    if (!operandsEqual(left, right)) {
      return false;
    }

    // Coalesce
    // Concatenate
    // Except
    // Intersect
    // Union
    return false;
  }

  bool aggregateExpressionsEqual(
      AggregateExpression left, AggregateExpression right) {
    if (left == null && right == null) {
      return true;
    }

    if (right == null) {
      return false;
    }

    if (left.runtimeType != right.runtimeType) {
      return false;
    }

    if (!expressionsEqual(left.getSource(), right.getSource()) ||
        left.getPath() != right.getPath()) {
      return false;
    }

    // Aggregate
    if (left is Aggregate) {
      if (right is Aggregate) {
        Aggregate leftArg = left;
        Aggregate rightArg = right;
        return expressionsEqual(
                leftArg.getInitialValue(), rightArg.getInitialValue()) &&
            expressionsEqual(leftArg.getIteration(), rightArg.getIteration());
      }
    }
    // Count
    // Sum
    // Product
    // Min
    // Max
    // Avg
    // GeometricMean
    // Median
    // Mode
    // Variance
    // StdDev
    // PopulationVariance
    // PopulationStdDev
    // AllTrue
    // AnyTrue

    return true;
  }
}
