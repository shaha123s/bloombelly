import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String? fetalKickStatus(
  int? weekNumber,
  int? kickCount,
  String? windowType,
) {
// إذا كان الأسبوع أقل من 28
  if (weekNumber == null || weekNumber < 28) {
    return "Kick counting not recommended";
  }

  // تعيين حدود العد الطبيعي
  int belowNormalThreshold = 0;
  int normalThresholdMin = 70;
  int normalThresholdMax = 140;

  // تحديد الحد الأدنى حسب نوع النافذة
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
      return "Invalid window type";
  }

  // التقييم النهائي
  if (kickCount == null || kickCount < belowNormalThreshold) {
    return "Below normal";
  } else if (kickCount >= normalThresholdMin &&
      kickCount <= normalThresholdMax) {
    return "Normal";
  } else if (kickCount > normalThresholdMax) {
    return "Above normal";
  }

  return "un known condtion";
}

double? newCustomFunction(
  double? totalSpent,
  double? totalIncome,
) {
  if (totalSpent == null || totalIncome == null) {
    return 0;
  } else {
    return totalIncome - totalSpent;
  }
}
