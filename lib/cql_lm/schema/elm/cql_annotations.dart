import 'package:json_annotation/json_annotation.dart';

part 'cql_annotations.g.dart';

@JsonSerializable()
abstract class CqlToElmBase {}

@JsonSerializable()
class Annotation {
  Annotation({this.s, this.locator});
  Narrative? s;
  Locator? locator;

  factory Annotation.fromJson(Map<String, dynamic> json) =>
      _$AnnotationFromJson(json);

  Map<String, dynamic> toJson() => _$AnnotationToJson(this);
}

@JsonSerializable()
class Locator {
  Locator({this.startLine, this.startChar, this.endLine, this.endChar});

  int? startLine;
  int? startChar;
  int? endLine;
  int? endChar;

  factory Locator.fromJson(Map<String, dynamic> json) =>
      _$LocatorFromJson(json);

  Map<String, dynamic> toJson() => _$LocatorToJson(this);
}

@JsonSerializable()
class Narrative {
  Narrative({this.s, this.r});

  List<Narrative>? s;
  String? r;

  factory Narrative.fromJson(Map<String, dynamic> json) =>
      _$NarrativeFromJson(json);

  Map<String, dynamic> toJson() => _$NarrativeToJson(this);
}

enum ErrorSeverity { info, warning, error }

enum ErrorType {
  environment,
  syntax,
  include,
  semantic,
  internal,
}

@JsonSerializable()
class CqlToElmError extends Locator {
  CqlToElmError({
    required this.message,
    this.errorType = ErrorType.internal,
    this.errorSeverity = ErrorSeverity.error,
    this.targetIncludeLibraryId,
    this.targetIncludeLibraryVersionId,
  });

  String message;
  ErrorType errorType;
  ErrorSeverity? errorSeverity;
  String? targetIncludeLibraryId;
  String? targetIncludeLibraryVersionId;

  factory CqlToElmError.fromJson(Map<String, dynamic> json) =>
      _$CqlToElmErrorFromJson(json);

  Map<String, dynamic> toJson() => _$CqlToElmErrorToJson(this);
}

@JsonSerializable()
class CqlToElmInfo {
  CqlToElmInfo({
    this.translatorVersion,
    this.translatorOptions,
  });

  String? translatorVersion;
  String? translatorOptions;

  factory CqlToElmInfo.fromJson(Map<String, dynamic> json) =>
      _$CqlToElmInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CqlToElmInfoToJson(this);
}
