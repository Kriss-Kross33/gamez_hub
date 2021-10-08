import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gamez_hub/src/core/games/data/models/game_enums.dart';
import 'package:gamez_hub/src/core/games/domain/entities/game_entity.dart';
import 'package:gamez_hub/src/core/games/domain/repositories/game_repository.dart';
import 'package:gamez_hub/src/core/games/domain/usecases/fetch_games.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../data/models/game.dart';
import 'fetch_games_test.mocks.dart';

// class MockGameRepository extends Mock implements GameRepository {}

@GenerateMocks([GameRepository])
void main() {
  late MockGameRepository mockGameRepository;
  late FetchGames fetchGames;

  setUp(() {
    mockGameRepository = MockGameRepository();
    fetchGames = FetchGames(mockGameRepository);
  });

  test('should return the [List<GameEntity>] from the repository', () async {
    //* arrange
    List<GameEntity> games = gameModelsTst.cast<GameEntity>();
    //print(games);
    when(mockGameRepository.fetchGameList(ordering: GamesOrdering.none))
        .thenAnswer((_) async => Right(games));
    //* act
    final result = await fetchGames(ordering: GamesOrdering.none);
    //* assert
    verify(mockGameRepository.fetchGameList(ordering: GamesOrdering.none));
    expect(result, equals(Right(games)));
    verifyNoMoreInteractions(mockGameRepository);
  });
}
