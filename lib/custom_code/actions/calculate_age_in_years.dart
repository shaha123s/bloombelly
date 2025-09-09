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

Future<int> calculateAgeInYears(DateTime dateOfBirth) async {
  // Get current date
  DateTime currentDate = DateTime.now();

  // Calculate age
  int age = currentDate.year - dateOfBirth.year;

  // Check if birthday hasn't occurred yet this year
  if (currentDate.month < dateOfBirth.month ||
      (currentDate.month == dateOfBirth.month &&
          currentDate.day < dateOfBirth.day)) {
    age--;
  }

  // Return age in years
  return age;
}
