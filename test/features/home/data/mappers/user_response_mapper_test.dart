
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet/features/home/data/mappers/user_response_mapper.dart';
import 'package:wallet/features/home/data/responses/user_response.dart';
import 'package:wallet/features/home/domain/entities/user_detail.dart';


void main() {
  group("toDomain", () {
    test("UserResponse should be mapped properly to UserDetail entity", () async {
      const response = UserResponse(id: "1", name: "test", balance: 1);
      const expectedResult = UserDetail(id: "1", name: "test", balance: 1);
      final result = response.toDomain;
      expect(result, expectedResult);
    });
  });
}