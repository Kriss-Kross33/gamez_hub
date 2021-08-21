import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gamez_hub/src/core/constants/secure_storage_consts.dart';
import 'package:gamez_hub/src/core/error/exception.dart';
import 'package:gamez_hub/src/core/games/data/datasources/game_local_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../models/game.dart';
import 'game_local_data_source_impl_test.mocks.dart';

@GenerateMocks([FlutterSecureStorage])
void main() {
  late MockFlutterSecureStorage mockFlutterSecureStorage;
  late GameLocalDataSourceImpl localDataSource;

  setUp(() {
    mockFlutterSecureStorage = MockFlutterSecureStorage();
    localDataSource =
        GameLocalDataSourceImpl(secureStorage: mockFlutterSecureStorage);
  });

  group('fetchCahedGames', () {
    test('should return [List<GameModel>] from the cache when one is present',
        () async {
      //* arrange
      final games = gameModelsTst;
      when(mockFlutterSecureStorage.read(key: anyNamed('key')))
          .thenAnswer((realInvocation) async => fixture('games.json'));
      //* act
      final result = await localDataSource.fetchCahedGames();
      //* assert
      verify(
          mockFlutterSecureStorage.read(key: SecureStorage.FETCH_GAMES_LIST));
      expect(result, equals(games));
    });

    test('should throw [CacheException] when there is no cached data present',
        () {
      //* arrange
      when(mockFlutterSecureStorage.read(key: anyNamed('key')))
          .thenThrow(CacheException());
      //* act
      final call = localDataSource.fetchCahedGames;
      //* assert
      expect(() => call(), throwsA(isA<CacheException>()));
    });
  });

  group('addGameListToCache', () {
    test('should cache data when data is gotten from remote server', () {
      //* act
      final games = gameModelsTst;
      localDataSource.addGameListToCache(games);
      //* assert
      String gamesListString =
          json.encode(games.map((e) => e.toJson()).toList());
      verify(mockFlutterSecureStorage.write(
          key: SecureStorage.FETCH_GAMES_LIST, value: gamesListString));
    });
  });
}
