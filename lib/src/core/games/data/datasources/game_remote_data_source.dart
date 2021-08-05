import 'package:gamez_hub/src/core/games/data/models/game_model.dart';

abstract class GameRemoteDataSource {
  /// Return the [List<GameModel>] when data is gotten from the
  /// server successfully else return [ServerException] if otherwise
  Future<List<GameModel>> fetchGameList();
}
