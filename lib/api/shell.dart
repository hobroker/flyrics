import 'dart:io';

class Shell {
  static Future<String> _exec(String cmd, List<String> args) async {
    try {
      final ProcessResult result = await Process.run(cmd, args);

      return result.stdout.trim();
    } catch (e) {
      print(e.error);

      throw e;
    }
  }

  static Future<String> exec(String cmd, {List<String> args: const []}) async {
    String result = await Shell._exec(cmd, args);

    return result.trim();
  }

  static Future<String> runAppleScript(String cmd) async {
    String result = await Shell.exec('osascript', args: ['-e $cmd']);

    return result;
  }
}
