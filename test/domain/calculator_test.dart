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

      expect(calculator.currentNumber, 1);
    });

    test('multiple digits', () {
      calculator.onNumber(2);
      calculator.onNumber(3);

      expect(calculator.currentNumber, 23);
    });
  });

  group('Decimal separator', () {
    test('accept decimal separator', () {
      calculator.onNumber(1);
      calculator.onDecimal();
      calculator.onNumber(1);

      expect(calculator.currentNumber, 1.1);
    });

    test('parse number with only integer digits', () {
      calculator.onNumber(1);
      calculator.onDecimal();

      expect(calculator.currentNumber, 1);
    });

    test('accept only one decimal separator', () {
      calculator.onNumber(1);
      calculator.onDecimal();
      calculator.onDecimal();

      expect(calculator.currentNumber, 1);
    });

    test('accept number with only decimal digits', () {
      calculator.onDecimal();
      calculator.onNumber(1);

      expect(calculator.currentNumber, 0.1);
    });
  });
}
