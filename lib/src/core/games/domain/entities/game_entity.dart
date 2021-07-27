import 'package:equatable/equatable.dart';

class GamesEntity extends Equatable {
  final int id;
  final String slug;
  final String name;
  final String released;
  final bool tba;
  final String backgroundImage;
  final double rating;
  final int ratingTop;
  final List<RatingsEntity>? ratings;
  final int ratingsCount;
  final int reviewsTextCount;
  final int added;
  final AddedByStatusEntity? addedByStatus;
  final int metacritic;
  final int playtime;
  final int suggestionsCount;
  final String updated;
  final Null userGame;
  final int reviewsCount;
  final String saturatedColor;
  final String dominantColor;
  final List<PlatformsEntity>? platforms;
  final List<ParentPlatformsEntity>? parentPlatforms;
  final List<GenresEntity>? genres;
  final List<StoresEntity>? stores;
  final Null clip;
  final List<TagsEntity>? tags;
  final ESRBRatingEntity? esrbRating;
  final List<ShortScreenshotsEntity>? shortScreenshots;

  GamesEntity({
    required this.id,
    required this.slug,
    required this.name,
    required this.released,
    required this.tba,
    required this.backgroundImage,
    required this.rating,
    required this.ratingTop,
    this.ratings,
    required this.ratingsCount,
    required this.reviewsTextCount,
    required this.added,
    this.addedByStatus,
    required this.metacritic,
    required this.playtime,
    required this.suggestionsCount,
    required this.updated,
    required this.userGame,
    required this.reviewsCount,
    required this.saturatedColor,
    required this.dominantColor,
    this.platforms,
    this.parentPlatforms,
    this.genres,
    this.stores,
    this.clip,
    this.tags,
    this.esrbRating,
    this.shortScreenshots,
  });

  List<Object?> get props => [
        id,
        slug,
        name,
        released,
        tba,
        backgroundImage,
        rating,
        ratingTop,
        ratings,
        ratingsCount,
        reviewsTextCount,
        added,
        addedByStatus,
        metacritic,
        playtime,
        suggestionsCount,
        updated,
        userGame,
        reviewsCount,
        saturatedColor,
        dominantColor,
        platforms,
        parentPlatforms,
        genres,
        stores,
        clip,
        tags,
        esrbRating,
        shortScreenshots,
      ];
}

class RatingsEntity extends Equatable {
  final int id;
  final String title;
  final int count;
  final double percent;

  RatingsEntity(
      {required this.id,
      required this.title,
      required this.count,
      required this.percent});

  List<Object> get props => [id, title, count, percent];
}

class AddedByStatusEntity extends Equatable {
  final int yet;
  final int owned;
  final int beaten;
  final int toplay;
  final int dropped;
  final int playing;

  AddedByStatusEntity({
    required this.yet,
    required this.owned,
    required this.beaten,
    required this.toplay,
    required this.dropped,
    required this.playing,
  });

  List<Object> get props => [yet, owned, beaten, toplay, dropped, playing];
}

class PlatformsEntity extends Equatable {
  final PlatformEntity? platform;
  final String releasedAt;
  final RequirementsEntity? requirementsEn;
  final RequirementsEntity? requirementsRu;

  PlatformsEntity(
      {this.platform,
      required this.releasedAt,
      this.requirementsEn,
      this.requirementsRu});

  List<Object?> get props => [
        platform,
        releasedAt,
        requirementsEn,
        requirementsRu,
      ];
}

class PlatformEntity extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String? image;
  final int? yearEnd;
  final int? yearStart;
  final int? gamesCount;
  final String? imageBackground;

  PlatformEntity({
    required this.id,
    required this.name,
    required this.slug,
    this.image,
    this.yearEnd,
    this.yearStart,
    this.gamesCount,
    this.imageBackground,
  });

  List<Object?> get props => [
        id,
        name,
        slug,
        image,
        yearEnd,
        yearStart,
        gamesCount,
        imageBackground,
      ];
}

class RequirementsEntity extends Equatable {
  final String minimum;
  final String recommended;

  RequirementsEntity({required this.minimum, required this.recommended});

  List<Object> get props => [minimum, recommended];
}

class ParentPlatformsEntity extends Equatable {
  final ParentPlatformEntity? platform;

  ParentPlatformsEntity({this.platform});

  List<Object?> get props => [platform];
}

class ParentPlatformEntity extends Equatable {
  final int id;
  final String name;
  final String slug;

  ParentPlatformEntity({
    required this.id,
    required this.name,
    required this.slug,
  });

  List<Object> get props => [id, name, slug];
}

// class PlatformEntity {
//   final int id;
//   final String name;
//   final String slug;

//   PlatformEntity({required this.id, required this.name, required this.slug});

//   factory PlatformEntity.fromJson(Map<String, dynamic> json) {
//     return PlatformEntity(
//       id: json['id'],
//       name: json['name'],
//       slug: json['slug'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['slug'] = this.slug;
//     return data;
//   }
// }

class GenresEntity extends Equatable {
  final int id;
  final String name;
  final String slug;
  final int gamesCount;
  final String imageBackground;

  GenresEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.gamesCount,
    required this.imageBackground,
  });

  List<Object> get props => [id, name, slug, gamesCount, imageBackground];
}

class StoresEntity extends Equatable {
  final int? id;
  final StoreEntity? store;

  StoresEntity({this.id, this.store});

  List<Object?> get props => [id, store];
}

class StoreEntity extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String domain;
  final int gamesCount;
  final String imageBackground;

  StoreEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.domain,
    required this.gamesCount,
    required this.imageBackground,
  });

  List<Object> get props => [
        id,
        name,
        slug,
        domain,
        gamesCount,
        imageBackground,
      ];
}

class TagsEntity extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String language;
  final int gamesCount;
  final String imageBackground;

  TagsEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.language,
    required this.gamesCount,
    required this.imageBackground,
  });

  List<Object> get props => [
        id,
        name,
        slug,
        language,
        gamesCount,
        imageBackground,
      ];
}

class ShortScreenshotsEntity extends Equatable {
  final int? id;
  final String? image;

  ShortScreenshotsEntity({required this.id, required this.image});

  List<Object?> get props => [id, image];
}

class ESRBRatingEntity extends Equatable {
  final int id;
  final String name;
  final String slug;

  ESRBRatingEntity({
    required this.id,
    required this.name,
    required this.slug,
  });

  List<Object> get props => [id, name, slug];
}
