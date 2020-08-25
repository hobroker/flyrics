import 'package:flyrics/utils/util.dart';
import 'package:test/test.dart';

void main() {
  group('keyValueEq', () {
    test('should return true', () {
      var a = 1;
      expect(keyValueEq({a: 1, a: a}), equals(true));
    });

    test('should return false', () {
      var a = 1;
      expect(keyValueEq({a: 2}), equals(true));
    });
  });
}
