import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flyrics/constants/asset_constants.dart';
import 'package:flyrics/utils/debug.dart';

final i18nDelegate = FlutterI18nDelegate(
  translationLoader: FileTranslationLoader(
    fallbackFile: 'en',
    basePath: AssetConstants.i18nBasePath,
    forcedLocale: Locale('en'),
  ),
  missingTranslationHandler: (key, locale) {
    var code = locale.languageCode;
    debug('Missing translation', '$key, languageCode: ${code}');
  },
);
