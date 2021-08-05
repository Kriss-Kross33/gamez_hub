import 'package:dartz/dartz.dart';
import 'package:gamez_hub/src/core/error/exception.dart';
import 'package:gamez_hub/src/core/error/failure.dart';
import 'package:gamez_hub/src/core/games/data/datasources/game_local_data_source.dart';
import 'package:gamez_hub/src/core/games/data/datasources/game_remote_data_source.dart';
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
  Future<Either<Failure, List<GameEntity>>> fetchGameList() async {
    if (await networkInfo.hasConnection) {
      try {
        final remoteData = await remoteDataSource.fetchGameList();
        await localDataSource.addGameListToCache(remoteData);
        final games = remoteData.cast<GameEntity>();
        return Right(games);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localData = await localDataSource.fetchCahedGames();
        return Right(localData);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
