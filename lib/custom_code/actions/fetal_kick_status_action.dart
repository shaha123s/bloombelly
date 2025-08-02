// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String?> fetalKickStatusAction(
  int? weekNumber,
  int? kickCount,
  String? windowType,
) async {
  //  Custom FlutterFlow action that rates fetal kick counts by gestational week and counting window (hour, 2-hour, day, week). Before week 28 it returns “Kick counting not recommended”. From week 28 onward it compares kicks to clinical minimums: <5/hour, <10/2 hrs, <10/day or <70/week = “Below normal”; 70-140/week = “Normal”; >140/week = “Above normal”. Output is an Arabic status string, useful for colored alerts, icons, or notifications. Thresholds can be tweaked in code to match doctor advice.
  // Check if week number is less than 28
  if (weekNumber == null || weekNumber < 28) {
    return "Kick counting not recommende"; // Return message for weeks before 28
  }

  // Define thresholds for kick counts based on the counting window
  int belowNormalThreshold = 0;
  int normalThresholdMin = 70;
  int normalThresholdMax = 140;

  // Determine thresholds based on the window type
  switch (windowType) {
    case 'hour':
      belowNormalThreshold = 5;
      break;
    case '2-hour':
      belowNormalThreshold = 10;
      break;
    case 'day':
      belowNormalThreshold = 10;
      break;
    case 'week':
      belowNormalThreshold = 70;
      break;
    default:
      return "Invalid window type"; // Return message for invalid window type
  }

  // Evaluate kick count against thresholds
  if (kickCount == null || kickCount < belowNormalThreshold) {
    return "Below normal"; // Below normal kicks
  } else if (kickCount >= normalThresholdMin &&
      kickCount <= normalThresholdMax) {
    return "Normal"; // Normal kicks
  } else if (kickCount > normalThresholdMax) {
    return "Above normal"; // Above normal kicks
  }

  return null;
}
