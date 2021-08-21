import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gamez_hub/src/core/constants/secure_storage_consts.dart';
import 'package:gamez_hub/src/core/error/exception.dart';
import 'package:gamez_hub/src/core/games/data/models/game_model.dart';

abstract class GameLocalDataSource {
  /// Return the Cached list of [GameModel] from the last
  /// time the data was gotten from remote data source.
  /// Throw [CacheException] when no list of [GameModel] is found.
  Future<List<GameModel>> fetchCahedGames();

  /// Cache the list of [GameModel] when data is gotten from
  /// remote data source.
  Future<void> addGameListToCache(List<GameModel> games);
}

class GameLocalDataSourceImpl extends GameLocalDataSource {
  final FlutterSecureStorage secureStorage;

  GameLocalDataSourceImpl({required this.secureStorage});
  @override
  Future<void> addGameListToCache(List<GameModel> games) async {
    String gamesListString = json.encode(games.map((e) => e.toJson()).toList());
    await secureStorage.write(
        key: SecureStorage.FETCH_GAMES_LIST, value: gamesListString);
  }

  @override
  Future<List<GameModel>> fetchCahedGames() async {
    final gamesListString =
        await secureStorage.read(key: SecureStorage.FETCH_GAMES_LIST);
    if (gamesListString != null) {
      List<GameModel> games = (json.decode(gamesListString) as List)
          .map((e) => GameModel.fromJson(e))
          .toList();
      return games;
    } else {
      throw CacheException();
    }
  }
}
