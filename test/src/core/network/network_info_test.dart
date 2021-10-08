import 'package:flutter_test/flutter_test.dart';
import 'package:gamez_hub/src/core/network/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late MockInternetConnectionChecker mockConnectionChecker;
  late NetworkInfo networkInfo;

  setUp(() {
    mockConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockConnectionChecker);
  });

  group('hasConnection', () {
    test('should forward the call to InternectConnectionChecker.hasConnection',
        () async {
      //*
      final tHasConnectionFuture = await Future.value(true);
      when(mockConnectionChecker.hasConnection)
          .thenAnswer((_) async => tHasConnectionFuture);
      //*
      final result = await networkInfo.hasConnection;
      //*
      verify(mockConnectionChecker.hasConnection);
      expect(result, tHasConnectionFuture);
    });
  });
}
