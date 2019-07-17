import 'package:lexicographic_int/lexicographic_int.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('First Test', () {
      final bigNumber1 = '61241643';
      final bigNumber2 = '17568876414';
      final encNumber1 = encode(bigNumber1);
      final encNumber2 = encode(bigNumber2);
      expect(encNumber1, '^^861241643');
      expect(encNumber2, '^^^21117568876414');

      final encNumber3 = '^^3157';
      final encNumber4 = '--743';
      expect(decode(encNumber3), '157');
      expect(decode(encNumber4), '-56');
    });

    final testStrings = [
      '-12345678901',
      '-333333333',
      '-123456789',
      '-7413',
      '-8',
      '-2',
      '-1',
      '0',
      '1',
      '2',
      '7',
      '15',
      '81',
      '72434',
      '85425',
      '123456789',
      '1234567890',
      '12345678901234567890123',
    ];
    test('enc-dec sameness test', () {
      for (final str in testStrings) {
        expect(decode(encode(str)), str);
      }
    });

    test('enc sortedness test', () {
      final encStrings = testStrings.map(encode).toList();
      encStrings.sort();
      print(encStrings.join('\n'));
      for(int i = 0; i < encStrings.length; ++i) {
        expect(decode(encStrings[i]), testStrings[i]);
      }
    });
  });
}
