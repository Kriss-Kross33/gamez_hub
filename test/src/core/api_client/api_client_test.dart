import 'package:flutter_test/flutter_test.dart';
import 'package:gamez_hub/src/core/api_client/api_client.dart';
import 'package:gamez_hub/src/core/config/key.dart';
import 'package:gamez_hub/src/core/constants/endpoint_constants.dart';
import 'package:http/http.dart';
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
          .thenAnswer((realInvocation) async => Response('success', 200));
      //* act
      await apiClient.get(endpoint: ApiConfig.GAMES);
      //* assert
      Map<String, String> headers = {'Content-Type': 'application/json'};
      verify(mockClient.get(uri, headers: headers));
      // expect(result, equals(Response('success', 200)));
    });
  });
}
