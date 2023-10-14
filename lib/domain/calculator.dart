import 'package:abacus/domain/localization_provider.dart';

class Calculator {
  final StringBuffer _buffer = StringBuffer();
  late LocalizationProvider _localizationProvider;

  Calculator(LocalizationProvider localizationProvider) {
    _localizationProvider = localizationProvider;
  }

  double get currentNumber => _localizationProvider.parse(_buffer.toString());

  void onNumber(int number) {
    _buffer.write(number);
  }

  void onDecimal() {
    _buffer.write(_localizationProvider.decimalDigit);
  }
}
