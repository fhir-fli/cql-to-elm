import 'src.dart';

class InvalidRedeclarationException implements Exception {
  InvalidRedeclarationException(this.message);

  InvalidRedeclarationException.withElements(ClassType classType,
      ClassTypeElement original, ClassTypeElement redeclared) {
    message =
        '${classType.getName()}.${redeclared.getName()} cannot be redeclared '
        'with type ${redeclared.getType()} because it is not a subtype of the '
        'original element type ${original.getType()}';
  }

  late final String message;
}
