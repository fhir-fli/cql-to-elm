import 'package:cql_to_elm/model/model.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

class ModelInfoComparer {
  void compareModelInfo() async {
    // Simulate JAXB.unmarshal(...) with ModelInfo class instantiation
    final XmlDocument aModelInfoFile = await readXmlFile('a-modelinfo.xml');
    ModelInfo a = ModelInfo.fromXml(
        aModelInfoFile); // Replace with actual XML parsing logic

    final XmlDocument bModelInfoFile = await readXmlFile('b-modelinfo.xml');
    ModelInfo b = ModelInfo.fromXml(
        bModelInfoFile); // Replace with actual XML parsing logic

    ModelInfoCompareContext differences = ModelInfoCompareContext();
    _compareModelInfo(differences, a, b);

    expect(
      differences.toString(),
      equals('ModelInfo.Type info allowedUnits in left only\n'
          'ModelInfo.Conversion from FHIR.Count to System.Quantity in left only\n'
          'ModelInfo.Conversion from FHIR.Age to System.Quantity in left only\n'
          'ModelInfo.Conversion from FHIR.MoneyQuantity to System.Quantity in left only\n'
          'ModelInfo.Conversion from FHIR.Distance to System.Quantity in left only\n'
          'ModelInfo.Conversion from FHIR.Duration to System.Quantity in left only\n'
          'ModelInfo.Conversion from FHIR.id to System.String in left only\n'
          'ModelInfo.Conversion from FHIR.SimpleQuantity to System.Quantity in left only\n'),
    );
  }

  void _compareModelInfo(
      ModelInfoCompareContext context, ModelInfo a, ModelInfo b) {
    compareAttribute(context, "url", a.url, b.url);
    compareAttribute(context, "version", a.version, b.version);
    compareAttribute(context, "targetUrl", a.targetUrl, b.targetUrl);
    compareAttribute(
        context, "targetVersion", a.targetVersion, b.targetVersion);
    compareAttribute(
        context, "defaultContext", a.defaultContext, b.defaultContext);
    compareAttribute(
        context, "patientClassName", a.patientClassName, b.patientClassName);
    compareAttribute(context, "patientClassIdentifier",
        a.patientClassIdentifier, b.patientClassIdentifier);
    compareAttribute(context, "patientBirthDatePropertyName",
        a.patientBirthDatePropertyName, b.patientBirthDatePropertyName);

    // requiredModelInfo
    var msa = Map.fromIterable(a.requiredModelInfo ?? [],
        key: (v) => v.name, value: (v) => v);
    var msb = Map.fromIterable(b.requiredModelInfo ?? [],
        key: (v) => v.name, value: (v) => v);

    for (var ms in msa.entries) {
      var msOther = msb[ms.key];
      compareModelSpecifier(context, ms.value, msOther);
    }

    for (var ms in msb.entries) {
      var msOther = msa[ms.key];
      if (msOther == null) {
        compareModelSpecifier(context, msOther, ms.value);
      }
    }

    // typeInfo
    var tia = Map.fromEntries((a.typeInfo
                ?.where((x) => x is ClassInfo || x is SimpleTypeInfo) ??
            [])
        .map((TypeInfo e) =>
            MapEntry(e is ClassInfo ? e.name : (e as SimpleTypeInfo).name, e)));
    var tib = Map.fromEntries((b.typeInfo
                ?.where((x) => x is ClassInfo || x is SimpleTypeInfo) ??
            [])
        .map((k) =>
            MapEntry(k is ClassInfo ? k.name : (k as SimpleTypeInfo).name, k)));

    for (var ti in tia.entries) {
      var tiOther = tib[ti.key];
      compareTypeInfo(context, ti.value, tiOther);
    }

    for (var ti in tib.entries) {
      var tiOther = tia[ti.key];
      if (tiOther == null) {
        compareTypeInfo(context, tiOther, ti.value);
      }
    }

    // conversionInfo
    var cia =
        Map.fromEntries(a.conversionInfo.map((k) => MapEntry(k.fromType, k)));
    var cib =
        Map.fromEntries(b.conversionInfo.map((k) => MapEntry(k.fromType, k)));

    for (var ci in cia.entries) {
      var ciOther = cib[ci.key];
      compareConversionInfo(context, ci.value, ciOther);
    }

    for (var ci in cib.entries) {
      var ciOther = cia[ci.key];
      if (ciOther == null) {
        compareConversionInfo(context, ciOther, ci.value);
      }
    }

    // contextInfo
    var cxa = Map.fromEntries(a.contextInfo.map((k) => MapEntry(k.name, k)));
    var cxb = Map.fromEntries(b.contextInfo.map((k) => MapEntry(k.name, k)));

    for (var ci in cxa.entries) {
      var ciOther = cxb[ci.key];
      compareContextInfo(context, ci.value, ciOther);
    }

    for (var ci in cxb.entries) {
      var ciOther = cxa[ci.key];
      if (ciOther == null) {
        compareContextInfo(context, ciOther, ci.value);
      }
    }
  }

  void compareAttribute(ModelInfoCompareContext context, String attributeName,
      String? a, String? b) {
    if (a != b) {
      if (a == null && b == null) {
        return;
      }
      context.append('$attributeName: $a <> $b');
    }
  }

  void _compareAttribute(
      ModelInfoCompareContext context, String attributeName, bool? a, bool? b) {
    if (a != b) {
      if (a == null && b == null) {
        return;
      }
      context.append('$attributeName: $a <> $b');
    }
  }

  void compareModelSpecifier(
      ModelInfoCompareContext context, ModelSpecifier a, ModelSpecifier b) {
    if (a == null) {
      context.append(
          'Model specifier ${b.getName()}|${b.getVersion()} in right only');
    } else if (b == null) {
      context.append(
          'Model specifier ${a.getName()}|${a.getVersion()} in left only');
    } else {
      compareAttribute(context, 'version', a.getVersion(), b.getVersion());
    }
  }

  String descriptorNamedTypeSpecifier(NamedTypeSpecifier namedTypeSpecifier) {
    if (namedTypeSpecifier.namespace != null) {
      return '${namedTypeSpecifier.namespace}.${namedTypeSpecifier.name}';
    }

    if (namedTypeSpecifier.modelName != null) {
      return '${namedTypeSpecifier.modelName}.${namedTypeSpecifier.name}';
    }

    return namedTypeSpecifier.name;

    return null;
  }

  String descriptorIntervalTypeSpecifier(
      IntervalTypeSpecifier intervalTypeSpecifier) {
    if (intervalTypeSpecifier != null) {
      return 'Interval<${descriptor(intervalTypeSpecifier.pointType, intervalTypeSpecifier.pointTypeSpecifier)}>';
    }

    return null;
  }

  String descriptorListTypeSpecifier(ListTypeSpecifier listTypeSpecifier) {
    if (listTypeSpecifier != null) {
      return 'List<${descriptor(listTypeSpecifier.elementType, listTypeSpecifier.elementTypeSpecifier)}>';
    }

    return null;
  }

  String descriptor(TupleTypeSpecifier tupleTypeSpecifier) {
    if (tupleTypeSpecifier != null) {
      // TODO: Expand this...
      return 'Tuple<...>';
    }

    return null;
  }

  String descriptor(ChoiceTypeSpecifier choiceTypeSpecifier) {
    if (choiceTypeSpecifier != null) {
      // TODO: Expand this
      return 'Choice<...>';
    }

    return null;
  }

  String descriptor(TypeSpecifier typeSpecifier) {
    if (typeSpecifier is NamedTypeSpecifier) {
      return descriptor(typeSpecifier);
    }

    if (typeSpecifier is IntervalTypeSpecifier) {
      return descriptor(typeSpecifier);
    }

    if (typeSpecifier is ListTypeSpecifier) {
      return descriptor(typeSpecifier);
    }

    if (typeSpecifier is TupleTypeSpecifier) {
      return descriptor(typeSpecifier);
    }

    if (typeSpecifier is ChoiceTypeSpecifier) {
      return descriptor(typeSpecifier);
    }

    return null;
  }

  String descriptor(String elementType, TypeSpecifier elementTypeSpecifier) {
    return elementType;

    return descriptor(elementTypeSpecifier);
  }

  String descriptor(ListTypeInfo listTypeInfo) {
    return 'List<${descriptor(listTypeInfo.elementType, listTypeInfo.elementTypeSpecifier)}>';

    return null;
  }

  String descriptor(IntervalTypeInfo intervalTypeInfo) {
    return 'Interval<${descriptor(intervalTypeInfo.pointType, intervalTypeInfo.pointTypeSpecifier)}>';

    return null;
  }

  String descriptor(TupleTypeInfo tupleTypeInfo) {
    // TODO: Expand this
    return 'Tuple<...>';

    return null;
  }

  String descriptor(ChoiceTypeInfo choiceTypeInfo) {
    // TODO: Expand this
    return 'Choice<...>';

    return null;
  }

  String descriptor(TypeInfo typeInfo) {
    if (typeInfo is ClassInfo) {
      return (typeInfo).name;
    }
    if (typeInfo is SimpleTypeInfo) {
      return (typeInfo).name;
    }
    if (typeInfo is ListTypeInfo) {
      return descriptor(typeInfo);
    }
    if (typeInfo is IntervalTypeInfo) {
      return descriptor(typeInfo);
    }
    if (typeInfo is TupleTypeInfo) {
      return descriptor(typeInfo);
    }
    if (typeInfo is ChoiceTypeInfo) {
      return descriptor(typeInfo);
    }

    return null;
  }
}

class ModelInfoCompareContext {
  StringBuffer differences = StringBuffer();
  List<String> focusList = ['ModelInfo'];

  String getFocus() {
    return focusList.join(".");
  }

  void pushFocus(String newFocus) {
    focusList.add(newFocus);
  }

  void popFocus() {
    if (focusList.isNotEmpty) {
      focusList.removeLast();
    }
  }

  void append(String message) {
    differences.write('${getFocus()}.$message\n');
  }

  int length() {
    return differences.length;
  }

  @override
  String toString() {
    return differences.toString();
  }
}
