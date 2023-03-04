// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:gamez_hub/src/common/games/games.dart';
// import 'package:gamez_hub/src/core/constants/error_consts.dart';
// import 'package:gamez_hub/src/core/error/failure.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import '../../data/models/game.dart';

// @GenerateMocks([GameRepository])
// void main() {
//   late MockGameRepository mockFetchGames;
//   late GamesBloc gamesBloc;

//   setUp(() {
//     mockFetchGames = MockGameRepository();
//     gamesBloc = GamesBloc(fetchGames: mockFetchGames);
//   });

//   test('initial state should be GamesInitialState', () {
//     //* assert
//     expect(gamesBloc.state, equals(GamesInitialState()));
//   });

//   group('FetchGamesEvent', () {
//     List<GameEntity> games = gameModelsTst.cast<GameEntity>();

//     test('should get data from the usecase when [FetchGamesEvent] is fired',
//         () async {
//       //* arrange
//       when(mockFetchGames()).thenAnswer((_) async => Right(games));
//       //* act
//       gamesBloc.add(FetchGamesEvent());
//       await untilCalled(mockFetchGames());
//       //* assert
//       verify(mockFetchGames());
//     });

//     test(
//         'should emit [GamesLoadingState, GamesLoadedState] when data is gotten successfully',
//         () {
//       //* arrange
//       when(mockFetchGames()).thenAnswer((_) async => Right(games));
//       //* assert later
//       final expectedStates = <GamesState>[
//         GamesLoadingState(),
//         GamesLoadedState(games: games),
//       ];
//       expectLater(gamesBloc.stream, emitsInOrder(expectedStates));
//       //* act
//       gamesBloc.add(FetchGamesEvent());
//     });

//     test(
//         'should emit [GamesLoadingState, GamesFailureState] when a [Failure] ' +
//             'occurs from fetching data from server', () {
//       //* arrange
//       when(mockFetchGames()).thenAnswer((_) async => Left(ServerFailure()));
//       //* assert later
//       final expectedStates = <GamesState>[
//         GamesLoadingState(),
//         GamesFailureState(errorMessage: ErrorConsts.SERVER_ERROR_MESSAGE),
//       ];
//       expectLater(gamesBloc.stream, emitsInOrder(expectedStates));
//       //* act
//       gamesBloc.add(FetchGamesEvent());
//     });

//     test(
//         'should emit [GamesLoadingState, GamesFailureState] when a [Failure] ' +
//             'occurs from fetching data from cache', () {
//       //* arrange
//       when(mockFetchGames()).thenAnswer((_) async => Left(CacheFailure()));
//       //* assert later
//       final expectedState = <GamesState>[
//         GamesLoadingState(),
//         GamesFailureState(errorMessage: ErrorConsts.CACHE_ERROR_MESSAGE),
//       ];
//       expectLater(gamesBloc.stream, emitsInOrder(expectedState));
//       //* act
//       gamesBloc.add(FetchGamesEvent());
//     });
//   });
// }
