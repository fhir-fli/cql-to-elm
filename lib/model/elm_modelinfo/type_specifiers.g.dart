// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_specifiers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeSpecifier _$TypeSpecifierFromJson(Map<String, dynamic> json) =>
    TypeSpecifier();

Map<String, dynamic> _$TypeSpecifierToJson(TypeSpecifier instance) =>
    <String, dynamic>{};

NamedTypeSpecifier _$NamedTypeSpecifierFromJson(Map<String, dynamic> json) =>
    NamedTypeSpecifier(
      modelName: json['modelName'] as String?,
      namespace: json['namespace'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$NamedTypeSpecifierToJson(NamedTypeSpecifier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('modelName', instance.modelName);
  writeNotNull('namespace', instance.namespace);
  writeNotNull('name', instance.name);
  return val;
}
