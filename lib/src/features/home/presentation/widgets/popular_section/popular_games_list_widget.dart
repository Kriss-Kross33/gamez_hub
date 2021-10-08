import 'package:flutter/material.dart';
import 'package:gamez_hub/src/core/games/domain/entities/game_entity.dart';
import 'package:gamez_hub/src/features/home/presentation/widgets/widgets.dart';

class PopularGamesListWidget extends StatelessWidget {
  final List<GameEntity> games;
  const PopularGamesListWidget({
    Key? key,
    required this.games,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<GameEntity> firstSixGames = games.take(6).toList();
    return Flexible(
      child: Container(
        height: 220,
        width: 400,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GameCard(
              game: firstSixGames[index],
            );
          },
          itemCount: 6,
        ),
      ),
    );
  }
}
