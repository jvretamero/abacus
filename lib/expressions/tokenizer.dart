import 'tokens.dart';

class Tokenizer {
  final String _expression;
  int _pos = -1;
  int _char = -1;

  Tokenizer(this._expression);

  Iterable<Token> getTokens() sync* {
    while (_nextChar() > -1) {
      if (_isNumber()) {
        int startPos = _pos;
        eatWhile(_isNumber);

        String numberStr = _expression.substring(startPos, _pos);
        yield NumberToken(double.parse(numberStr));
      } else {
        yield UnknownToken();
      }
    }
  }

  bool _movePos() {
    if (++_pos >= _expression.length) {
      return false;
    }

    return true;
  }

  int _getChar() {
    return _char = _pos > -1 && _pos < _expression.length
        ? _expression.codeUnitAt(_pos)
        : -1;
  }

  int _nextChar() {
    while (_movePos()) {
      _getChar();

      if (!_isWhitespace()) {
        break;
      }
    }

    return _getChar();
  }

  bool _isWhitespace() {
    return _char == ' '.codeUnitAt(0);
  }

  void eatWhile(bool Function() func) {
    while (_char > -1 && func()) {
      _nextChar();
    }
  }

  bool _isNumber() => _char >= '0'.codeUnitAt(0) && _char <= '9'.codeUnitAt(0);
}
