import 'dart:convert';

import 'package:flutter/foundation.dart';

void debug(key, value) {
  debugPrint('>| $key: $value');
}

String stringify(Map json, [bool beautify = false]) {
  var indent = beautify ? '  ' : '';
  var encoder = JsonEncoder.withIndent(indent);
  var string = encoder.convert(json);

  return string;
}
