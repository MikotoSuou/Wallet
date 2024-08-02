
import 'package:intl/intl.dart';

extension DoubleExt on double? {

  String get toStringAmount {
    final amount = this ?? 0.0;
    final formatter = NumberFormat.simpleCurrency(locale: "en_PH", name: "₱");
    return formatter.format(amount);
  }

}