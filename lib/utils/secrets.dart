import 'package:flutter_dotenv/flutter_dotenv.dart';

class Secrets {
  final Map env;

  Secrets({this.env});

  static Future<Secrets> init() async {
    await DotEnv().load('.env');

    return Secrets(
      env: DotEnv().env,
    );
  }

  String getEnv(String key) => env[key];
}
