
import 'package:intl/intl.dart';
import 'package:wallet/core/utils/constants.dart';

extension StringExt on String? {

  DateTime get toTime {
    final displayTime = this ?? Constants.emptyString;
    final dateTime = DateFormat("h:mm a").tryParse(displayTime) ?? DateTime.timestamp();
    return dateTime;
  }

  DateTime get toDate {
    final displayDate = this ?? Constants.emptyString;
    final dateTime = DateFormat("MMM dd, yyyy").tryParse(displayDate) ?? DateTime.timestamp();
    return dateTime;
  }

}