import 'package:flutter_test/flutter_test.dart';
import 'package:gamez_hub/src/core/network/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late MockInternetConnectionChecker mockInternetConnectionChecker;
  late NetworkInfo networkInfo;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockInternetConnectionChecker);
  });

  group('hasConnection', () {
    final tHasConnectionFuture = Future.value(true);
    test('should forward the call to InternectConnectionChecker.hasConnection',
        () async {
      //*
      when(mockInternetConnectionChecker.hasConnection)
          .thenAnswer((realInvocation) => tHasConnectionFuture);
      //*
      final result = networkInfo.hasConnection;
      //*
      verify(mockInternetConnectionChecker.hasConnection);
      expect(result, tHasConnectionFuture);
    });
  });
}
