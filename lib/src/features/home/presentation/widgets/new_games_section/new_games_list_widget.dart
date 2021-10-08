import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamez_hub/src/core/games/bloc/games_bloc/games_bloc.dart';
import 'package:gamez_hub/src/core/games/data/models/game_enums.dart';
import 'package:gamez_hub/src/core/games/domain/entities/game_entity.dart';
import 'package:gamez_hub/src/core/service_locator/service_locator.dart';

import '../widgets.dart';

class NewGamesListWidget extends StatefulWidget {
  const NewGamesListWidget({Key? key}) : super(key: key);

  @override
  _NewGamesListWidgetState createState() => _NewGamesListWidgetState();
}

class _NewGamesListWidgetState extends State<NewGamesListWidget> {
  late GamesBloc _gamesBloc;

  @override
  void initState() {
    super.initState();
    _gamesBloc = locator<GamesBloc>();
    _gamesBloc.add(FetchGamesEvent(ordering: GamesOrdering.released));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: BlocBuilder<GamesBloc, GamesState>(
        bloc: _gamesBloc,
        builder: (context, state) {
          if (state is GamesLoadedState) {
            return Container(
              height: 220,
              width: 400,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  List<GameEntity> firstSixGames = state.games.take(6).toList();
                  return GameCard(
                    game: firstSixGames[index],
                  );
                },
                itemCount: 6,
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
