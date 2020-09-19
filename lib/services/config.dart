import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@immutable
class ConfigService {
  final Map _env;

  const ConfigService(this._env);

  static Future<ConfigService> create([String filename = '.env']) async {
    final dotenv = DotEnv();
    await dotenv.load(filename);

    return ConfigService(dotenv.env);
  }

  String get(String key) {
    if (_env.containsKey(key)) {
      return _env[key];
    }

    throw Exception('no config value found for key "$key');
  }
}
