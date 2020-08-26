import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flyrics/utils/debug.dart';

var i18nDelegate = FlutterI18nDelegate(
  translationLoader: FileTranslationLoader(
    fallbackFile: 'en',
    basePath: 'assets/i18n',
    forcedLocale: Locale('en'),
  ),
  missingTranslationHandler: (key, locale) {
    var code = locale.languageCode;
    debug('Missing translation', '$key, languageCode: ${code}');
  },
);
