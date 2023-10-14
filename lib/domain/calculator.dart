class Calculator {
  final StringBuffer _buffer = StringBuffer();

  double get currentNumber => double.parse(_buffer.toString());

  void onNumber(int number) {
    _buffer.write(number);
  }
}
