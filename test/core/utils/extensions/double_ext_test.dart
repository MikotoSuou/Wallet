import 'package:flutter_test/flutter_test.dart';
import 'package:wallet/core/utils/extensions/double_ext.dart';

void main() {
  group('toStringAmount', () {
    test('should format amount correctly', () {
      // Arrange
      const amount = 123.45;
      const expected = '₱123.45';

      // Act
      final result = amount.toStringAmount;

      // Assert
      expect(result, expected);
    });

    test('should handle null amount', () {
      // Arrange
      double? amount;
      const expected = '₱0.00';

      // Act
      final result = amount.toStringAmount;

      // Assert
      expect(result, expected);
    });
  });
}