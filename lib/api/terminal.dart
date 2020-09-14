import 'dart:io';

import 'package:flyrics/utils/debug.dart';

class TerminalService {
  const TerminalService();

  Future<String> exec(String cmd, {List<String> args = const []}) async {
    var result = await _exec(cmd, args);

    return result.trim();
  }

  Future<String> runAppleScript(String cmd) async {
    var result = await exec('osascript', args: ['-e $cmd']);

    return result;
  }

  Future openUrl(String url) async {
    await exec('open', args: [url]);
  }

  Future<String> _exec(String cmd, List<String> args) async {
    try {
      var result = await Process.run(cmd, args);

      return result.stdout.trim();
    } catch (e) {
      debug('error', e.error);

      rethrow;
    }
  }
}
