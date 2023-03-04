import 'package:gamez_hub/src/common/games/domain/entities/entities.dart';

class TwitchGameModel extends TwitchGameEntity {
  final String id;
  final String name;
  final String boxArtUrl;

  TwitchGameModel({
    required this.id,
    required this.name,
    required this.boxArtUrl,
  }) : super(
          id: id,
          name: name,
          boxArtUrl: boxArtUrl,
        );

  factory TwitchGameModel.fromJson(Map<String, dynamic> parsedJson) {
    return TwitchGameModel(
      id: parsedJson['id'],
      name: parsedJson['name'],
      boxArtUrl: parsedJson['box_art_url'],
    );
  }
}
