
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'network_info_mock.mocks.dart';

void main() {
  late MockNetworkInfo networkInfo;

  setUp(() {
    networkInfo = MockNetworkInfo();
  });

  group("isNetworkConnected", () {
    test("should return true when network is connected", () async {
      when(networkInfo.isNetworkConnected)
          .thenAnswer((_) async => true);

      final result = await networkInfo.isNetworkConnected;

      verify(networkInfo.isNetworkConnected);
      expect(result, isTrue);
    });

    test("should return false when network is not connected", () async {
      when(networkInfo.isNetworkConnected)
          .thenAnswer((_) async => false);

      final result = await networkInfo.isNetworkConnected;

      verify(networkInfo.isNetworkConnected);
      expect(result, isFalse);
    });
  });
}