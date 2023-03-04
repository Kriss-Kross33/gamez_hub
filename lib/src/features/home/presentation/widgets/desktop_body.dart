import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamez_hub/src/common/games/games.dart';
import 'package:gamez_hub/src/core/service_locator/service_locator.dart';
import 'package:gamez_hub/src/features/home/presentation/widgets/widgets.dart';

class DesktopBody extends StatefulWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  _DesktopBodyState createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  late GamesBloc gamesBloc;

  @override
  void initState() {
    super.initState();
    gamesBloc = locator<GamesBloc>();
    gamesBloc.add(FetchGamesEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        // fit: StackFit.loose,
        children: [
          BlocBuilder<GamesBloc, GamesState>(
            bloc: gamesBloc,
            builder: (context, state) {
              if (state is GamesLoadedState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ShowcaseWidget(
                      game: state.games.last,
                    ),
                    GameSection(
                      games: state.games,
                    ),
                  ],
                );
              }
              return SizedBox.shrink();
            },
          ),
          NewGamesSection(),
          LiveStreamSection(),
        ],
      ),
    );
  }
}
