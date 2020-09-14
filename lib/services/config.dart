import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConfigService {
  final Map env;

  ConfigService(this.env);

  static Future<ConfigService> create([String filename = '.env']) async {
    await DotEnv().load(filename);

    return ConfigService(DotEnv().env);
  }

  String get(String key) => env[key];
}
