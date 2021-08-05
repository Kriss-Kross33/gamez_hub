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
