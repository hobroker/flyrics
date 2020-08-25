import 'dart:io';

class ShellApi {
  Future<String> _exec(String cmd, List<String> args) async {
    try {
      final ProcessResult result = await Process.run(cmd, args);

      return result.stdout.trim();
    } catch (e) {
      print('error');
      print(e.error);

      throw e;
    }
  }

  Future<String> exec(String cmd, {List<String> args: const []}) async {
    String result = await this._exec(cmd, args);

    return result.trim();
  }

  Future<String> runAppleScript(String cmd) async {
    String result = await this.exec('osascript', args: ['-e $cmd']);

    return result;
  }
}
