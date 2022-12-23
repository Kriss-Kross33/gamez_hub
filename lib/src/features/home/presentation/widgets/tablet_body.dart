import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamez_hub/src/core/games/bloc/games_bloc/games_bloc.dart';
import 'package:gamez_hub/src/core/service_locator/service_locator.dart';
import 'package:gamez_hub/src/features/home/presentation/widgets/widgets.dart';

class TabletBody extends StatefulWidget {
  const TabletBody({Key? key}) : super(key: key);

  @override
  _TabletBodyState createState() => _TabletBodyState();
}

class _TabletBodyState extends State<TabletBody> {
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
                    PopularSection(
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