import 'package:equatable/equatable.dart';

class TwitchGameEntity extends Equatable {
  final String id;
  final String name;
  final String boxArtUrl;

  TwitchGameEntity({
    required this.id,
    required this.name,
    required this.boxArtUrl,
  });

  @override
  List<Object> get props => [id, name, boxArtUrl];
}
