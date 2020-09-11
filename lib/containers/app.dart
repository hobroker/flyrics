import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flyrics/containers/home_page.dart';
import 'package:flyrics/modules/i18n_delegate.dart';
import 'package:flyrics/modules/locator.dart';
import 'package:flyrics/stores/player_store.dart';

class App extends StatelessWidget {
  final _player = I<PlayerStore>();

  void _onInit() {
    _player.fetchIsRunning();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [i18nDelegate],
      supportedLocales: [Locale('en', '')],
      builder: FlutterI18n.rootAppBuilder(),
      home: HomePage(
        onInit: _onInit,
      ),
    );
  }
}
