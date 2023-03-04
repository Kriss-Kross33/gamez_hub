import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gamez_hub/src/common/games/games.dart';
import 'package:gamez_hub/src/core/constants/app_color.dart';
import 'package:gamez_hub/src/core/gamez_hub_app/widgets/widget.dart';
import 'package:gamez_hub/src/features/home/presentation/widgets/widgets.dart';

class ShowcaseWidget extends StatelessWidget {
  final GameEntity game;
  const ShowcaseWidget({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.44,
          child: Container(
            decoration: BoxDecoration(),
            child: CachedNetworkImage(
              imageUrl: game.backgroundImage!,
              fit: BoxFit.cover,
            ),
          ),
        ),
        GameAppBar(
          rightIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: AppColor.darkSecondaryColor,
            ),
            onPressed: () {},
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
                Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                Theme.of(context).scaffoldBackgroundColor
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          ),
        ),
      ],
    ));
  }
}
