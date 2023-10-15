import 'package:abacus/domain/localization_provider.dart';
import 'package:abacus/domain/operation.dart';

class Calculator {
  final StringBuffer _buffer = StringBuffer();
  late LocalizationProvider _localizationProvider;
  double _leftOperand = 0;
  Operation _operation = Operation.none;

  Calculator(LocalizationProvider localizationProvider) {
    _localizationProvider = localizationProvider;
  }

  double get _currentNumber {
    if (_buffer.isEmpty) return 0;
    return _localizationProvider.parse(_currentNumberText);
  }

  String get _currentNumberText => _buffer.toString();

  double calculate() {
    switch (_operation) {
      case Operation.add:
        return _leftOperand + _currentNumber;
      case Operation.subtract:
        return _leftOperand - _currentNumber;
      default:
        return _currentNumber;
    }
  }

  void onNumber(int number) {
    _buffer.write(number);
  }

  void onDecimal() {
    var numberText = _currentNumberText;
    if (numberText.contains(_localizationProvider.decimalSeparator)) return;

    _buffer.write(_localizationProvider.decimalSeparator);
  }

  void _setOperation(Operation operation) {
    _operation = operation;
    _leftOperand = _currentNumber;
    _buffer.clear();
  }

  void onAdd() {
    _setOperation(Operation.add);
  }

  void onSubtract() {
    _setOperation(Operation.subtract);
  }
}
