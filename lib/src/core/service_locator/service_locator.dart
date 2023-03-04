import 'package:api_client/api_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gamez_hub/src/common/games/games.dart';
import 'package:gamez_hub/src/core/network/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final locator = GetIt.I;

Future<void> setupLocator() async {
  //! Blocs

  locator.registerLazySingleton<GamesBloc>(
      () => GamesBloc(gameRepository: locator()));

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
