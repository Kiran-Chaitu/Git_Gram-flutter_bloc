import 'package:flutter_dotenv/flutter_dotenv.dart';

class Tokens {
  static String get gitToken {
    return dotenv.env['GIT_TOKEN'] ?? 'No token found';
  }
  static String get baseUrl {
    return dotenv.env['BASE_URL'] ?? 'No token found';
  }
}
