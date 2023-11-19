import 'package:abacus/expressions/tokenizer.dart';
import 'package:abacus/expressions/tokens.dart';
import 'package:test/test.dart';

void main() {
  group('Tokenizer', () {
    test('single digit number', () {
      var tokenizer = Tokenizer('1');
      var tokens = tokenizer.getTokens().toList();
      expect(tokens, [NumberToken(1)]);
    });

    test('multi digit number', () {
      var tokenizer = Tokenizer('246');
      var tokens = tokenizer.getTokens().toList();
      expect(tokens, [NumberToken(246)]);
    });

    test('ignore whitespace', () {
      var tokenizer = Tokenizer('  975 ');
      var tokens = tokenizer.getTokens().toList();
      expect(tokens, [NumberToken(975)]);
    });
  });
}
