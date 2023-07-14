import 'package:senior_flutter_challenge_v2/networking/api_response_handler.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<Map<String, dynamic>> getCall(String url,
      {Map<String, dynamic>? queryParams}) async {
    var client = http.Client();
    Uri uri;

    if (queryParams != null) {
      uri = Uri.parse('$url?${Uri(queryParameters: queryParams).query}');
    } else {
      uri = Uri.parse(url);
    }
    try {
      var uriResponse = await client.get(uri);
      return ApiResponseHandler.output(uriResponse);
    } catch (e) {
      return ApiResponseHandler.outputError();
    }
  }
}
