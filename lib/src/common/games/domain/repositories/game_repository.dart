import 'package:dartz/dartz.dart';
import 'package:gamez_hub/src/common/games/domain/entities/entities.dart';
import 'package:gamez_hub/src/core/error/failure.dart';

abstract class GameRepository {
  /// Fetch the list of [GamesEntity] from the server
  /// Return [Failure] on error.
  Future<Either<Failure, List<GameEntity>>> fetchGameList(
      {GamesOrdering ordering = GamesOrdering.none});
}
