import 'package:dart_automata/dart_automata.dart';
import 'package:test/test.dart';

void main() {
  group('Log probability with tropical semiring', () {
      test('Additive identity', () {
          expect(LogProb.multiplicative_identity + LogProb.additive_identity, LogProb.additive_identity);
      });

      test('Multiplicative identity', () {
          expect(LogProb.multiplicative_identity * LogProb.additive_identity, LogProb.multiplicative_identity);
      });

  });

  group('A group of tests', () {
    final awesome = Awesome();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);
    });
  });
}
