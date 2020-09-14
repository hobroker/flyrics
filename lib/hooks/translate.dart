import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

Translate useI18n() {
  final context = useContext();

  return (key, [params = const <String, String>{}]) {
    return FlutterI18n.translate(
      context,
      key,
      translationParams: params,
    );
  };
}

String useTranslation(String key, [Map<String, String> params = const {}]) =>
    useI18n()(key, params);

typedef Translate = String Function(String, [Map<String, String>]);
