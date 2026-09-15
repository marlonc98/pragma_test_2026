import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pragma_test/data/settings/rest_api.dart';

class CatApi extends RestApi {
  CatApi() : super(hostUrl: "https://api.thecatapi.com/v1");

  @override
  Future<Map<String, String>> headers() async {
    return {
      "x-api-key":
      dotenv.env['CAT_API_KEY'] ?? "",
      "Content-Type": "application/json; charset=utf-8",
    };
  }
}
