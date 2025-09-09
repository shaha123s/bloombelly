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

Future<String> checkChildWeight(
  double age,
  double weightKg,
  String gender,
) async {
  // Convert age to handle decimals
  int ageYears = age.floor();

  // Define weight data (50th percentile)
  Map<int, Map<String, double>> weightData = {
    0: {'boys': 3.3, 'girls': 3.2},
    1: {'boys': 9.6, 'girls': 8.9},
    2: {'boys': 12, 'girls': 12},
    3: {'boys': 15, 'girls': 14},
    4: {'boys': 17, 'girls': 15},
    5: {'boys': 19, 'girls': 18},
    6: {'boys': 21, 'girls': 20},
    7: {'boys': 23, 'girls': 22},
    8: {'boys': 25, 'girls': 26},
    9: {'boys': 28, 'girls': 28},
    10: {'boys': 31, 'girls': 32},
  };

  // Validate age range
  if (ageYears < 0 || ageYears > 10) {
    return "Age must be between 0 and 10 years";
  }

  // Get the reference weight for the age and gender
  // Support both English and Arabic terms
  String genderLower = gender.toLowerCase();
  String genderKey;

  if (genderLower == 'boy' ||
      genderLower == 'boys' ||
      genderLower == 'male' ||
      gender == 'ذكر') {
    genderKey = 'boys';
  } else if (genderLower == 'girl' ||
      genderLower == 'girls' ||
      genderLower == 'female' ||
      gender == 'انثى' ||
      gender == 'أنثى') {
    genderKey = 'girls';
  } else {
    return "Invalid gender. Please use: boy/girl, male/female, ذكر/انثى";
  }

  double? referenceWeight = weightData[ageYears]?[genderKey];

  if (referenceWeight == null) {
    return "No data available for this age";
  }

  // Calculate percentage difference
  double percentDiff = ((weightKg - referenceWeight) / referenceWeight) * 100;

  // Categorize based on deviation from normal (using ±15% as threshold for weight)
  String status;
  String detail;

  if (percentDiff < -15) {
    status = "Underweight";
    detail = "Weight is ${percentDiff.abs().toStringAsFixed(1)}% below average";
  } else if (percentDiff > 15) {
    status = "Overweight";
    detail = "Weight is ${percentDiff.toStringAsFixed(1)}% above average";
  } else {
    status = "Normal Weight";
    detail = "Weight is within normal range";
  }

  return "$status - $detail (Expected: ${referenceWeight}kg, Actual: ${weightKg}kg)";
}
