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

// sum tow number with zero cae
Future<double?> totalllbalance(
  double? balance,
  double? cost,
) async {
  // Handle null cases - return 0.0 if both are null
  if (balance == null && cost == null) {
    return 0.0;
  }

  // Handle individual null cases by treating null as 0
  double safeBalance = balance ?? 0.0;
  double safeCost = cost ?? 0.0;

  // Sum the two numbers
  return safeBalance - safeCost;
}
