
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet/features/transactions/data/responses/transaction_response.dart';
import 'package:wallet/features/transactions/domain/entities/transaction.dart';

import '../../../../fixtures/stub_json/fixtures.dart';
import '../../../../fixtures/stub_json/json_reader.dart';

void main() {

  group("fromJson", () {
    test("should return a valid TransactionResponse from JSON", () async {
      const response = TransactionResponse(id: "1", amount: 1.0, date: "Aug 02, 2024", time: "11:11 AM");
      final Map<String, dynamic> jsonMap = json.decode(readJson(Fixtures.transactionResponse));
      final result = TransactionResponse.fromJson(jsonMap);
      expect(result, response);
    });
  });

  group("toDomain", () {
    test("should be mapped properly to Transaction entity", () async {
      const response = TransactionResponse(id: "1", amount: 1.0, date: "Aug 02, 2024", time: "11:11 AM");
      const expectedResult = Transaction(id: "1", amount: 1.0, date: "Aug 02, 2024", time: "11:11 AM");
      final result = response.toDomain;
      expect(result, expectedResult);
    });
  });

}