/// Lexicographically sortable encoding of integer numbers.
library lexicographic_int;

const String defaultMinusCharacter = '-';
// ASCII code of '+' is lower than any number's ASCII code. '^' is higher.
const String defaultPlusCharacter = '^';

/// Encodes the [intString] to a lexicographically sortable string
/// Instead of '+', the '^' character is used, because ASCII codes.
/// [intString] should be in RegExp('[+-]?\\d+') format, ex. -15, +12, 764
String encode(String intString,
    {String minusCharacter = defaultMinusCharacter,
    String plusCharacter = defaultPlusCharacter,
    bool borrowNegative = false}) {
  if (intString == '0') return '0';
  final splitter = RegExp('([+-])?(\\d+)');
  if (!splitter.hasMatch(intString)) {
    throw FormatException(
        '$intString should be in [+-sign (optional)][integer part] format.');
  }
  final match = splitter.firstMatch(intString);
  final isNegative = match.group(1) == '-' || borrowNegative;
  final integerPart = match.group(2);
  var result = '';
  if (integerPart.length > 1) {
    result = encode(integerPart.length.toString(), borrowNegative: isNegative);
  }
  if (isNegative) {
    var negated = '';
    for (int i = 0; i < integerPart.length; ++i) {
      negated += _negDigit(integerPart[i]);
    }
    result = minusCharacter + result + negated;
  } else {
    result = plusCharacter + result + intString;
  }
  return result;
}

/// Decodes a lexicographically sortable number to an integer string.
String decode(
  String encInteger, {
  String minusCharacter = defaultMinusCharacter,
  String plusCharacter = defaultPlusCharacter,
}) {
  if (encInteger[0] == '0') return '0';
  String prefix;
  if (encInteger[0] == minusCharacter) {
    prefix = '-';
    encInteger = encInteger
        .replaceAll(minusCharacter, '')
        .replaceAllMapped(RegExp('\\d'), (mc) => _negDigit(mc.group(0)));
  } else {
    prefix = ''; // or // '+';
    encInteger = encInteger.replaceAll(plusCharacter, '');
  }
  var pos = 0;
  var len = 1;
  while ((pos + len) < encInteger.length) {
    var newLen = int.parse(encInteger.substring(pos, pos + len));
    pos += len;
    len = newLen;
  }
  return prefix + encInteger.substring(pos, pos + len);
}

String _negDigit(String digit) {
  switch (digit) {
    case '0':
      return '9';
    case '1':
      return '8';
    case '2':
      return '7';
    case '3':
      return '6';
    case '4':
      return '5';
    case '5':
      return '4';
    case '6':
      return '3';
    case '7':
      return '2';
    case '8':
      return '1';
    case '9':
      return '0';
    default:
      return '';
  }
}
