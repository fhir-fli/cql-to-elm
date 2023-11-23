import 'package:cql_to_elm/model/model.dart';
import 'package:test/test.dart';

void main() {
  test('parseTest1', () {
    var genericClassSignatureParser =
        GenericClassSignatureParser(genericSignature: 'MyType<M,N>');
    if (genericClassSignatureParser.isValidGenericSignature()) {
      var signature = genericClassSignatureParser.parseGenericSignature();
      expect(signature.name, equals('MyType'));
      expect(signature.genericParameters.length, equals(2));
      expect(signature.genericParameters[0].identifier, equals('M'));
      expect(signature.genericParameters[1].identifier, equals('N'));
    } else {
      fail('Invalid generic class');
    }
  });

  test('parseTest2', () {
    var collectionType = ClassType('Collection', null, null);
    var resolvedTypes = <String, DataType>{'Collection': collectionType};
    var genericClassSignatureParser = GenericClassSignatureParser(
        genericSignature: 'MyType<M extends Collection,N>',
        resolvedTypes: resolvedTypes);
    if (genericClassSignatureParser.isValidGenericSignature()) {
      var signature = genericClassSignatureParser.parseGenericSignature();
      expect(signature.name, equals('MyType'));
      expect(signature.genericParameters.length, equals(2));
      expect(signature.genericParameters[0].identifier, equals('M'));
      expect(signature.genericParameters[0].constraint,
          equals(TypeParameterConstraint.TYPE));
      expect((signature.genericParameters[0].constraintType as ClassType).name,
          equals('Collection'));
      expect(signature.genericParameters[1].identifier, equals('N'));
    } else {
      fail('Invalid generic class');
    }
  });

  test('parseTest3', () {
    var collectionType = ClassType('Collection', null, null);
    var objectType = ClassType('Object', null, null);
    var resolvedTypes = <String, DataType>{
      'Collection': collectionType,
      'Object': objectType
    };
    var genericClassSignatureParser = GenericClassSignatureParser(
        genericSignature: 'MyType<M extends Collection,N extends Object>',
        resolvedTypes: resolvedTypes);
    if (genericClassSignatureParser.isValidGenericSignature()) {
      var signature = genericClassSignatureParser.parseGenericSignature();
      expect(signature.name, equals('MyType'));
      expect(signature.genericParameters.length, equals(2));
      expect(signature.genericParameters[0].identifier, equals('M'));
      expect(signature.genericParameters[0].constraint,
          equals(TypeParameterConstraint.TYPE));
      expect((signature.genericParameters[0].constraintType as ClassType).name,
          equals('Collection'));
      expect(signature.genericParameters[1].identifier, equals('N'));
      expect(signature.genericParameters[1].constraint,
          equals(TypeParameterConstraint.TYPE));
      expect((signature.genericParameters[1].constraintType as ClassType).name,
          equals('Object'));
    } else {
      fail('Invalid generic class');
    }
  });

  test('parseTest4', () {
    try {
      var collectionType = ClassType('Collection', null, null);
      var resolvedTypes = <String, DataType>{'Collection': collectionType};
      var genericClassSignatureParser = GenericClassSignatureParser(
          genericSignature: 'MyType<M constrains Collection>',
          resolvedTypes: resolvedTypes);
      genericClassSignatureParser.parseGenericSignature();
      fail('Exception should be thrown for invalid parameter syntax');
    } catch (e) {
      expect(
          e.toString(),
          equals(
              'Exception: Invalid parameter syntax: M constrains Collection'));
    }
  });

  test('parseTest5', () {
    var objectType = ClassType('Object', null, null);
    var listType = ClassType('List', null, null);
    listType.addGenericParameter(TypeParameter('T'));
    listType.elements.add(ClassTypeElement('elements', TypeParameter('T')));
    var resolvedTypes = <String, DataType>{
      'Object': objectType,
      'List': listType
    };
    var genericClassSignatureParser = GenericClassSignatureParser(
        genericSignature: 'MyType<M extends List<Object>>',
        resolvedTypes: resolvedTypes);
    if (genericClassSignatureParser.isValidGenericSignature()) {
      var signature = genericClassSignatureParser.parseGenericSignature();
      expect(signature.name, equals('MyType'));
      expect(signature.genericParameters.length, equals(1));
      expect(signature.genericParameters[0].identifier, equals('M'));
      expect(signature.genericParameters[0].constraint,
          equals(TypeParameterConstraint.TYPE));
      var listOfObject =
          signature.genericParameters[0].constraintType as ClassType;
      expect(listOfObject.name, equals('List[Object]'));
      expect(listOfObject.elements.length, equals(1));
      expect(
          (listOfObject.elements[0].type as ClassType).name, equals('Object'));
    } else {
      fail('Invalid generic class');
    }
  });

  test('parseTest6', () {
    var objectType = ClassType('Object', null, null);
    var stringType = SimpleType('String', null);
    var listType = ClassType('List', null, null);
    listType.addGenericParameter(TypeParameter('T'));
    listType.elements.add(ClassTypeElement('elements', TypeParameter('T')));
    var mapType = ClassType('Map', null, null);
    mapType.addGenericParameter(TypeParameter('K'));
    mapType.addGenericParameter(TypeParameter('V'));
    mapType.addElement(ClassTypeElement('keys', TypeParameter('K')));
    mapType.addElement(ClassTypeElement('values', TypeParameter('V')));
    var resolvedTypes = <String, DataType>{
      'Object': objectType,
      'String': stringType,
      'List': listType,
      'Map': mapType
    };
    var genericClassSignatureParser = GenericClassSignatureParser(
        genericSignature: 'MyType<M extends Map<String,List<Object>>>',
        resolvedTypes: resolvedTypes);
    if (genericClassSignatureParser.isValidGenericSignature()) {
      var signature = genericClassSignatureParser.parseGenericSignature();
      expect(signature.name, equals('MyType'));
      expect(signature.genericParameters.length, equals(1));
      expect(signature.genericParameters[0].identifier, equals('M'));
      expect(signature.genericParameters[0].constraint,
          equals(TypeParameterConstraint.TYPE));
      var map = signature.genericParameters[0].constraintType as ClassType;
      expect(map.name, equals('Map[String,List[Object]]'));
      expect(map.elements.length, equals(2));
      expect((map.elements[0].type as SimpleType).name, equals('String'));
      expect((map.elements[1].type as ClassType).name, equals('List[Object]'));
    } else {
      fail('Invalid generic class');
    }
  });

  test('parseTest7', () {
    var integerType = SimpleType('Integer', null);
    var stringType = SimpleType('String', null);
    var listType = ClassType('List', null, null);
    listType.addGenericParameter(TypeParameter('T'));
    listType.elements.add(ClassTypeElement('elements', TypeParameter('T')));
    var mapType = ClassType('Map', null, null);
    mapType.addGenericParameter(TypeParameter('K'));
    mapType.addGenericParameter(TypeParameter('V'));
    mapType.addElement(ClassTypeElement('keys', TypeParameter('K')));
    mapType.addElement(ClassTypeElement('values', TypeParameter('V')));
    var resolvedTypes = <String, DataType>{
      'Integer': integerType,
      'String': stringType,
      'List': listType,
      'Map': mapType
    };
    var genericClassSignatureParser = GenericClassSignatureParser(
        genericSignature:
            'MyType<M extends Map<String,List<Map<String,Integer>>>>',
        resolvedTypes: resolvedTypes);
    if (genericClassSignatureParser.isValidGenericSignature()) {
      var signature = genericClassSignatureParser.parseGenericSignature();
      expect(signature.name, equals('MyType'));
      expect(signature.genericParameters.length, equals(1));
      expect(signature.genericParameters[0].identifier, equals('M'));
      expect(signature.genericParameters[0].constraint,
          equals(TypeParameterConstraint.TYPE));
      var map = signature.genericParameters[0].constraintType as ClassType;
      expect(map.name, equals('Map[String,List[Map[String,Integer]]]'));
      expect(map.elements.length, equals(2));
      expect((map.elements[0].type as SimpleType).name, equals('String'));
      expect((map.elements[1].type as ClassType).name,
          equals('List[Map[String,Integer]]'));
    } else {
      fail('Invalid generic class');
    }
  });
}
