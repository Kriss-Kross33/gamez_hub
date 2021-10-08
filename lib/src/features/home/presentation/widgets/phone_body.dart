import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamez_hub/src/core/constants/app_color.dart';
import 'package:gamez_hub/src/core/games/bloc/games_bloc/games_bloc.dart';
import 'package:gamez_hub/src/core/gamez_hub_app/widgets/widget.dart';
import 'package:gamez_hub/src/core/service_locator/service_locator.dart';
import 'package:gamez_hub/src/features/home/presentation/widgets/widgets.dart';

class PhoneBody extends StatefulWidget {
  const PhoneBody({Key? key}) : super(key: key);

  @override
  _PhoneBodyState createState() => _PhoneBodyState();
}

class _PhoneBodyState extends State<PhoneBody> {
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
      child: ListView(
        shrinkWrap: true,
        children: [
          Stack(
            fit: StackFit.loose,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
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
              GameAppBar(
                rightIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: AppColor.iconColor,
                  ),
                  onPressed: () {},
                ),
              ),
              NewGamesSection(),
            ],
          ),
        ],
      ),
    );
  }
}
