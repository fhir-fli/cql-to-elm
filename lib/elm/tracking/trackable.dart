import 'package:uuid/uuid.dart';

import '../../model/model.dart';
import 'tracking.dart';

class Trackable {
  final String trackerId;
  final List<TrackBack> trackbacks = [];
  DataType? resultType;

  Trackable() : trackerId = Uuid().v4();

  String getTrackerId() {
    return trackerId;
  }

  List<TrackBack> getTrackbacks() {
    return trackbacks;
  }

  DataType? getResultType() {
    return resultType;
  }

  void setResultType(DataType? resultType) {
    this.resultType = resultType;
  }

  Trackable withResultType(DataType? resultType) {
    setResultType(resultType);
    return this;
  }
}
