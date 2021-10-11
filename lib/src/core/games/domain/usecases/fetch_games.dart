import 'package:dartz/dartz.dart';
import 'package:gamez_hub/src/core/error/failure.dart';
import 'package:gamez_hub/src/core/games/data/models/game_enums.dart';
import 'package:gamez_hub/src/core/games/domain/entities/game_entity.dart';
import 'package:gamez_hub/src/core/games/domain/repositories/game_repository.dart';

class FetchGames {
  final GameRepository gameRepository;

  FetchGames(this.gameRepository);

  Future<Either<Failure, List<GameEntity>>> call(
      {GamesOrdering ordering = GamesOrdering.none}) async {
    return gameRepository.fetchGameList(ordering: ordering);
  }
}
