import 'package:gamez_hub/src/core/games/data/models/game_model.dart';

GameModel gameModelTst = GameModel(
  id: 3498,
  slug: "grand-theft-auto-v",
  name: "Grand Theft Auto V",
  released: "2013-09-17",
  tba: false,
  backgroundImage:
      "https://media.rawg.io/media/games/84d/84da2ac3fdfc6507807a1808595afb12.jpg",
  rating: 4.48,
  ratingTop: 5,
  ratings: <RatingsModel>[
    RatingsModel(id: 5, title: "exceptional", count: 2931, percent: 59.15),
    RatingsModel(id: 4, title: "recommended", count: 1629, percent: 32.88),
    RatingsModel(id: 3, title: "meh", count: 312, percent: 6.3),
    RatingsModel(id: 1, title: "skip", count: 83, percent: 1.68),
  ],
  ratingsCount: 4900,
  reviewsTextCount: 33,
  added: 15344,
  addedByStatus: AddedByStatusModel(
      yet: 385,
      owned: 9154,
      beaten: 4076,
      toplay: 422,
      dropped: 748,
      playing: 559),
  metacritic: 97,
  playtime: 70,
  suggestionsCount: 410,
  updated: "2021-03-03T20:31:29",
  userGame: null,
  reviewsCount: 4955,
  saturatedColor: "0f0f0f",
  dominantColor: "0f0f0f",
  platforms: <PlatformsModel>[
    PlatformsModel(
      platform: PlatformModel(
          id: 187,
          name: "PlayStation 5",
          slug: "playstation5",
          image: null,
          yearEnd: null,
          yearStart: 2020,
          gamesCount: 275,
          imageBackground:
              "https://media.rawg.io/media/games/a59/a5993b9f84944570a31cb6ad08bfe502.jpg"),
      releasedAt: "2013-09-17",
      requirementsEn: null,
      requirementsRu: null,
    ),
    PlatformsModel(
        platform: PlatformModel(
            id: 18,
            name: "PlayStation 4",
            slug: "playstation4",
            image: null,
            yearEnd: null,
            yearStart: null,
            gamesCount: 5997,
            imageBackground:
                "https://media.rawg.io/media/games/d82/d82990b9c67ba0d2d09d4e6fa88885a7.jpg"),
        releasedAt: "2013-09-17",
        requirementsEn: null,
        requirementsRu: null),
  ],
  parentPlatforms: <ParentPlatformsModel>[
    ParentPlatformsModel(
      platform: ParentPlatformModel(id: 1, name: "PC", slug: "pc"),
    ),
    ParentPlatformsModel(
      platform:
          ParentPlatformModel(id: 2, name: "PlayStation", slug: "playstation"),
    ),
    ParentPlatformsModel(
      platform: ParentPlatformModel(id: 3, name: "Xbox", slug: "xbox"),
    ),
  ],
  genres: <GenresModel>[
    GenresModel(
        id: 4,
        name: "Action",
        slug: "action",
        gamesCount: 123265,
        imageBackground:
            "https://media.rawg.io/media/games/d1a/d1a2e99ade53494c6330a0ed945fe823.jpg"),
    GenresModel(
        id: 3,
        name: "Adventure",
        slug: "adventure",
        gamesCount: 90640,
        imageBackground:
            "https://media.rawg.io/media/games/7fa/7fa0b586293c5861ee32490e953a4996.jpg"),
  ],
  stores: <StoresModel>[
    StoresModel(
        id: 290375,
        store: StoreModel(
            id: 3,
            name: "PlayStation Store",
            slug: "playstation-store",
            domain: "store.playstation.com",
            gamesCount: 7659,
            imageBackground:
                "https://media.rawg.io/media/games/4a0/4a0a1316102366260e6f38fd2a9cfdce.jpg")),
    StoresModel(
      id: 438095,
      store: StoreModel(
          id: 11,
          name: "Epic Games",
          slug: "epic-games",
          domain: "epicgames.com",
          gamesCount: 557,
          imageBackground:
              "https://media.rawg.io/media/games/879/879c930f9c6787c920153fa2df452eb3.jpg"),
    ),
  ],
  clip: null,
  tags: <TagsModel>[
    TagsModel(
        id: 31,
        name: "Singleplayer",
        slug: "singleplayer",
        language: "eng",
        gamesCount: 123607,
        imageBackground:
            "https://media.rawg.io/media/games/bc0/bc06a29ceac58652b684deefe7d56099.jpg"),
    TagsModel(
        id: 7,
        name: "Multiplayer",
        slug: "multiplayer",
        language: "eng",
        gamesCount: 26309,
        imageBackground:
            "https://media.rawg.io/media/games/15c/15c95a4915f88a3e89c821526afe05fc.jpg"),
    TagsModel(
        id: 24,
        name: "RPG",
        slug: "rpg",
        language: "eng",
        gamesCount: 12200,
        imageBackground:
            "https://media.rawg.io/media/games/588/588c6bdff3d4baf66ec36b1c05b793bf.jpg"),
  ],
  esrbRating: ESRBRatingModel(id: 4, name: "Mature", slug: "mature"),
  shortScreenshots: <ShortScreenshotsModel>[
    ShortScreenshotsModel(
        id: -1,
        image:
            "https://media.rawg.io/media/games/84d/84da2ac3fdfc6507807a1808595afb12.jpg"),
    ShortScreenshotsModel(
        id: 1827221,
        image:
            "https://media.rawg.io/media/screenshots/a7c/a7c43871a54bed6573a6a429451564ef.jpg"),
  ],
);

List<GameModel> gameModelsTst = <GameModel>[
  gameModelTst,
];
