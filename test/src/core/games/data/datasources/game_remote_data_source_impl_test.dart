import 'package:flutter_test/flutter_test.dart';
import 'package:gamez_hub/src/core/api_client/api_client.dart';
import 'package:gamez_hub/src/core/constants/endpoint_constants.dart';
import 'package:gamez_hub/src/core/error/exception.dart';
import 'package:gamez_hub/src/core/games/data/datasources/game_remote_data_source.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../models/game.dart';
import 'game_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient mockApiClient;
  late GameRemoteDataSourceImpl remoteDataSource;

  setUp(() {
    mockApiClient = MockApiClient();
    remoteDataSource = GameRemoteDataSourceImpl(mockApiClient);
  });

  group('fetchGameList', () {
    final gameList = gameModelsTst;

    test(
        'should return [List<GameModel] with a 200 status code when response is successful',
        () async {
      //* arrange
      when(mockApiClient.get(endpoint: anyNamed('endpoint'))).thenAnswer(
          (realInvocation) async => Response(fixture('game_result.json'), 200));
      //* act
      final result = await remoteDataSource.fetchGameList();
      //* assert
      verify(mockApiClient.get(endpoint: ApiConfig.GAMES));
      expect(result, gameList);
    });

    test(
        'should throw a [ServerException] when the response status is 404 or other',
        () {
      //* arrange
      when(mockApiClient.get(endpoint: anyNamed('endpoint'))).thenAnswer(
          (realInvocation) async => Response('Something went wrong', 404));
      //* act
      final call = remoteDataSource.fetchGameList;
      //* assert
      expect(() => call(), throwsA(isA<ServerException>()));
    });
  });
}
