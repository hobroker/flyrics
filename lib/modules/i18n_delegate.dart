import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flyrics/constants/asset.dart';
import 'package:flyrics/utils/debug.dart';

final i18nDelegate = FlutterI18nDelegate(
  translationLoader: FileTranslationLoader(
    basePath: AssetConstants.i18nBasePath,
  ),
  missingTranslationHandler: (key, locale) {
    var code = locale.languageCode;
    debug('Missing translation', '$key, languageCode: ${code}');
  },
);
