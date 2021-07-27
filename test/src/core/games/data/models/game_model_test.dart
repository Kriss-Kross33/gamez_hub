import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:gamez_hub/src/core/games/data/models/game_model.dart';
import 'package:gamez_hub/src/core/games/domain/entities/game_entity.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'game.dart';

// ignore: must_be_immutable
class MockGameModel extends Mock implements GameModel {}

void main() {
  final gameModel = gameModelTst;
  test(('should be a subclass of GameEntity'), () {
    //* assert
    expect(gameModel, isA<GamesEntity>());
  });

  group('fromJson', () {
    test('should return a valid GameModel', () {
      //* arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('game.json'));
      //* act
      final result = GameModel.fromJson(jsonMap);
      //* assert
      expect(gameModel, equals(result));
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () {
      Map<String, dynamic> jsonMap = json.decode(fixture('game.json'));
      //* act
      final result = gameModel.toJson();
      //* assert
      expect(result, jsonMap);
    });
  });
}
