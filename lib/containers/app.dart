import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flyrics/containers/home_page.dart';
import 'package:flyrics/hooks/injections.dart';
import 'package:flyrics/modules/i18n_delegate.dart';
import 'package:flyrics/modules/mobx/o.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final ux = useUX();

    return O(
      () => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [i18nDelegate],
        supportedLocales: [Locale('en', '')],
        builder: FlutterI18n.rootAppBuilder(),
        home: HomePage(),
        theme: ux.theme,
      ),
    );
  }
}
