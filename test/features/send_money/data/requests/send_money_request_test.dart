
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet/features/send_money/data/requests/send_money_request.dart';
import '../../../../fixtures/stub_json//json_reader.dart';
import '../../../../fixtures/stub_json/fixtures.dart';

void main() {

  group("fromJson", () {
    test("should return a valid send money request model from JSON", () async {
      const expectedResult = SendMoneyRequest(amount: 1.0, date: "Aug 02, 2024", time: "11:11 AM");
      final Map<String, dynamic> jsonMap = json.decode(readJson(Fixtures.sendMoneyRequest));
      final result = SendMoneyRequest.fromJson(jsonMap);
      expect(result, expectedResult);
    });
  });

  group("toJson", () {
    test("should return a valid send money request JSON", () async {
      const sendMoneyRequest = SendMoneyRequest(amount: 1.0, date: "Aug 02, 2024", time: "11:11 AM");
      final Map<String, dynamic> expectedJsonMap = json.decode(readJson(Fixtures.sendMoneyRequest));
      final result = sendMoneyRequest.toJson();
      expect(result, expectedJsonMap);
    });
  });

}