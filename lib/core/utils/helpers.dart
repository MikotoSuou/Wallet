
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String get currentDate {
  final todayDateTime = DateTime.now();
  final dateFormatter = DateFormat('MMM dd, yyyy');
  return dateFormatter.format(todayDateTime);
}

String get currentTime {
  final todayDateTime = DateTime.now();
  final timeFormatter = DateFormat('h:mm a');
  return timeFormatter.format(todayDateTime);
}

void hideSoftKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}