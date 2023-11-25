import 'package:cql_to_elm/model/model.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

class ModelInfoComparer {
  void compareModelInfo() async {
    // Simulate JAXB.unmarshal(...) with ModelInfo class instantiation
    final XmlDocument aModelInfoFile =
        await readXmlFile('resources/a-modelinfo.xml');
    ModelInfo a = ModelInfo.fromXml(aModelInfoFile);

    final XmlDocument bModelInfoFile =
        await readXmlFile('resources/b-modelinfo.xml');
    ModelInfo b = ModelInfo.fromXml(bModelInfoFile);

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

  void compareMATModelInfo() async {
    final XmlDocument aModelInfoFile =
        await readXmlFile('resources/fhir-modelinfo-4.0.1.xml');
    ModelInfo a = ModelInfo.fromXml(aModelInfoFile);

    final XmlDocument bModelInfoFile =
        await readXmlFile('resources/mat-fhir-modelinfo-4.0.1.xml');
    ModelInfo b = ModelInfo.fromXml(bModelInfoFile);

    ModelInfoCompareContext differences = new ModelInfoCompareContext();
    _compareModelInfo(differences, a, b);
    expect(differences.length(), equals(0));
  }

  void compareNewModelInfo() async {
    final XmlDocument aModelInfoFile =
        await readXmlFile('resources/fhir-modelinfo-4.0.1.xml');
    ModelInfo a = ModelInfo.fromXml(aModelInfoFile);

    final XmlDocument bModelInfoFile =
        await readXmlFile('resources/new-fhir-modelinfo-4.0.1.xml');
    ModelInfo b = ModelInfo.fromXml(bModelInfoFile);

    ModelInfoCompareContext differences = new ModelInfoCompareContext();
    _compareModelInfo(differences, a, b);
    expect(
        differences.toString(),
        equals("ModelInfo.DeviceRequest.primaryCodePath: codeCodeableConcept <> code%n" +
            "ModelInfo.DetectedIssue.primaryCodePath: category <> code%n" +
            "ModelInfo.BodyStructure.primaryCodePath: null <> location%n" +
            "ModelInfo.PractitionerRole.primaryCodePath: null <> code%n" +
            "ModelInfo.RelatedPerson.primaryCodePath: null <> relationship%n" +
            "ModelInfo.AdverseEvent.primaryCodePath: type <> event%n" +
            "ModelInfo.Location.primaryCodePath: null <> type%n"));
  }

  void compareMetadataModelInfo() async {
    final XmlDocument aModelInfoFile =
        await readXmlFile('resources/fhir-modelinfo-4.0.1-1.5.1.xml');
    ModelInfo a = ModelInfo.fromXml(aModelInfoFile);

    final XmlDocument bModelInfoFile =
        await readXmlFile('resources/fhir-modelinfo-4.0.1-with-metadata.xml');
    ModelInfo b = ModelInfo.fromXml(bModelInfoFile);

    ModelInfoCompareContext differences = new ModelInfoCompareContext();
    _compareModelInfo(differences, a, b);

    /// Comparison of 1.5.1 model info with 1.5.2, the only difference is the addition of metadata:
    expect(
        differences.toString(),
        equals("ModelInfo.markdown.Element value in right only%n" + // redeclaration for metadata
            "ModelInfo.SimpleQuantity.primaryCodePath: code <> null%n" + // primaryCodePath should not be set on a non-retrievable type
            "ModelInfo.SimpleQuantity.Element value in left only%n" + // SimpleQuantity is derived from Quantity, no need to re-declare elements
            "ModelInfo.SimpleQuantity.Element unit in left only%n" + // ditto
            "ModelInfo.SimpleQuantity.Element system in left only%n" + // ditto
            "ModelInfo.SimpleQuantity.Element code in left only%n" + // ditto
            "ModelInfo.MoneyQuantity.primaryCodePath: code <> null%n" + // primaryCodePath should not be set on a non-retrievable type
            "ModelInfo.MoneyQuantity.Element value in left only%n" + // MoneyQuantity is derived from Quantity, no need to re-declare elements
            "ModelInfo.MoneyQuantity.Element comparator in left only%n" + // ditto
            "ModelInfo.MoneyQuantity.Element unit in left only%n" + // ditto
            "ModelInfo.MoneyQuantity.Element system in left only%n" + // ditto
            "ModelInfo.MoneyQuantity.Element code in left only%n" + // ditto
            "ModelInfo.uuid.Element value in right only%n" + // redeclartion for metadata
            "ModelInfo.ElementDefinition.Type.targetProfile.name: targetProfile <> profile%n" + // backwards compatible, but more accurate ElementDefinition.Type
            "ModelInfo.ElementDefinition.Type.versioning.name: versioning <> targetProfile%n" + // ditto
            "ModelInfo.ElementDefinition.Type.versioning.type: FHIR.ReferenceVersionRules <> List<FHIR.canonical>%n" + // ditto
            "ModelInfo.ElementDefinition.Type.Element aggregation in right only%n" + // ditto
            "ModelInfo.ElementDefinition.Type.Element versioning in right only%n" + // ditto
            "ModelInfo.unsignedInt.Element value in right only%n" + // redeclaration for metdata
            "ModelInfo.id.Element value in right only%n" + // redeclaration for metdata
            "ModelInfo.url.Element value in right only%n" + // redeclaration for metdata
            "ModelInfo.canonical.Element value in right only%n" + // redeclaration for metdata
            "ModelInfo.code.Element value in right only%n" + // redeclaration for metdata
            "ModelInfo.oid.Element value in right only%n" + // redeclaration for metdata
            "ModelInfo.positiveInt.Element value in right only%n")); // redeclaration for metdata
  }

  void _compareModelInfo(
      ModelInfoCompareContext context, ModelInfo a, ModelInfo b) {
    compareAttributeString(context, "url", a.url, b.url);
    compareAttributeString(context, "version", a.version, b.version);
    compareAttributeString(context, "targetUrl", a.targetUrl, b.targetUrl);
    compareAttributeString(
        context, "targetVersion", a.targetVersion, b.targetVersion);
    compareAttributeString(
        context, "defaultContext", a.defaultContext, b.defaultContext);
    compareAttributeString(
        context, "patientClassName", a.patientClassName, b.patientClassName);
    compareAttributeString(context, "patientClassIdentifier",
        a.patientClassIdentifier, b.patientClassIdentifier);
    compareAttributeString(context, "patientBirthDatePropertyName",
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

  void compareAttributeString(ModelInfoCompareContext context,
      String attributeName, String? a, String? b) {
    if (a != b) {
      if (a == null && b == null) {
        return;
      }
      context.append('$attributeName: $a <> $b');
    }
  }

  void compareAttributeBool(
      ModelInfoCompareContext context, String attributeName, bool? a, bool? b) {
    if (a != b) {
      if (a == null && b == null) {
        return;
      }
      context.append('$attributeName: $a <> $b');
    }
  }

  void compareModelSpecifier(
      ModelInfoCompareContext context, ModelSpecifier? a, ModelSpecifier? b) {
    if (a == null && b == null) {
      return context.append("Model specifier not defined");
    } else if (a == null) {
      context.append("Model specifier ${b!.name}|${b.version} in right only");
    } else if (b == null) {
      context.append("Model specifier ${a.name}|${a.version} in left only");
    } else {
      compareAttributeString(context, "version", a.version, b.version);
    }
  }

  String? descriptor(NamedTypeSpecifier? namedTypeSpecifier) {
    if (namedTypeSpecifier != null) {
      if (namedTypeSpecifier.namespace != null) {
        return '${namedTypeSpecifier.namespace}.${namedTypeSpecifier.name}';
      }

      if (namedTypeSpecifier.modelName != null) {
        return '${namedTypeSpecifier.modelName}.${namedTypeSpecifier.name}';
      }

      return namedTypeSpecifier.name;
    }

    return null;
  }
}

String descriptor(IntervalTypeSpecifier intervalTypeSpecifier) {
  if (intervalTypeSpecifier != null) {
    return 'Interval<${descriptor(intervalTypeSpecifier.pointTypeSpecifier)}>';
  }

  return null;
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
