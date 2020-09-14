import 'package:flutter/cupertino.dart';
import 'package:flyrics/api/config.dart';
import 'package:flyrics/api/genius.dart';
import 'package:flyrics/api/http_client.dart';
import 'package:flyrics/api/spotify.dart';
import 'package:flyrics/api/terminal.dart';
import 'package:flyrics/constants/ux.dart';
import 'package:flyrics/modules/injection/injection.dart';

@immutable
class ServicesInjector extends StatelessWidget {
  final ConfigService config;
  final Widget child;

  const ServicesInjector({
    Key key,
    @required this.config,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Injection(
      providers: () => [
        (_) => HttpClient(),
        (_) => TerminalService(),
        (_) => UX(),
        (get) => SpotifyService(client: get(), terminal: get()),
        (get) => GeniusService(config: config, client: get()),
      ],
      child: child,
    );
  }
}
