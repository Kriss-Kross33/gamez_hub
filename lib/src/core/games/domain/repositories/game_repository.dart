import 'package:dartz/dartz.dart';
import 'package:gamez_hub/src/core/error/failure.dart';
import 'package:gamez_hub/src/core/games/data/models/game_enums.dart';
import 'package:gamez_hub/src/core/games/domain/entities/game_entity.dart';

abstract class GameRepository {
  /// Fetch the list of [GamesEntity] from the server
  /// Return [Failure] on error.
  Future<Either<Failure, List<GameEntity>>> fetchGameList(
      {GamesOrdering ordering = GamesOrdering.none});
}
