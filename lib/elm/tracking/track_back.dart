import '../../cql_lm/cql_lm.dart';

class TrackBack {
  final VersionedIdentifier library;
  final int startLine;
  final int startChar;
  final int endLine;
  final int endChar;

  TrackBack(
    this.library,
    this.startLine,
    this.startChar,
    this.endLine,
    this.endChar,
  );

  VersionedIdentifier getLibrary() {
    return library;
  }

  int getStartLine() {
    return startLine;
  }

  int getStartChar() {
    return startChar;
  }

  int getEndLine() {
    return endLine;
  }

  int getEndChar() {
    return endChar;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }
    if (runtimeType != o.runtimeType) {
      return false;
    }

    TrackBack trackBack = o as TrackBack;

    return endChar == trackBack.endChar &&
        endLine == trackBack.endLine &&
        startChar == trackBack.startChar &&
        startLine == trackBack.startLine &&
        library == trackBack.library;
  }

  @override
  int get hashCode {
    int result = library.hashCode;
    result = 31 * result + startLine.hashCode;
    result = 31 * result + startChar.hashCode;
    result = 31 * result + endLine.hashCode;
    result = 31 * result + endChar.hashCode;
    return result;
  }

  @override
  String toString() {
    return 'TrackBack{library: $library, startLine: $startLine, startChar: $startChar, endLine: $endLine, endChar: $endChar}';
  }

  String toLocator() {
    return startLine == endLine && startChar == endChar
        ? '$startLine:$startChar'
        : '$startLine:$startChar-$endLine:$endChar';
  }
}
