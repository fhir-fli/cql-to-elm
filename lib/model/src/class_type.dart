import 'src.dart';

class ClassType extends DataType implements NamedType {
  String? name;

  ClassType(this.name, super.baseType,
      [List<ClassTypeElement>? elements, List<TypeParameter>? parameters]) {
    if (name == null || name!.isEmpty) {
      throw ArgumentError("name is null");
    }

    this.name = name;

    if (parameters != null) {
      this.genericParameters.addAll(parameters);
    }

    if (elements != null) {
      this.elements.addAll(elements);
    }
  }

  @override
  String getName() => name!;

  String getNamespace() {
    if (name != null) {
      final qualifierIndex = name!.indexOf('.');
      if (qualifierIndex > 0) {
        return name!.substring(0, qualifierIndex);
      }
    }
    return '';
  }

  String getSimpleName() {
    if (name != null) {
      final qualifierIndex = name!.indexOf('.');
      if (qualifierIndex > 0) {
        return name!.substring(qualifierIndex + 1);
      }
    }
    return name!;
  }

  String? identifier;
  String? getIdentifier() => identifier;
  void setIdentifier(String identifier) {
    this.identifier = identifier;
  }

  String? label;
  String? getLabel() => label;
  void setLabel(String label) {
    this.label = label;
  }

  String? target;
  String? getTarget() => target;
  void setTarget(String target) {
    this.target = target;
  }

  bool retrievable = false;
  bool isRetrievable() => retrievable;
  void setRetrievable(bool retrievable) {
    this.retrievable = retrievable;
  }

  String? primaryCodePath;
  String? getPrimaryCodePath() => primaryCodePath;
  void setPrimaryCodePath(String primaryCodePath) {
    this.primaryCodePath = primaryCodePath;
  }

  String? primaryValueSetPath;
  String? getPrimaryValueSetPath() => primaryValueSetPath;
  void setPrimaryValueSetPath(String primaryValueSetPath) {
    this.primaryValueSetPath = primaryValueSetPath;
  }

  List<Relationship> relationships = [];
  Iterable<Relationship> getRelationships() => relationships;
  void addRelationship(Relationship relationship) {
    relationships.add(relationship);
  }

  List<Relationship> targetRelationships = [];
  Iterable<Relationship> getTargetRelationships() => targetRelationships;
  void addTargetRelationship(Relationship relationship) {
    targetRelationships.add(relationship);
  }

  List<SearchType> searches = [];
  Iterable<SearchType> getSearches() => searches;
  void addSearch(SearchType search) {
    searches.add(search);
  }

  SearchType? findSearch(String searchPath) {
    for (SearchType search in searches) {
      if (search.getName() == searchPath) {
        return search;
      }
    }
    return null;
  }

  List<TypeParameter> genericParameters = [];

  List<TypeParameter> getGenericParameters() {
    return genericParameters;
  }

  void setGenericParameters(List<TypeParameter> genericParameters) {
    this.genericParameters = genericParameters;
  }

  void addGenericParameter(TypeParameter genericParameter) {
    this.genericParameters.add(genericParameter);
  }

  void addGenericParameters(List<TypeParameter> parameters) {
    parameters.forEach(internalAddParameter);

    sortedElements = [];
    tupleType = null;
  }

  TypeParameter? getGenericParameterByIdentifier(String identifier) {
    return _getGenericParameterByIdentifier(identifier, false);
  }

  TypeParameter? _getGenericParameterByIdentifier(
      String identifier, bool inCurrentClassOnly) {
    TypeParameter? param;
    for (var genericParameter in genericParameters) {
      if (identifier.toLowerCase() ==
          genericParameter.getIdentifier().toLowerCase()) {
        param = genericParameter;
        break;
      }
    }
    if (!inCurrentClassOnly && param == null) {
      if (param == null && getBaseType() is ClassType) {
        param = (getBaseType() as ClassType)
            .getGenericParameterByIdentifier(identifier);
      }
    }
    return param;
  }

  List<ClassTypeElement> elements = [];
  List<ClassTypeElement> getElements() => elements;
  void addElement(ClassTypeElement element) {
    elements.add(element);
  }

  void addElements(Iterable<ClassTypeElement> elements) {
    for (var element in elements) {
      internalAddElement(element);
    }

    tupleType = null;
  }

  List<ClassTypeElement> sortedElements = [];
  List<ClassTypeElement> getSortedElements() {
    sortedElements = List.from(elements);
    sortedElements
        .sort((left, right) => left.getName().compareTo(right.getName()));
    return sortedElements;
  }

  Map<String, ClassTypeElement>? baseElementMap = null;

  Map<String, ClassTypeElement>? getBaseElementMap() {
    if (baseElementMap == null) {
      baseElementMap = <String, ClassTypeElement>{};
      if (getBaseType() is ClassType) {
        (getBaseType() as ClassType).gatherElements(baseElementMap!);
      }
    }
    return baseElementMap;
  }

  void gatherElements(Map<String, ClassTypeElement> elementMap) {
    if (getBaseType() is ClassType) {
      (getBaseType() as ClassType).gatherElements(elementMap);
    }

    for (ClassTypeElement element in elements) {
      elementMap[element.getName()] = element;
    }
  }

  List<ClassTypeElement> getAllElements() {
    // Get the baseClass elements into a map by name
    Map<String, ClassTypeElement>? elementMap = getBaseElementMap() ?? {};

    // Add this class's elements, overwriting baseClass definitions where applicable
    for (ClassTypeElement el in elements) {
      elementMap[el.getName()] = el;
    }

    return List<ClassTypeElement>.from(elementMap.values);
  }

  void internalAddElement(ClassTypeElement element) {
    var existingElement = getBaseElementMap()?[element.getName()];
    if (existingElement != null &&
        !(existingElement.getType() is TypeParameter) &&
        !(element.getType().isSubTypeOf(existingElement.getType()) ||
            (existingElement.getType() is ListType &&
                element.getType().isSubTypeOf(
                    (existingElement.getType() as ListType)
                        .getElementType())) ||
            (existingElement.getType() is IntervalType &&
                element.getType().isSubTypeOf(
                    (existingElement.getType() as IntervalType)
                        .getPointType())) ||
            (existingElement.getType() is ChoiceType &&
                element
                    .getType()
                    .isCompatibleWith(existingElement.getType())))) {
      throw InvalidRedeclarationException.withElements(
          this, existingElement, element);
    }

    elements.add(element);
  }

  void internalAddParameter(TypeParameter parameter) {
    // TODO: Flesh out and retain method only if needed.
    this.genericParameters.add(parameter);
  }

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object o) => o is ClassType && name == o.name;

  @override
  String toString() => name!;

  @override
  String toLabel() => label ?? name!;

  TupleType? tupleType;
  TupleType? getTupleType() {
    if (tupleType == null) {
      tupleType = buildTupleType();
    }
    return tupleType;
  }

  void addTupleElements(
      ClassType classType, Map<String, TupleTypeElement> elements) {
    DataType? baseType = classType.getBaseType();
    if (baseType is ClassType) {
      addTupleElements(baseType, elements);
    }

    for (ClassTypeElement element in classType.getElements()) {
      if (!element.isProhibited()) {
        TupleTypeElement tupleElement =
            TupleTypeElement(element.getName(), element.getType());
        elements[tupleElement.getName()] = tupleElement;
      }
    }
  }

  TupleType buildTupleType() {
    final Map<String, TupleTypeElement> tupleElements =
        <String, TupleTypeElement>{};

    addTupleElements(this, tupleElements);

    return TupleType(tupleElements.values.toList());
  }

  @override
  bool isCompatibleWith(DataType other) {
    if (other is TupleType) {
      final TupleType tupleType = other;
      return getTupleType() == tupleType;
    }

    return super.isCompatibleWith(other);
  }

  @override
  bool isGeneric() => genericParameters.isNotEmpty;

  @override
  bool isInstantiable(DataType callType, InstantiationContext context) {
    if (callType is ClassType) {
      final ClassType classType = callType;
      if (elements.length == classType.elements.length) {
        final theseElements = getSortedElements();
        final thoseElements = classType.getSortedElements();
        for (int i = 0; i < theseElements.length; i++) {
          if (!(theseElements[i].getName() == thoseElements[i].getName() &&
              theseElements[i]
                  .getType()
                  .isInstantiable(thoseElements[i].getType(), context))) {
            return false;
          }
        }
        return true;
      }
    }
    return false;
  }

  @override
  DataType instantiate(InstantiationContext context) {
    if (!isGeneric()) {
      return this;
    }

    final ClassType result = ClassType(getName(), getBaseType());
    for (int i = 0; i < elements.length; i++) {
      result.addElement(ClassTypeElement(
          elements[i].getName(), elements[i].getType().instantiate(context)));
    }
    return result;
  }
}
