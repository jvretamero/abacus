import 'package:abacus/domain/localization_provider.dart';

class Calculator {
  final StringBuffer _buffer = StringBuffer();
  late LocalizationProvider _localizationProvider;
  double _leftOperand = 0;

  Calculator(LocalizationProvider localizationProvider) {
    _localizationProvider = localizationProvider;
  }

  double get _currentNumber {
    if (_buffer.isEmpty) return 0;
    return _localizationProvider.parse(_currentNumberText);
  }

  String get _currentNumberText => _buffer.toString();

  double calculate() {
    return _leftOperand + _currentNumber;
  }

  void onNumber(int number) {
    _buffer.write(number);
  }

  void onDecimal() {
    var numberText = _currentNumberText;
    if (numberText.contains(_localizationProvider.decimalSeparator)) return;

    _buffer.write(_localizationProvider.decimalSeparator);
  }

  void onAdd() {
    _leftOperand = _currentNumber;
    _buffer.clear();
  }
}
