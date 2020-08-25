import 'package:flutter_dotenv/flutter_dotenv.dart';

class Secrets {
  static Future init() {
    return DotEnv().load('.env');
  }

  static String getEnv(String key) {
    return DotEnv().env[key];
  }
}
