sealed class Token {}

class UnknownToken implements Token {}

class NumberToken implements Token {
  double number;

  NumberToken(this.number);

  @override
  bool operator ==(Object other) {
    return other is NumberToken && number == other.number;
  }

  @override
  int get hashCode => number.hashCode;

  @override
  String toString() {
    return 'NumberToken($number)';
  }
}
