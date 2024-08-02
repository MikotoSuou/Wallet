
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet/features/home/data/responses/user_response.dart';
import 'package:wallet/features/home/domain/entities/user_detail.dart';

import '../../../../fixtures/stub_json/fixtures.dart';
import '../../../../fixtures/stub_json/json_reader.dart';

void main() {

  group("fromJson", () {
    test("should return a valid ProductDetailResponse from JSON", () async {
      const expectedResult = UserResponse(id: "1", name: "test", balance: 1.0);
      final Map<String, dynamic> jsonMap = json.decode(readJson(Fixtures.userResponse));
      final result = UserResponse.fromJson(jsonMap);
      expect(result, expectedResult);
    });
  });

  group("toDomain", () {
    test("should be mapped properly to UserDetail entity", () async {
      const response = UserResponse(id: "1", name: "test", balance: 1);
      const expectedResult = UserDetail(id: "1", name: "test", balance: 1);
      final result = response.toDomain;
      expect(result, expectedResult);
    });
  });

}