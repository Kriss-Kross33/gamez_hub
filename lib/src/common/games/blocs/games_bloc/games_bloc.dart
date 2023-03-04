import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gamez_hub/src/common/games/domain/domain.dart';
import 'package:gamez_hub/src/core/constants/error_consts.dart';
import 'package:gamez_hub/src/core/error/failure.dart';

part 'games_event.dart';
part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  final GameRepository _gameRepository;
  GamesBloc({required GameRepository gameRepository})
      : _gameRepository = gameRepository,
        super(GamesInitialState());

  List<GameEntity> gamesList = <GameEntity>[];

  @override
  Stream<GamesState> mapEventToState(
    GamesEvent event,
  ) async* {
    if (event is FetchGamesEvent) {
      switch (event.ordering) {
        case GamesOrdering.released:
          yield GamesLoadingState();
          yield* _getGamesByOrdering(ordering: GamesOrdering.released);
          break;
        case GamesOrdering.metacritic:
        case GamesOrdering.rating:
        case GamesOrdering.popular:
        case GamesOrdering.name:
        case GamesOrdering.none:
          yield GamesLoadingState();
          yield* _getGamesByOrdering(ordering: GamesOrdering.none);
          break;
      }
    }
  }

  Stream<GamesState> _getGamesByOrdering(
      {required GamesOrdering ordering}) async* {
    yield GamesLoadingState();
    final _eitherGamesOrFailure = await _gameRepository.fetchGameList();
    yield* _eitherGamesOrFailure.fold((failure) async* {
      yield* _mapFailureToState(failure);
    }, (games) async* {
      gamesList = games;
      yield GamesLoadedState(games: games);
    });
  }

  Stream<GamesFailureState> _mapFailureToState(Failure failure) async* {
    switch (failure.runtimeType) {
      case CacheFailure:
        yield GamesFailureState(errorMessage: ErrorConsts.CACHE_ERROR_MESSAGE);
        break;
      case ServerFailure:
        yield GamesFailureState(errorMessage: ErrorConsts.SERVER_ERROR_MESSAGE);
        break;
      default:
        yield GamesFailureState(errorMessage: ErrorConsts.SERVER_ERROR_MESSAGE);
        break;
    }
  }
}
