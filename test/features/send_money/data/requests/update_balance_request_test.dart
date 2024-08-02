
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet/features/send_money/data/requests/send_money_request.dart';
import 'package:wallet/features/send_money/data/requests/update_balance_request.dart';
import '../../../../fixtures/stub_json//json_reader.dart';
import '../../../../fixtures/stub_json/fixtures.dart';

void main() {

  group("fromJson", () {
    test("should return a valid update balance request model from JSON", () async {
      const expectedResult = UpdateBalanceRequest(balance: 1.0);
      final Map<String, dynamic> jsonMap = json.decode(readJson(Fixtures.updateBalanceRequest));
      final result = UpdateBalanceRequest.fromJson(jsonMap);
      expect(result, expectedResult);
    });
  });

  group("toJson", () {
    test("should return a valid update balance request JSON", () async {
      const updateBalanceRequest = UpdateBalanceRequest(balance: 1.0);
      final Map<String, dynamic> expectedJsonMap = json.decode(readJson(Fixtures.updateBalanceRequest));
      final result = updateBalanceRequest.toJson();
      expect(result, expectedJsonMap);
    });
  });

}