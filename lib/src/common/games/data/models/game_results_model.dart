import 'package:gamez_hub/src/common/games/data/data.dart';

class GameResultModel {
  final int count;
  final String next;
  final String previous;
  final List<GameModel> games;

  GameResultModel(
      {required this.count,
      required this.next,
      required this.previous,
      required this.games});

  factory GameResultModel.fromJson(Map<String, dynamic> json) {
    List<GameModel> games = <GameModel>[];
    //if (json['results'] != null) {
    json['results'].forEach((v) {
      games.add(new GameModel.fromJson(v));
    });
    //}
    return GameResultModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      games: games,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    //if (this.games != null) {
    data['results'] = this.games.map((v) => v.toJson()).toList();
    //}
    return data;
  }
}
