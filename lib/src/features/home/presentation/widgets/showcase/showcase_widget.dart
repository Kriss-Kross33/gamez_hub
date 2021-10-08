import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gamez_hub/src/core/games/domain/entities/game_entity.dart';
import 'package:gamez_hub/src/features/home/presentation/widgets/widgets.dart';
import 'package:gamez_hub/src/responsive_layout.dart';

class ShowcaseWidget extends StatelessWidget {
  final GameEntity game;
  const ShowcaseWidget({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ResponsiveLayout.isPhone(context)
          ? Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.44,
                  child: Container(
                    decoration: BoxDecoration(),
                    child: CachedNetworkImage(
                      imageUrl: game.backgroundImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ShowcaseInfoWidget(title: game.name),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: <Color>[
                        Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.1),
                        Theme.of(context).scaffoldBackgroundColor
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                  ),
                ),
              ],
            )
          : Container(),
    );
  }
}
