import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pragma_test/domain/contstants/errors_constants.dart';

class RestApi {
  String hostUrl;
  Duration timeOutMs = const Duration(seconds: 60);

  RestApi({this.hostUrl = ''});

  Future<Map<String, String>> headers() async {
    Map<String, String> temp = {
      "Content-Type": "application/json",
    };
    return temp;
  }

  Future<dynamic> get(
    String relativeUrl, {
    bool netResponse = false,
    Duration? timeout,
  }) async {

    Map<String, String> headers = await this.headers();
    Uri url = Uri.parse(hostUrl + relativeUrl);
    Future<http.Response> response = http.get(url, headers: headers);
    if (netResponse) {
      return await response;
    }
    return await parseResponse(response, relativeUrl, 'GET', '', timeout: timeout);
  }

  Future<String?> parseResponse(Future<http.Response> petition,
      String relativeUrl, String method, String body, {Duration? timeout}) async {
    try {
      http.Response response = await petition.timeout(timeout ?? timeOutMs);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return response.body;
      } else {
        if (response.statusCode == 401) {
          throw ErrorsConstants.unauthorized;
        } else if (response.statusCode == 404) {
          throw ErrorsConstants.notFound;
        }
        // An empty error body used to surface as a bare '' — indistinguishable
        // from a parsing bug once `fromError` swapped it for the default. Keep
        // the status so callers/diagnostics can tell (405, 415, empty 500…).
        throw response.body.isEmpty
            ? 'HTTP ${response.statusCode}'
            : response.body;
      }
    } on TimeoutException catch (_) {
      if (await hasInternetConnection()) {
        throw ErrorsConstants.timeout;
      } else {
        throw ErrorsConstants.noInternet;
      }
    } on SocketException catch (_) {
      throw ErrorsConstants.noInternet;
    } catch (e) {
      rethrow;
    }
  }
  Future<bool> hasInternetConnection() async {
    try {
      final response = await http.get(Uri.parse('https://www.google.com'))
          .timeout(Duration(seconds: 30));
      return (response.statusCode >= 200 && response.statusCode <= 299) || response.statusCode == 429;
    } catch (e) {
      return false;
    }
  }
}
