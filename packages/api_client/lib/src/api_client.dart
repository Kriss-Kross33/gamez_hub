import 'package:http/http.dart';

import 'config/config.dart';

class ApiClient {
  final Client _client;
  ApiClient(this._client);

  Map<String, String> _getHeaders() {
    return {
      'Content-Type': 'application/json',
    };
  }

  Future<Response> get({required endpoint, String query = ''}) async {
    Map<String, String> headers = _getHeaders();
    String path = "?key=${apiKey['KEY']}";
    final uri = Uri.parse('${ApiConfig.BASE_URL}${ApiConfig.GAMES}$path$query');
    print('${ApiConfig.BASE_URL}${ApiConfig.GAMES}$path');
    print(uri.toString());
    Response response = await _client.get(uri, headers: headers);
    return response;
  }
}
