import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gamez_hub/src/core/games/domain/entities/game_entity.dart';
import 'package:gamez_hub/src/core/games/domain/repositories/game_repository.dart';
import 'package:gamez_hub/src/core/games/domain/usecases/fetch_games.dart';
import 'package:mockito/mockito.dart';

import '../../data/models/game.dart';

class MockGameRepository extends Mock implements GameRepository {}
//@GenerateMocks([MockGameRepository'])

void main() {
  late MockGameRepository mockGameRepository;
  late FetchGames fetchGames;

  setUp(() {
    mockGameRepository = MockGameRepository();
    fetchGames = FetchGames(mockGameRepository);
  });

  test('should return the [List<GameEntity>] from the repository', () async {
    //* arrange
    List<GamesEntity> games = gameModelsTst.cast<GamesEntity>();
    //print(games);
    when(mockGameRepository.fetchGameList())
        .thenAnswer((_) async => Right(games));
    //* act
    final result = await fetchGames();
    //* assert
    verify(mockGameRepository.fetchGameList());
    expect(result, equals(Right(games)));
    verifyNoMoreInteractions(mockGameRepository);
  });
}
