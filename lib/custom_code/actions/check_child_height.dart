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

Future<String> checkChildHeight(
  double age,
  double heightCm,
  String gender,
) async {
  // Convert age to handle decimals (e.g., 1.5 years)
  int ageYears = age.floor();

  // Define height data (50th percentile)
  Map<int, Map<String, double>> heightData = {
    0: {'boys': 49, 'girls': 49},
    1: {'boys': 76, 'girls': 74},
    2: {'boys': 86, 'girls': 85},
    3: {'boys': 95, 'girls': 94},
    4: {'boys': 102, 'girls': 100},
    5: {'boys': 109, 'girls': 108},
    6: {'boys': 115, 'girls': 114},
    7: {'boys': 122, 'girls': 121},
    8: {'boys': 128, 'girls': 128},
    9: {'boys': 133, 'girls': 133},
    10: {'boys': 138, 'girls': 138},
  };

  // Validate age range
  if (ageYears < 0 || ageYears > 10) {
    return "Age must be between 0 and 10 years";
  }

  // Get the reference height for the age and gender
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

  double? referenceHeight = heightData[ageYears]?[genderKey];

  if (referenceHeight == null) {
    return "No data available for this age";
  }

  // Calculate percentage difference
  double percentDiff = ((heightCm - referenceHeight) / referenceHeight) * 100;

  // Categorize based on deviation from normal (using ±10% as threshold)
  String status;
  String detail;

  if (percentDiff < -10) {
    status = "Below Normal";
    detail = "Height is ${percentDiff.abs().toStringAsFixed(1)}% below average";
  } else if (percentDiff > 10) {
    status = "Above Normal";
    detail = "Height is ${percentDiff.toStringAsFixed(1)}% above average";
  } else {
    status = "Normal";
    detail = "Height is within normal range";
  }

  return "$status - $detail (Expected: ${referenceHeight}cm, Actual: ${heightCm}cm)";
}
