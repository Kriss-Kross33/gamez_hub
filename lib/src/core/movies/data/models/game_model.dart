class GameModel {
  final int id;
  final String slug;
  final String name;
  final String released;
  final bool tba;
  final String backgroundImage;
  final int rating;
  final int ratingTop;
  // final Ratings ratings;
  final int ratingsCount;
  final String reviewsTextCount;
  final int added;
  // final Ratings addedByStatus;
  final int metacritic;
  final int playtime;
  final int suggestionsCount;
  final String updated;
  final EsrbRatingModel esrbRating;
  final List<PlatformsModel> platforms;

  GameModel({
    required this.id,
    required this.slug,
    required this.name,
    required this.released,
    required this.tba,
    required this.backgroundImage,
    required this.rating,
    required this.ratingTop,
    // required this.ratings,
    required this.ratingsCount,
    required this.reviewsTextCount,
    required this.added,
    // required this.addedByStatus,
    required this.metacritic,
    required this.playtime,
    required this.suggestionsCount,
    required this.updated,
    required this.esrbRating,
    required this.platforms,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    final _platforms = <PlatformsModel>[];
    json['platforms'].forEach((platform) {
      _platforms.add(new PlatformsModel.fromJson(platform));
    });
    return GameModel(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      released: json['released'],
      tba: json['tba'],
      backgroundImage: json['background_image'],
      rating: json['rating'],
      ratingTop: json['rating_top'],
      // ratings: Ratings.fromJson(json['ratings']),
      ratingsCount: json['ratings_count'],
      reviewsTextCount: json['reviews_text_count'],
      added: json['added'],
      //addedByStatus: Ratings.fromJson(json['added_by_status']),

      metacritic: json['metacritic'],
      playtime: json['playtime'],
      suggestionsCount: json['suggestions_count'],
      updated: json['updated'],
      esrbRating: EsrbRatingModel.fromJson(json['esrb_rating']),
      platforms: _platforms,
      // if (json['platforms'] != null) {
      //   platforms = new List<Platforms>(),
      //   json['platforms'].forEach((v) {
      //     platforms.add(new Platforms.fromJson(v)),
      //   }),
      // }
    );
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
    // if (this.ratings != null) {
    //   data['ratings'] = this.ratings.toJson();
    // }
    data['ratings_count'] = this.ratingsCount;
    data['reviews_text_count'] = this.reviewsTextCount;
    data['added'] = this.added;
    // if (this.addedByStatus != null) {
    //   data['added_by_status'] = this.addedByStatus.toJson();
    // }
    data['metacritic'] = this.metacritic;
    data['playtime'] = this.playtime;
    data['suggestions_count'] = this.suggestionsCount;
    data['updated'] = this.updated;
    if (this.esrbRating != null) {
      data['esrb_rating'] = this.esrbRating.toJson();
    }
    if (this.platforms != null) {
      data['platforms'] = this.platforms.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlatformsModel {
  final EsrbRatingModel platform;
  final String releasedAt;
  final RequirementsModel requirements;

  PlatformsModel(
      {required this.platform,
      required this.releasedAt,
      required this.requirements});

  factory PlatformsModel.fromJson(Map<String, dynamic> json) {
    return PlatformsModel(
      platform: EsrbRatingModel.fromJson(json['platform']),
      releasedAt: json['released_at'],
      requirements: RequirementsModel.fromJson(json['requirements']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.platform != null) {
      data['platform'] = this.platform.toJson();
    }
    data['released_at'] = this.releasedAt;
    if (this.requirements != null) {
      data['requirements'] = this.requirements.toJson();
    }
    return data;
  }
}

class EsrbRatingModel {
  final int id;
  final String slug;
  final String name;

  EsrbRatingModel({required this.id, required this.slug, required this.name});

  factory EsrbRatingModel.fromJson(Map<String, dynamic> json) {
    return EsrbRatingModel(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    return data;
  }
}

class RequirementsModel {
  final String minimum;
  final String recommended;

  RequirementsModel({required this.minimum, required this.recommended});

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

// class Ratings {
//   final int id;

//   Ratings({required this.id});

//   factory Ratings.fromJson(Map<String, dynamic> json) {
//     return Ratings(id: json['id']);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     return data;
//   }
// }
