import 'package:cql_to_elm/model/model.dart';
import 'package:test/test.dart';

void main() {
  test('parseTest1', () {
    var genericClassSignatureParser = GenericClassSignatureParser(
        genericSignature: 'MyType<M,N>', resolvedTypes: {});
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

  // More tests...
}
