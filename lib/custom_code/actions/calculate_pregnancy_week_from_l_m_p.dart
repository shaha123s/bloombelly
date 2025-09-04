// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

int calculatePregnancyWeekFromLMP(String lmpDate) {
  try {
    DateTime lmp = DateTime.parse(lmpDate); // Format: YYYY-MM-DD
    DateTime today = DateTime.now();

    int daysDifference = today.difference(lmp).inDays;

    if (daysDifference < 0) return -1;

    int weekNumber = daysDifference ~/ 7;
    return weekNumber;
  } catch (e) {
    return -1; // Invalid format or parsing error
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
