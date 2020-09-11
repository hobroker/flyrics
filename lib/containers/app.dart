import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flyrics/containers/home_page.dart';
import 'package:flyrics/modules/i18n_delegate.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [i18nDelegate],
      supportedLocales: [Locale('en', '')],
      builder: FlutterI18n.rootAppBuilder(),
      home: HomePage(),
    );
  }
}
