import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> loadEnv() async {
  await dotenv.load(fileName: "lib/utils/.env"); // Load .env file
}

class Tokens {
  static String get gitToken {
    return dotenv.env['GIT_TOKEN'] ?? 'No token found';
  }
}
