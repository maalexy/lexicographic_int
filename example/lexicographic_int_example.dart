import 'package:lexicographic_int/lexicographic_int.dart';

main() {
  String bigNumber1 = '61241643';
  String bigNumber2 = '17568876414';
  String encNumber1 = encode(bigNumber1);
  String encNumber2 = encode(bigNumber2);
  print(encNumber1); // ^^861241643
  print(encNumber2); // ^^^21117568876414

  String encNumber3 = '^^3157';
  String encNumber4 = '--743';
  print(decode(encNumber3)); // '157'
  print(decode(encNumber4)); // '-67'
}
