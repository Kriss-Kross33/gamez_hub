part of 'games_bloc.dart';

abstract class GamesState extends Equatable {
  const GamesState();

  @override
  List<Object> get props => [];
}

/// The initial state
class GamesInitialState extends GamesState {}

/// State which occurs when [List<GameEntity>] is being fetched
/// from the remote server.
class GamesLoadingState extends GamesState {}

/// State which occurs when [List<GameEntity>] has been successfully
/// fetched from the remote server.
class GamesLoadedState extends GamesState {
  final List<GameEntity> games;
  const GamesLoadedState({required this.games});

  List<Object> get props => [games];
}

/// State which occurs when a [Failure] is returned
class GamesFailureState extends GamesState {
  final String errorMessage;
  const GamesFailureState({required this.errorMessage});

  List<Object> get props => [errorMessage];
}
