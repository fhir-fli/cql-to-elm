import 'package:cql_to_elm/model/model.dart';
import 'package:test/test.dart';

void main() {
  test('testChoiceTypeIsCompatible', () {
    var first = ChoiceType([
      SimpleType('Period'),
      SimpleType('Interval'),
      SimpleType('DateTime'),
    ]);

    var second = ChoiceType([
      SimpleType('Period'),
      SimpleType('DateTime'),
    ]);

    expect(first.isCompatibleWith(second), isTrue);
    expect(second.isCompatibleWith(first), isTrue);

    expect(first.isSuperSetOf(second), isTrue);
    expect(first.isSubSetOf(second), isFalse);
    expect(second.isSubSetOf(first), isTrue);
    expect(second.isSuperSetOf(first), isFalse);
  });

  test('testChoiceTypeIsNotCompatible', () {
    var first = ChoiceType([
      SimpleType('Period'),
      SimpleType('Interval'),
      SimpleType('DateTime'),
    ]);

    var second = ChoiceType([
      SimpleType('Integer'),
      SimpleType('String'),
    ]);

    expect(first.isCompatibleWith(second), isFalse);
    expect(second.isCompatibleWith(first), isFalse);
    expect(first.isSubSetOf(second), isFalse);
    expect(first.isSuperSetOf(second), isFalse);
  });
}
