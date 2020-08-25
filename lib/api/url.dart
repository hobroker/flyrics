import 'package:flyrics/api/shell_api.dart';

class UrlApi {
  final ShellApi shell;

  UrlApi({this.shell});

  Future openUrl(String url) async {
    await shell.exec('open', args: [url]);
  }
}
