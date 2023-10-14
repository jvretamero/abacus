import 'package:abacus/domain/calculator.dart';
import 'package:test/test.dart';

void main() {
  group('Input', () {
    test('single digit number', () {
      final calculator = Calculator();

      calculator.onNumber(1);

      expect(calculator.currentNumber, 1);
    });

    test('multiple digits', () {
      final calculator = Calculator();

      calculator.onNumber(2);
      calculator.onNumber(3);

      expect(calculator.currentNumber, 23);
    });
  });
}
