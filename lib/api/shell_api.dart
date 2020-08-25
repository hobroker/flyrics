import 'dart:io';

class ShellApi {
  Future<String> _exec(String cmd, List<String> args) async {
    try {
      var result = await Process.run(cmd, args);

      return result.stdout.trim();
    } catch (e) {
      print('error');
      print(e.error);

      rethrow;
    }
  }

  Future<String> exec(String cmd, {List<String> args = const []}) async {
    var result = await _exec(cmd, args);

    return result.trim();
  }

  Future<String> runAppleScript(String cmd) async {
    var result = await exec('osascript', args: ['-e $cmd']);

    return result;
  }
}
