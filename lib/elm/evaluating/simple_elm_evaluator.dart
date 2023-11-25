import '../../model/model.dart';
import '../elm.dart';

class SimpleElmEvaluator {
  static final SimpleElmEngine engine = SimpleElmEngine();
  static SimpleElmEngine simpleElmEngine() {
    return engine;
  }

  static bool booleansEqual(Expression left, Expression right) {
    return engine.booleansEqual(left, right);
  }

  static bool integersEqual(Expression left, Expression right) {
    return engine.integersEqual(left, right);
  }

  static bool decimalsEqual(Expression left, Expression right) {
    return engine.decimalsEqual(left, right);
  }

  static bool stringsEqual(Expression left, Expression right) {
    return engine.stringsEqual(left, right);
  }

  static bool stringsEqual(String left, String right) {
    return engine.stringsEqual(left, right);
  }

  static bool dateTimesEqual(Expression left, Expression right) {
    return engine.dateTimesEqual(left, right);
  }

  static bool dateRangesEqual(Expression left, Expression right) {
    return engine.dateRangesEqual(left, right);
  }

  static bool codesEqual(Expression left, Expression right) {
    return engine.codesEqual(left, right);
  }
}
