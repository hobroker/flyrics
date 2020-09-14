import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConfigService {
  final Map env;

  ConfigService(this.env);

  static Future<ConfigService> init() async {
    await DotEnv().load('.env');

    return ConfigService(DotEnv().env);
  }

  String get(String key) => env[key];
}
