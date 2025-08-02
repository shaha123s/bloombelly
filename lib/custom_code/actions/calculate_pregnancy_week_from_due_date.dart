// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

int calculatePregnancyWeekFromDueDate(String dueDate) {
  try {
    DateTime due = DateTime.parse(dueDate); // Format: YYYY-MM-DD
    DateTime today = DateTime.now();

    int daysUntilDue = due.difference(today).inDays;
    int currentWeek = 40 - (daysUntilDue ~/ 7);

    if (currentWeek < 0 || currentWeek > 40) return -1;

    return currentWeek;
  } catch (e) {
    return -1; // Invalid date format or error
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
