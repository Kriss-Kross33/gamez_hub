part of 'games_bloc.dart';

abstract class GamesEvent extends Equatable {
  const GamesEvent();

  @override
  List<Object?> get props => [];
}

/// Notifies the [Bloc] to fetch list of games from the server.
class FetchGamesEvent extends GamesEvent {
  final GamesOrdering ordering;

  const FetchGamesEvent({this.ordering = GamesOrdering.none});

  @override
  List<Object?> get props => [ordering];
}
