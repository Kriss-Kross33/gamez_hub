import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:gamez_hub/src/core/constants/endpoint_constants.dart';
import 'package:gamez_hub/src/core/error/exception.dart';
import 'package:gamez_hub/src/core/games/data/models/game_enums.dart';
import 'package:gamez_hub/src/core/games/data/models/game_model.dart';
import 'package:http/http.dart';

abstract class GameRemoteDataSource {
  /// Return the [List<GameModel>] when data is gotten from the
  /// server successfully else return [ServerException] if otherwise
  Future<List<GameModel>> fetchGameList({required GamesOrdering ordering});
}

class GameRemoteDataSourceImpl extends GameRemoteDataSource {
  final ApiClient _apiClient;
  GameRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<GameModel>> fetchGameList(
      {required GamesOrdering ordering}) async {
    String query = _getQueryString(ordering);
    Response response = await _apiClient.get(
      endpoint: ApiConfig.GAMES,
      query: query,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = json.decode(response.body);
      List gamesList = responseBody['results'];
      return _mapListToGameModels(gamesList);
    } else
      throw ServerException(errorMessage: response.body);
  }

  String _getQueryString(GamesOrdering ordering) {
    switch (ordering) {
      case GamesOrdering.released:
        return '&ordering=released';
      case GamesOrdering.metacritic:
      case GamesOrdering.rating:
      case GamesOrdering.popular:
      case GamesOrdering.name:
      case GamesOrdering.none:
        return '';
    }
  }

  List<GameModel> _mapListToGameModels(List<dynamic> gamesList) {
    List<GameModel> gameModelList = <GameModel>[];
    for (Map<String, dynamic> gameModel in gamesList) {
      gameModelList.add(GameModel.fromJson(gameModel));
    }
    return gameModelList;
  }
}
