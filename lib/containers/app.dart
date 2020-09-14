import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flyrics/containers/home_page.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/modules/i18n_delegate.dart';
import 'package:flyrics/modules/injection/injection.dart';
import 'package:flyrics/stores/player.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final api = useApi();

    return Injection(
      provider: (get) => PlayerStore(
        terminalService: api.terminal,
        geniusService: api.genius,
        spotifyService: api.spotify,
        ux: get(),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [i18nDelegate],
        supportedLocales: [Locale('en', '')],
        builder: FlutterI18n.rootAppBuilder(),
        home: HomePage(),
      ),
    );
  }
}
