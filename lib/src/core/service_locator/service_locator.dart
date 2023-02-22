import 'package:api_client/api_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gamez_hub/src/core/games/bloc/games_bloc/games_bloc.dart';
import 'package:gamez_hub/src/core/games/data/datasources/game_local_data_source.dart';
import 'package:gamez_hub/src/core/games/data/datasources/game_remote_data_source.dart';
import 'package:gamez_hub/src/core/games/data/repositories/game_repository_impl.dart';
import 'package:gamez_hub/src/core/games/domain/repositories/game_repository.dart';
import 'package:gamez_hub/src/core/games/domain/usecases/fetch_games.dart';
import 'package:gamez_hub/src/core/network/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final locator = GetIt.I;

Future<void> setupLocator() async {
  //! Blocs

  locator
      .registerLazySingleton<GamesBloc>(() => GamesBloc(fetchGames: locator()));
  //! Usecases
  locator.registerLazySingleton<FetchGames>(() => FetchGames(locator()));
  //! Repositories
  locator.registerLazySingleton<GameRepository>(
    () => GameRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
      networkInfo: locator(),
    ),
  );
  //! RemoteDataSources
  locator.registerLazySingleton<GameRemoteDataSource>(
    () => GameRemoteDataSourceImpl(
      locator(),
    ),
  );
  //! LocalDataSources
  locator.registerLazySingleton<GameLocalDataSource>(
    () => GameLocalDataSourceImpl(
      secureStorage: locator(),
    ),
  );
  //! Core
  locator.registerLazySingleton<ApiClient>(() => ApiClient(locator()));
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));
  //! External Dependencies
  locator.registerLazySingleton<Client>(() => Client());
  locator.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );

  locator.registerLazySingleton<FlutterSecureStorage>(
    () => FlutterSecureStorage(),
  );
}
