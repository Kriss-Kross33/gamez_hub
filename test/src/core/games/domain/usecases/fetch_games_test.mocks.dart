// Mocks generated by Mockito 5.3.2 from annotations
// in gamez_hub/test/src/core/games/domain/usecases/fetch_games_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:gamez_hub/src/core/error/failure.dart' as _i5;
import 'package:gamez_hub/src/core/games/data/models/game_enums.dart' as _i7;
import 'package:gamez_hub/src/core/games/domain/entities/game_entity.dart'
    as _i6;
import 'package:gamez_hub/src/core/games/domain/repositories/game_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GameRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockGameRepository extends _i1.Mock implements _i3.GameRepository {
  MockGameRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.GameEntity>>> fetchGameList(
          {_i7.GamesOrdering? ordering = _i7.GamesOrdering.none}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchGameList,
          [],
          {#ordering: ordering},
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.GameEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.GameEntity>>(
          this,
          Invocation.method(
            #fetchGameList,
            [],
            {#ordering: ordering},
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.GameEntity>>>);
}
