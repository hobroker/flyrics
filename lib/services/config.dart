import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@immutable
class ConfigService {
  final Map env;

  const ConfigService(this.env);

  static Future<ConfigService> create([String filename = '.env']) async {
    final dotenv = DotEnv();
    await dotenv.load(filename);

    return ConfigService(dotenv.env);
  }

  String get(String key) {
    if (has(key)) {
      return env[key];
    }

    throw Exception('no config value found for key "$key');
  }

  bool has(String key) => env.containsKey(key);
}
