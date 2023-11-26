// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'q_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QName _$QNameFromJson(Map<String, dynamic> json) => QName(
      json['namespaceURI'] as String,
      json['localPart'] as String,
      json['prefix'] as String? ?? "",
    );

Map<String, dynamic> _$QNameToJson(QName instance) => <String, dynamic>{
      'namespaceURI': instance.namespaceURI,
      'localPart': instance.localPart,
      'prefix': instance.prefix,
    };
