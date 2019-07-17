import 'package:lexicographic_int/lexicographic_int.dart';

main() {
  final bigNumber1 = '61241643';
  final bigNumber2 = '17568876414';
  final encNumber1 = encode(bigNumber1);
  final encNumber2 = encode(bigNumber2);
  print(encNumber1);
  print(encNumber2);

  final encNumber3 = '^^3157';
  final encNumber4 = '--743';
  assert(decode(encNumber3) == '157');
  assert(decode(encNumber4) == '-67');
}
