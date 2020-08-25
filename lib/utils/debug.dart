import 'dart:convert';

void debug(key, value) {
  print('>| $key: $value');
}

String stringify(Map json, [bool beautify = false]) {
  var indent = beautify ? '  ' : '';
  var encoder = JsonEncoder.withIndent(indent);
  var string = encoder.convert(json);

  return string;
}
