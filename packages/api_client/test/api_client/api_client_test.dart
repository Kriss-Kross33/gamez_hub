import 'package:api_client/api_client.dart';
import 'package:api_client/src/config/config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_client_test.mocks.dart';

//class MockClient extends Mock implements Client {}

@GenerateMocks([Client])
//customMocks: [MockSpec<Client>(returnNullOnMissingStub: true)])
void main() {
  late MockClient mockClient;
  late ApiClient apiClient;

  setUp(() {
    mockClient = MockClient();
    apiClient = ApiClient(mockClient);
  });

  group('get', () {
    test(
        'should perform a GET request on a URL with an application/json header',
        () async {
      //* arrange
      String path = "?key=${apiKey['KEY']}";
      final uri = Uri.parse('${ApiConfig.BASE_URL}${ApiConfig.GAMES}$path');
      when(mockClient.get(uri, headers: anyNamed('headers')))
          .thenAnswer((_) async => Response('success', 200));
      //* act
      await apiClient.get(endpoint: ApiConfig.GAMES);
      //* assert
      Map<String, String> headers = {'Content-Type': 'application/json'};
      verify(mockClient.get(uri, headers: headers));
      // expect(result, equals(Response('success', 200)));
    });
  });
}
