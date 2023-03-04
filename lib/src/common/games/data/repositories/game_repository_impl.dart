import 'package:dartz/dartz.dart';
import 'package:gamez_hub/src/common/games/data/data.dart';
import 'package:gamez_hub/src/common/games/domain/domain.dart';
import 'package:gamez_hub/src/core/error/exception.dart';
import 'package:gamez_hub/src/core/error/failure.dart';
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
        if (cachedGames != null) {
          for (var cacheGame in cachedGames) {
            print(cacheGame.toJson());
            print('\n');
          }
          return Right(cachedGames);
        }
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
          print(cachedGames);
          return Right(cachedGames);
        }
        throw CacheException(errorMessage: 'cache error');
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
