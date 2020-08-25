import 'package:flutter_dotenv/flutter_dotenv.dart';

class Secrets {
  static Future<Secrets> init() async {
    await DotEnv().load('.env');

    return Secrets();
  }

  String getEnv(String key) => DotEnv().env[key];
}
