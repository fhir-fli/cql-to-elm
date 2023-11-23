import 'src.dart';

class ProfileType extends ClassType {
  ProfileType(String name, DataType baseType, List<ClassTypeElement> elements)
      : super(name, baseType, elements);

  ProfileType.empty() : super('', null, []);

  ProfileType.withName(String name) : super(name, null, []);

  ProfileType.withBaseType(String name, DataType baseType)
      : super(name, baseType);
}
