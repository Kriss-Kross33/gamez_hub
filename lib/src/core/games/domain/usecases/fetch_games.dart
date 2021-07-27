import 'package:dartz/dartz.dart';
import 'package:gamez_hub/src/core/error/failure.dart';
import 'package:gamez_hub/src/core/games/domain/entities/game_entity.dart';
import 'package:gamez_hub/src/core/games/domain/repositories/game_repository.dart';

class FetchGames {
  final GameRepository gameRepository;

  FetchGames(this.gameRepository);

  Future<Either<Failure, List<GamesEntity>>> call() async {
    return gameRepository.fetchGameList();
  }
}
