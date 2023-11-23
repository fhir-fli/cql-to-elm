import 'package:json_annotation/json_annotation.dart';

part 'type_specifiers.g.dart';

@JsonSerializable()
class TypeSpecifier {}

@JsonSerializable()
class NamedTypeSpecifier extends TypeSpecifier {
  String? modelName;
  String? namespace;
  String? name;

  NamedTypeSpecifier({this.modelName, this.namespace, this.name});

  factory NamedTypeSpecifier.fromJson(Map<String, dynamic> json) =>
      _$NamedTypeSpecifierFromJson(json);

  Map<String, dynamic> toJson() => _$NamedTypeSpecifierToJson(this);
}
