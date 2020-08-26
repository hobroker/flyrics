import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  final Map env;

  Config({this.env});

  static Future<Config> init() async {
    await DotEnv().load('.env');

    return Config(
      env: DotEnv().env,
    );
  }

  String get(String key) => env[key];
}
