import 'package:flutter/material.dart';
import 'package:gamez_hub/src/common/games/games.dart';
import 'package:gamez_hub/src/core/constants/text_consts.dart';
import 'package:gamez_hub/src/features/home/presentation/widgets/widgets.dart';

class GameSection extends StatelessWidget {
  final List<GameEntity> games;
  const GameSection({Key? key, required this.games}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SectionHeader(
            headerText: TextConst.popularGamesText,
          ),
          SizedBox(
            height: 20.0,
          ),
          PopularGamesListWidget(games: games),
        ],
      ),
    );
  }
}
