import 'package:dartz/dartz.dart';
import 'package:gamez_hub/src/core/error/exception.dart';
import 'package:gamez_hub/src/core/error/failure.dart';
import 'package:gamez_hub/src/core/games/data/datasources/game_local_data_source.dart';
import 'package:gamez_hub/src/core/games/data/datasources/game_remote_data_source.dart';
import 'package:gamez_hub/src/core/games/data/models/game_enums.dart';
import 'package:gamez_hub/src/core/games/data/models/game_model.dart';
import 'package:gamez_hub/src/core/games/domain/entities/game_entity.dart';
import 'package:gamez_hub/src/core/games/domain/repositories/game_repository.dart';
import 'package:gamez_hub/src/core/network/network_info.dart';

class GameRepositoryImpl extends GameRepository {
  final NetworkInfo networkInfo;
  final GameRemoteDataSource remoteDataSource;
  final GameLocalDataSource localDataSource;

  GameRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<GameEntity>>> fetchGameList(
      {GamesOrdering ordering = GamesOrdering.none}) async {
    if (await networkInfo.hasConnection) {
      try {
        final cachedGames = await localDataSource.fetchCachedGames();
        if (cachedGames != null) return Right(cachedGames);
        final remoteData =
            await remoteDataSource.fetchGameList(ordering: ordering);
        await localDataSource.addGameListToCache(remoteData);
        final games = remoteData.cast<GameEntity>();
        return Right(games);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        List<GameModel>? cachedGames = await localDataSource.fetchCachedGames();
        if (cachedGames != null) {
          return Right(cachedGames);
        }
        throw CacheException();
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
