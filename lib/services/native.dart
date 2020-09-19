import 'package:flutter/foundation.dart';
import 'package:flyrics/services/terminal.dart';

@immutable
class NativeService {
  final TerminalService terminal;

  const NativeService({
    @required this.terminal,
  });

  Future openUrl(String url) => terminal.exec('open', args: [url]);
}
