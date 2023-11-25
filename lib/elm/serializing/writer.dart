import 'dart:async';
import 'dart:typed_data';

abstract class Closeable {
  Future<void> close();
}

abstract class Writer implements Closeable {
  Uint16List? writeBuffer;
  static const int WRITE_BUFFER_SIZE = 1024;
  Object lock;

  static Writer nullWriter() {
    return NullWriter();
  }

  Writer() : lock = Object();

  Writer.withLock(this.lock);

  void write(int c) {
    synchronized(lock, () {
      if (writeBuffer == null) {
        writeBuffer = Uint16List(1024);
      }

      writeBuffer![0] = c;
      writeStringOffset(String.fromCharCode(c), 0, 1);
    });
  }

  void writeString(String str) {
    writeStringOffset(str, 0, str.length);
  }

  void writeStringOffset(String str, int offset, int length) {
    writeString(str.substring(offset, offset + length));
  }

  Writer append(Object? csq) {
    writeString(csq.toString());
    return this;
  }

  Writer appendRange(Object? csq, int start, int end) {
    var stringToAppend = csq?.toString() ?? 'null';
    writeStringOffset(stringToAppend, start, end - start);
    return this;
  }

  Writer appendChar(int c) {
    write(c);
    return this;
  }

  @override
  Future<void> close() async {
    throw UnimplementedError();
  }

  Future<void> flush() async {
    throw UnimplementedError();
  }
}

class NullWriter extends Writer {
  @override
  void write(int c) {}

  @override
  Future<void> flush() async {}

  @override
  Future<void> close() async {}
}

typedef void LockFunction();

void synchronized(Object lock, LockFunction function) {
  // Implementation of synchronized function...
}
