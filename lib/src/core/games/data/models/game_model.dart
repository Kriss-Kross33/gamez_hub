import 'package:gamez_hub/src/core/games/domain/entities/game_entity.dart';

class GameModel extends GameEntity {
  final int id;
  final String slug;
  final String name;
  final String? released;
  final bool tba;
  final String backgroundImage;
  final double rating;
  final int ratingTop;
  final List<RatingsModel>? ratings;
  final int ratingsCount;
  final int reviewsTextCount;
  final int added;
  final AddedByStatusModel? addedByStatus;
  final int? metacritic;
  final int playtime;
  final int suggestionsCount;
  final String updated;
  final Null userGame;
  final int reviewsCount;
  final String saturatedColor;
  final String dominantColor;
  final List<PlatformsModel>? platforms;
  final List<ParentPlatformsModel>? parentPlatforms;
  final List<GenresModel>? genres;
  final List<StoresModel>? stores;
  final Null clip;
  final List<TagsModel>? tags;
  final ESRBRatingModel? esrbRating;
  final List<ShortScreenshotsModel>? shortScreenshots;

  GameModel(
      {required this.id,
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
      this.shortScreenshots})
      : super(
          id: id,
          slug: slug,
          name: name,
          released: released,
          tba: tba,
          backgroundImage: backgroundImage,
          rating: rating,
          ratingTop: ratingTop,
          ratings: ratings,
          ratingsCount: ratingsCount,
          reviewsTextCount: reviewsTextCount,
          addedByStatus: addedByStatus,
          added: added,
          metacritic: metacritic,
          playtime: playtime,
          suggestionsCount: suggestionsCount,
          updated: updated,
          userGame: userGame,
          reviewsCount: reviewsCount,
          saturatedColor: saturatedColor,
          dominantColor: dominantColor,
          platforms: platforms,
          parentPlatforms: parentPlatforms,
          genres: genres,
          stores: stores,
          clip: clip,
          tags: tags,
          esrbRating: esrbRating,
          shortScreenshots: shortScreenshots,
        );

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      released: json['released'],
      tba: json['tba'],
      backgroundImage: json['background_image'],
      rating: json['rating'],
      ratingTop: json['rating_top'],
      ratings: json['ratings'] != null ? _getRatingList(json) : null,
      ratingsCount: json['ratings_count'],
      reviewsTextCount: json['reviews_text_count'],
      added: json['added'],
      addedByStatus: json['added_by_status'] != null
          ? new AddedByStatusModel.fromJson(json['added_by_status'])
          : null,
      metacritic: json['metacritic'],
      playtime: json['playtime'],
      suggestionsCount: json['suggestions_count'],
      updated: json['updated'],
      userGame: json['user_game'],
      reviewsCount: json['reviews_count'],
      saturatedColor: json['saturated_color'],
      dominantColor: json['dominant_color'],
      platforms: json['platforms'] != null ? _getPlatformList(json) : null,
      parentPlatforms: json['parent_platforms'] != null
          ? _getParentPlatformList(json)
          : null,
      genres: json['genres'] != null ? _getGenreList(json) : null,
      stores: json['stores'] != null ? _getStoreList(json) : null,
      tags: json['tags'] != null ? _getTagList(json) : null,
      shortScreenshots:
          json['short_screenshots'] != null ? _getScreenshotList(json) : null,
      clip: json['clip'],
      esrbRating: json['esrb_rating'] != null
          ? new ESRBRatingModel.fromJson(json['esrb_rating'])
          : null,
    );
  }

  static List<RatingsModel> _getRatingList(Map<String, dynamic> json) {
    List<RatingsModel> _ratings = <RatingsModel>[];
    json['ratings'].forEach((v) {
      _ratings.add(new RatingsModel.fromJson(v));
    });
    return _ratings;
  }

  static List<PlatformsModel> _getPlatformList(Map<String, dynamic> json) {
    List<PlatformsModel> _platforms = <PlatformsModel>[];
    json['platforms'].forEach((v) {
      _platforms.add(new PlatformsModel.fromJson(v));
    });
    return _platforms;
  }

  static List<GenresModel> _getGenreList(Map<String, dynamic> json) {
    List<GenresModel> _genres = <GenresModel>[];
    json['genres'].forEach((v) {
      _genres.add(new GenresModel.fromJson(v));
    });
    return _genres;
  }

  static List<StoresModel> _getStoreList(Map<String, dynamic> json) {
    List<StoresModel> _stores = <StoresModel>[];
    json['stores'].forEach((v) {
      _stores.add(new StoresModel.fromJson(v));
    });
    return _stores;
  }

  static List<TagsModel> _getTagList(Map<String, dynamic> json) {
    List<TagsModel> _tags = <TagsModel>[];
    json['tags'].forEach((v) {
      _tags.add(new TagsModel.fromJson(v));
    });
    return _tags;
  }

  static List<ShortScreenshotsModel> _getScreenshotList(
      Map<String, dynamic> json) {
    List<ShortScreenshotsModel> _screenshots = <ShortScreenshotsModel>[];
    json['short_screenshots'].forEach((v) {
      _screenshots.add(new ShortScreenshotsModel.fromJson(v));
    });
    return _screenshots;
  }

  static List<ParentPlatformsModel> _getParentPlatformList(
      Map<String, dynamic> json) {
    List<ParentPlatformsModel> _parentPlatforms = <ParentPlatformsModel>[];
    json['parent_platforms'].forEach((v) {
      _parentPlatforms.add(new ParentPlatformsModel.fromJson(v));
    });

    return _parentPlatforms;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['released'] = this.released;
    data['tba'] = this.tba;
    data['background_image'] = this.backgroundImage;
    data['rating'] = this.rating;
    data['rating_top'] = this.ratingTop;
    data['ratings'] = this.ratings?.map((v) => v.toJson()).toList();
    data['ratings_count'] = this.ratingsCount;
    data['reviews_text_count'] = this.reviewsTextCount;
    data['added'] = this.added;
    data['added_by_status'] = this.addedByStatus?.toJson();
    data['metacritic'] = this.metacritic;
    data['playtime'] = this.playtime;
    data['suggestions_count'] = this.suggestionsCount;
    data['updated'] = this.updated;
    data['user_game'] = this.userGame;
    data['reviews_count'] = this.reviewsCount;
    data['saturated_color'] = this.saturatedColor;
    data['dominant_color'] = this.dominantColor;
    data['platforms'] = this.platforms?.map((v) => v.toJson()).toList();
    data['parent_platforms'] =
        this.parentPlatforms?.map((v) => v.toJson()).toList();
    data['genres'] = this.genres?.map((v) => v.toJson()).toList();
    data['stores'] = this.stores?.map((v) => v.toJson()).toList();
    data['clip'] = this.clip;
    data['tags'] = this.tags?.map((v) => v.toJson()).toList();
    data['esrb_rating'] = this.esrbRating?.toJson();
    data['short_screenshots'] =
        this.shortScreenshots?.map((v) => v.toJson()).toList();
    return data;
  }
}

class RatingsModel extends RatingsEntity {
  final int id;
  final String title;
  final int count;
  final double percent;

  RatingsModel({
    required this.id,
    required this.title,
    required this.count,
    required this.percent,
  }) : super(
          id: id,
          count: count,
          title: title,
          percent: percent,
        );

  factory RatingsModel.fromJson(Map<String, dynamic> json) {
    return RatingsModel(
      id: json['id'],
      title: json['title'],
      count: json['count'],
      percent: json['percent'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['count'] = this.count;
    data['percent'] = this.percent;
    return data;
  }
}

class AddedByStatusModel extends AddedByStatusEntity {
  final int? yet;
  final int owned;
  final int beaten;
  final int? toplay;
  final int? dropped;
  final int? playing;

  AddedByStatusModel({
    required this.yet,
    required this.owned,
    required this.beaten,
    required this.toplay,
    required this.dropped,
    required this.playing,
  }) : super(
          yet: yet,
          owned: owned,
          beaten: beaten,
          toplay: toplay,
          dropped: dropped,
          playing: playing,
        );

  factory AddedByStatusModel.fromJson(Map<String, dynamic> json) {
    return AddedByStatusModel(
      yet: json['yet'],
      owned: json['owned'],
      beaten: json['beaten'],
      toplay: json['toplay'],
      dropped: json['dropped'],
      playing: json['playing'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yet'] = this.yet;
    data['owned'] = this.owned;
    data['beaten'] = this.beaten;
    data['toplay'] = this.toplay;
    data['dropped'] = this.dropped;
    data['playing'] = this.playing;
    return data;
  }
}

class PlatformsModel extends PlatformsEntity {
  final PlatformModel? platform;
  final String? releasedAt;
  final RequirementsModel? requirementsEn;
  final RequirementsModel? requirementsRu;

  PlatformsModel({
    this.platform,
    this.releasedAt,
    this.requirementsEn,
    this.requirementsRu,
  }) : super(
          platform: platform,
          releasedAt: releasedAt,
          requirementsEn: requirementsEn,
          requirementsRu: requirementsRu,
        );

  factory PlatformsModel.fromJson(Map<String, dynamic> json) {
    return PlatformsModel(
      platform: json['platform'] != null
          ? new PlatformModel.fromJson(json['platform'])
          : null,
      releasedAt: json['released_at'],
      requirementsEn: json['requirements_en'] != null
          ? new RequirementsModel.fromJson(json['requirements_en'])
          : null,
      requirementsRu: json['requirements_ru'] != null
          ? new RequirementsModel.fromJson(json['requirements_ru'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['platform'] = this.platform?.toJson();
    data['released_at'] = this.releasedAt;
    data['requirements_en'] = this.requirementsEn?.toJson();
    data['requirements_ru'] = this.requirementsRu?.toJson();
    return data;
  }
}

class PlatformModel extends PlatformEntity {
  final int id;
  final String name;
  final String slug;
  final String? image;
  final int? yearEnd;
  final int? yearStart;
  final int? gamesCount;
  final String? imageBackground;

  PlatformModel({
    required this.id,
    required this.name,
    required this.slug,
    this.image,
    this.yearEnd,
    this.yearStart,
    this.gamesCount,
    this.imageBackground,
  }) : super(id: id, name: name, slug: slug);

  factory PlatformModel.fromJson(Map<String, dynamic> json) {
    return PlatformModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      yearEnd: json['year_end'],
      yearStart: json['year_start'],
      gamesCount: json['games_count'],
      imageBackground: json['image_background'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image'] = this.image;
    data['year_end'] = this.yearEnd;
    data['year_start'] = this.yearStart;
    data['games_count'] = this.gamesCount;
    data['image_background'] = this.imageBackground;
    return data;
  }
}

class RequirementsModel extends RequirementsEntity {
  final String minimum;
  final String? recommended;

  RequirementsModel({
    required this.minimum,
    required this.recommended,
  }) : super(minimum: minimum, recommended: recommended);

  factory RequirementsModel.fromJson(Map<String, dynamic> json) {
    return RequirementsModel(
      minimum: json['minimum'],
      recommended: json['recommended'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['minimum'] = this.minimum;
    data['recommended'] = this.recommended;
    return data;
  }
}

class RequirementsRuModel extends RequirementsEntity {
  final String minimum;
  final String recommended;

  RequirementsRuModel({
    required this.minimum,
    required this.recommended,
  }) : super(minimum: minimum, recommended: recommended);

  factory RequirementsRuModel.fromJson(Map<String, dynamic> json) {
    return RequirementsRuModel(
      minimum: json['minimum'],
      recommended: json['recommended'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['minimum'] = this.minimum;
    data['recommended'] = this.recommended;
    return data;
  }
}

class ParentPlatformsModel extends ParentPlatformsEntity {
  final ParentPlatformModel? platform;

  ParentPlatformsModel({this.platform}) : super(platform: platform);

  factory ParentPlatformsModel.fromJson(Map<String, dynamic> json) {
    return ParentPlatformsModel(
      platform: json['platform'] != null
          ? new ParentPlatformModel.fromJson(json['platform'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['platform'] = this.platform?.toJson();
    return data;
  }
}

class ParentPlatformModel extends ParentPlatformEntity {
  final int id;
  final String name;
  final String slug;

  ParentPlatformModel({
    required this.id,
    required this.name,
    required this.slug,
  }) : super(id: id, name: name, slug: slug);

  factory ParentPlatformModel.fromJson(Map<String, dynamic> json) {
    return ParentPlatformModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

// class PlatformModel {
//   final int id;
//   final String name;
//   final String slug;

//   PlatformModel({required this.id, required this.name, required this.slug});

//   factory PlatformModel.fromJson(Map<String, dynamic> json) {
//     return PlatformModel(
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

class GenresModel extends GenresEntity {
  final int id;
  final String name;
  final String slug;
  final int gamesCount;
  final String imageBackground;

  GenresModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.gamesCount,
    required this.imageBackground,
  }) : super(
          id: id,
          name: name,
          slug: slug,
          gamesCount: gamesCount,
          imageBackground: imageBackground,
        );

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      gamesCount: json['games_count'],
      imageBackground: json['image_background'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['games_count'] = this.gamesCount;
    data['image_background'] = this.imageBackground;
    return data;
  }
}

class StoresModel extends StoresEntity {
  final int? id;
  final StoreModel? store;

  StoresModel({this.id, this.store}) : super(id: id, store: store);

  factory StoresModel.fromJson(Map<String, dynamic> json) {
    return StoresModel(
      id: json['id'],
      store:
          json['store'] != null ? new StoreModel.fromJson(json['store']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['store'] = this.store?.toJson();
    return data;
  }
}

class StoreModel extends StoreEntity {
  final int id;
  final String name;
  final String slug;
  final String domain;
  final int gamesCount;
  final String imageBackground;

  StoreModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.domain,
    required this.gamesCount,
    required this.imageBackground,
  }) : super(
          id: id,
          name: name,
          slug: slug,
          domain: domain,
          gamesCount: gamesCount,
          imageBackground: imageBackground,
        );

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      domain: json['domain'],
      gamesCount: json['games_count'],
      imageBackground: json['image_background'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['domain'] = this.domain;
    data['games_count'] = this.gamesCount;
    data['image_background'] = this.imageBackground;
    return data;
  }
}

class TagsModel extends TagsEntity {
  final int id;
  final String name;
  final String slug;
  final String language;
  final int gamesCount;
  final String imageBackground;

  TagsModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.language,
    required this.gamesCount,
    required this.imageBackground,
  }) : super(
          id: id,
          name: name,
          slug: slug,
          language: language,
          gamesCount: gamesCount,
          imageBackground: imageBackground,
        );

  factory TagsModel.fromJson(Map<String, dynamic> json) {
    return TagsModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      language: json['language'],
      gamesCount: json['games_count'],
      imageBackground: json['image_background'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['language'] = this.language;
    data['games_count'] = this.gamesCount;
    data['image_background'] = this.imageBackground;
    return data;
  }
}

class ShortScreenshotsModel extends ShortScreenshotsEntity {
  final int? id;
  final String? image;

  ShortScreenshotsModel({required this.id, required this.image})
      : super(
          id: id,
          image: image,
        );

  factory ShortScreenshotsModel.fromJson(Map<String, dynamic> json) {
    return ShortScreenshotsModel(
      id: json['id'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}

class ESRBRatingModel extends ESRBRatingEntity {
  final int id;
  final String name;
  final String slug;

  ESRBRatingModel({
    required this.id,
    required this.name,
    required this.slug,
  }) : super(id: id, name: name, slug: slug);

  factory ESRBRatingModel.fromJson(Map<String, dynamic> json) {
    return ESRBRatingModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}
