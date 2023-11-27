import 'cql_model.dart';

class GenericClassSignatureParser {
  static final String OPEN_BRACKET = "<";
  static final String CLOSE_BRACKET = ">";
  static final String EXTENDS = "extends";

  int startPos = 0;
  int endPos = 0;
  int bracketCount = 0;
  int currentBracketPosition = 0;
  Map<String, DataType>? resolvedTypes;

  String genericSignature;
  String? baseType;
  String? boundGenericTypeName;

  GenericClassSignatureParser({
    required this.genericSignature,
    this.baseType,
    this.boundGenericTypeName,
    this.resolvedTypes,
  });

  String? getGenericSignature() {
    return genericSignature;
  }

  void setGenericSignature(String signature) {
    genericSignature = signature;
  }

  String? getBaseType() {
    return baseType;
  }

  void setBaseType(String type) {
    baseType = type;
  }

  String? getBoundGenericTypeName() {
    return boundGenericTypeName;
  }

  void setBoundGenericTypeName(String typeName) {
    boundGenericTypeName = typeName;
  }

  ClassType parseGenericSignature() {
    String? genericTypeName = genericSignature;
    List<String> params = [];

    if (isValidGenericSignature()) {
      genericTypeName =
          genericSignature.substring(0, genericSignature.indexOf('<'));

      String parameters = genericSignature.substring(
          genericSignature.indexOf('<') + 1, genericSignature.lastIndexOf('>'));

      params = escapeNestedCommas(parameters)?.split(",") ?? [];
    }

    String? baseTypeName = baseType;

    List<String>? baseTypeParameters;

    if (baseType?.contains("<") ?? false) {
      baseTypeName = baseType!.substring(0, baseType?.indexOf('<'));

      String? baseTypeParameterString = baseType!
          .substring(baseType!.indexOf('<') + 1, baseType!.lastIndexOf('>'));

      baseTypeParameters =
          escapeNestedCommas(baseTypeParameterString)?.split(",");
    }

    DataType baseDataType = resolveTypeName(baseTypeName);

    ClassType genericClassType = ClassType(genericTypeName, baseDataType);

    for (String param in params) {
      TypeParameter paramType =
          handleParameterDeclaration(unescapeNestedCommas(param));

      genericClassType.addGenericParameter(paramType);
    }

    if (baseTypeParameters != null) {
      int index = 0;
      for (String baseTypeParameter in baseTypeParameters) {
        if (baseTypeParameter.length == 1 &&
            genericClassType
                    .getGenericParameterByIdentifier(baseTypeParameter) ==
                null) {
          throw Exception("Cannot resolve symbol " + baseTypeParameter);
        } else {
          DataType boundType =
              resolveTypeName(unescapeNestedCommas(baseTypeParameter));
          ClassType baseTypeClass = baseDataType as ClassType;
          List<ClassTypeElement> baseClassFields = baseTypeClass.getElements();
          String myParam =
              baseTypeClass.getGenericParameters()[index].getIdentifier();
          print(boundType.toString() + " replaces param " + myParam);
          for (ClassTypeElement baseClassField in baseClassFields) {
            ClassTypeElement myElement =
                ClassTypeElement(baseClassField.getName(), boundType);
            genericClassType.addElement(myElement);
          }
        }
        index++;
      }
    }
    return genericClassType;
  }

  TypeParameter handleParameterDeclaration(String parameterString) {
    List<String> paramComponents = parameterString.split(RegExp(r'\s+'));
    if (paramComponents.length == 1) {
      return TypeParameter.withConstraint(
          parameterString.trim(), TypeParameterConstraint.NONE, null);
    } else if (paramComponents.length == 3) {
      if (paramComponents[1].toLowerCase() == EXTENDS) {
        return TypeParameter.withConstraint(paramComponents[0],
            TypeParameterConstraint.TYPE, resolveTypeName(paramComponents[2]));
      } else {
        throw Exception("Invalid parameter syntax: " + parameterString);
      }
    } else {
      throw Exception("Invalid parameter syntax: " + parameterString);
    }
  }

  DataType resolveTypeName(String? parameterType) {
    if (_isValidGenericSignature(parameterType)) {
      return handleBoundType(parameterType);
    } else {
      if (parameterType == null) {
        return DataType(null);
      } else {
        return resolveType(parameterType);
      }
    }
  }

  DataType handleBoundType(String? boundGenericSignature) {
    var resolvedType =
        resolvedTypes?[escapeNestedAngleBrackets(boundGenericSignature)]
            as ClassType?;
    if (resolvedType != null) {
      return resolvedType;
    } else {
      var genericTypeName = boundGenericSignature?.substring(
          0, boundGenericSignature.indexOf('<'));
      resolvedType = resolveType(genericTypeName) as ClassType?;
      if (resolvedType == null) {
        throw Exception('Unknown type $genericTypeName');
      }
      var newType = ClassType(
          escapeNestedAngleBrackets(boundGenericSignature), resolvedType);
      var parameters = boundGenericSignature?.substring(
          boundGenericSignature.indexOf('<') + 1,
          boundGenericSignature.lastIndexOf('>'));
      var params =
          parameters == null ? [] : escapeNestedCommas(parameters)!.split(',');
      var index = 0;
      for (var param in params) {
        DataType? boundParam;
        param = unescapeNestedCommas(param);
        if (_isValidGenericSignature(param)) {
          boundParam = handleBoundType(param);
        } else {
          boundParam = resolveType(param);
        }
        var typeParameter = resolvedType.getGenericParameters()[index];
        for (var classTypeElement in resolvedType.getElements()) {
          if (classTypeElement.getType() is TypeParameter) {
            if ((classTypeElement.getType() as TypeParameter)
                    .getIdentifier()
                    .toLowerCase() ==
                typeParameter.getIdentifier().toLowerCase()) {
              var newElement =
                  ClassTypeElement(classTypeElement.getName(), boundParam);
              newType.addElement(newElement);
            }
          }
        }
        index++;
      }
      resolvedTypes?[newType.getName()] = newType;
      return newType;
    }
  }

  bool isValidGenericSignature() {
    return _isValidGenericSignature(genericSignature);
  }

  bool _isValidGenericSignature(String? genericSignature) {
    return _areBracketsPaired(genericSignature) &&
        _closingBracketsComeAfterOpeningBrackets(genericSignature);
  }

  void initializeParser() {
    startPos = genericSignature.indexOf('<');
    endPos = genericSignature.lastIndexOf('>');
    bracketCount = openBracketCount();
  }

  int openBracketCount() {
    return _openBracketCount(genericSignature);
  }

  int _openBracketCount(String? signatureString) {
    int matchCount = 0;
    matchCount = signatureString == null
        ? 0
        : OPEN_BRACKET.allMatches(signatureString).length;
    return matchCount;
  }

  int closeBracketCount() {
    return _closeBracketCount(genericSignature);
  }

  int _closeBracketCount(String? signatureString) {
    int matchCount = 0;
    matchCount = signatureString == null
        ? 0
        : CLOSE_BRACKET.allMatches(signatureString).length;
    return matchCount;
  }

  bool areBracketsPaired() {
    return _areBracketsPaired(genericSignature);
  }

  bool _areBracketsPaired(String? signatureString) {
    bool paired = false;
    int openCount = _openBracketCount(signatureString);
    int closeCount = _closeBracketCount(signatureString);
    paired = (openCount == closeCount) && (openCount > 0);
    return paired;
  }

  bool closingBracketsComeAfterOpeningBrackets() {
    return _closingBracketsComeAfterOpeningBrackets(genericSignature);
  }

  bool _closingBracketsComeAfterOpeningBrackets(String? signatureString) {
    return signatureString != null &&
        signatureString.lastIndexOf('<') < signatureString.indexOf('>');
  }

  String? escapeNestedCommas(String? signature) {
    var signatureCharArray = signature?.runes.toList();
    var openBracketCount = 0;

    for (var index = 0; index < (signatureCharArray?.length ?? 0); index++) {
      var c = String.fromCharCode(signatureCharArray![index]);
      if (c == '<') {
        openBracketCount++;
      } else if (c == '>') {
        openBracketCount--;
      } else if (c == ',' && openBracketCount > 0) {
        signatureCharArray[index] = '|'.codeUnitAt(0);
      }
    }

    return signatureCharArray == null
        ? null
        : String.fromCharCodes(signatureCharArray);
  }

  String unescapeNestedCommas(String escapedSignature) {
    return escapedSignature.replaceAll(r"|", ",");
  }

  DataType resolveType(String? typeName) {
    if (typeName == null) {
      throw Exception('Unable to resolve $typeName');
    }
    var type = resolvedTypes?[typeName];
    if (type == null) {
      throw Exception('Unable to resolve $typeName');
    }
    return type;
  }

  String escapeNestedAngleBrackets(String? genericSignature) {
    return genericSignature?.replaceAll("<", "[").replaceAll(">", "]") ?? '';
  }
}
