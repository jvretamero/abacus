import 'package:abacus/domain/calculator.dart';
import 'package:abacus/domain/localization_provider.dart';
import 'package:test/test.dart';

void main() {
  late Calculator calculator;
  setUp(() async {
    var localizationProvider = LocalizationProviderImpl();
    await localizationProvider.loadLocale();

    calculator = Calculator(localizationProvider);
  });

  group('Input', () {
    test('single digit number', () {
      calculator.onNumber(1);

      expect(calculator.calculate(), 1);
    });

    test('multiple digits', () {
      calculator.onNumber(2);
      calculator.onNumber(3);

      expect(calculator.calculate(), 23);
    });
  });

  group('Decimal separator', () {
    test('accept decimal separator', () {
      calculator.onNumber(1);
      calculator.onDecimal();
      calculator.onNumber(1);

      expect(calculator.calculate(), 1.1);
    });

    test('parse number with only integer digits', () {
      calculator.onNumber(1);
      calculator.onDecimal();

      expect(calculator.calculate(), 1);
    });

    test('accept only one decimal separator', () {
      calculator.onNumber(1);
      calculator.onDecimal();
      calculator.onDecimal();

      expect(calculator.calculate(), 1);
    });

    test('accept number with only decimal digits', () {
      calculator.onDecimal();
      calculator.onNumber(1);

      expect(calculator.calculate(), 0.1);
    });
  });

  group('Addition operation', () {
    test('add two numbers', () {
      calculator.onNumber(1);
      calculator.onAdd();
      calculator.onNumber(1);

      expect(calculator.calculate(), 2);
    });

    test('return left operand when right operand is not provided', () {
      calculator.onNumber(1);
      calculator.onAdd();

      expect(calculator.calculate(), 1);
    });
  });
}
