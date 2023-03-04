import 'package:flutter/material.dart';
import 'package:gamez_hub/src/common/games/games.dart';
import 'package:gamez_hub/src/features/home/presentation/widgets/widgets.dart';
import 'package:gamez_hub/src/responsive_layout.dart';

class GameCard extends StatelessWidget {
  final GameEntity game;
  const GameCard({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: ResponsiveLayout(
        phone: PhoneCard(game: game),
        tablet: TabletCard(game: game),
        desktop: DesktopCard(game: game),
      ),
    );
  }
}
