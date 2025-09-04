import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String? fetalKickStatus(
  int? weekNumber,
  int? kickCount,
) {
  if (weekNumber == null || kickCount == null) {
    return "⚠️ البيانات غير مكتملة. الرجاء إدخال رقم الأسبوع وعدد الركلات.";
  }

  // قبل الأسبوع 28
  if (weekNumber < 28) {
    return "ℹ️ قبل الأسبوع 28 لا يُعتبر عدّ الركلات مؤشرًا طبيًا دقيقًا. يكفي متابعة الحركة بشكل عام وإبلاغ الطبيب عند ملاحظة قلة واضحة.";
  }

  // لم تُسجل أي حركة
  if (kickCount == 0) {
    return "🚨 لم يتم تسجيل أي حركة اليوم.\nهذا وضع خطير ويستلزم مراجعة الطبيب فورًا للتأكد من سلامة الجنين.";
  }

  // أقل من الطبيعي
  if (kickCount < 10) {
    return "❗ تم تسجيل $kickCount ركلة فقط.\nالعدد الطبيعي هو 10 ركلات على الأقل خلال ساعتين متواصلة.\n➡️ جربي الاسترخاء على جانبك الأيسر بعد وجبة أو كوب ماء وأعيدي العد مرة أخرى.\n🚨 إذا بقي العدد أقل من 10 يجب مراجعة الطبيب فورًا.";
  }

  // طبيعي
  if (kickCount >= 10 && kickCount <= 100) {
    return "✅ تم تسجيل $kickCount ركلة.\nهذا العدد طبيعي إذا تحقق خلال ساعتين من بدء العدّ.\n👍 الجنين نشيط وحركته مطمئنة.\n📌 تذكير: كرري العدّ يوميًا في نفس التوقيت تقريبًا وعلى نفس الوضعية.";
  }

  // نشاط أعلى من المتوقع
  if (kickCount > 100) {
    return "ℹ️ تم تسجيل $kickCount ركلة.\nالحركة الزائدة غالبًا طبيعية وتعكس نشاط الجنين.\n⚠️ لكن المهم هو الاستمرار بملاحظة النمط المعتاد للحركة.\nإذا شعرتِ بتغير مفاجئ في قوة أو نمط الحركات، استشيري الطبيب.";
  }

  return "❓ حالة غير متوقعة، يرجى إعادة إدخال البيانات.";
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

String? getAgeFromBirthDate(DateTime birthDate) {
  DateTime today = DateTime.now();

  int years = today.year - birthDate.year;
  int months = today.month - birthDate.month;
  int days = today.day - birthDate.day;

  // Adjust days and months if necessary
  if (days < 0) {
    months -= 1;
    int prevMonth = today.month - 1;
    if (prevMonth == 0) {
      prevMonth = 12;
    }
    days += DateTime(today.year, prevMonth + 1, 0).day;
  }

  if (months < 0) {
    years -= 1;
    months += 12;
  }

  if (years >= 1) {
    if (years == 1) {
      return '$years year';
    } else {
      return '$years years';
    }
  } else {
    return '$months months $days days';
  }
}

int? getAgeInMonths(DateTime birthDate) {
  DateTime today = DateTime.now();

  int years = today.year - birthDate.year;
  int months = today.month - birthDate.month;
  int days = today.day - birthDate.day;

  int ageInMonths = years * 12 + months;

  // Adjust if the day of the month hasn't occurred yet
  if (days < 0) {
    ageInMonths -= 1;
  }

  // Ensure age in months is not negative
  if (ageInMonths < 0) {
    ageInMonths = 0;
  }

  return ageInMonths;
}

String? calculateVaccineDueDate(
  DateTime birthDate,
  int vaccineDueAgeInMonths,
) {
  int totalMonths =
      (birthDate.year * 12 + birthDate.month) + vaccineDueAgeInMonths;

  // Calculate the new year and month
  int newYear = totalMonths ~/ 12;
  int newMonth = totalMonths % 12;
  if (newMonth == 0) {
    newYear -= 1;
    newMonth = 12;
  }

  // Adjust the day if the new month has fewer days
  int newDay = birthDate.day;
  int daysInNewMonth = DateTime(newYear, newMonth + 1, 0).day;
  if (newDay > daysInNewMonth) {
    newDay = daysInNewMonth;
  }

  // Create the vaccine due date
  DateTime vaccineDueDate = DateTime(newYear, newMonth, newDay);

  // Format the date as a string
  String formattedDate = DateFormat('yyyy-MM-dd').format(vaccineDueDate);

  return formattedDate;
}

String? getSleepQuality(
  DateTime? birthDate,
  DateTime? sleepStart,
  DateTime? sleepEnd,
) {
  if (sleepStart == null || sleepEnd == null || birthDate == null) {
    return 'تأكد من إدخال جميع البيانات المطلوبة: وقت النوم، وقت الاستيقاظ، وتاريخ الميلاد.';
  }

  // Calculate sleep duration
  Duration sleepDuration = sleepEnd.difference(sleepStart);
  double totalSleepHours = sleepDuration.inMinutes / 60;

  // Calculate age based on birth date
  DateTime today = DateTime.now();
  int years = today.year - birthDate.year;
  int months = today.month - birthDate.month;
  int days = today.day - birthDate.day;

  // Adjust days and months if necessary
  if (days < 0) {
    months -= 1;
    int prevMonth = today.month - 1;
    if (prevMonth == 0) {
      prevMonth = 12;
    }
    days += DateTime(today.year, prevMonth + 1, 0).day;
  }

  if (months < 0) {
    years -= 1;
    months += 12;
  }

  // Determine sleep quality
  String sleepQuality;
  String advice;

  if (years < 1 && totalSleepHours > 16) {
    sleepQuality = 'ساعات نوم زائدة';
    advice =
        'قد يكون طفلك ينام أكثر من اللازم. إذا استمر ذلك، راجع طبيب الأطفال للتأكد من صحته.';
  } else if (years >= 1 && years <= 3 && totalSleepHours > 14) {
    sleepQuality = 'ساعات نوم زائدة';
    advice =
        'النوم الزائد قد يشير إلى أن طفلك متعب جداً أو يعاني من مشكلة صحية. تحقق من حالته العامة.';
  } else if (years > 3 && years <= 5 && totalSleepHours > 13) {
    sleepQuality = 'ساعات نوم زائدة';
    advice =
        'حاول تقليل ساعات النوم إلى الحد الطبيعي وزيادة وقت الأنشطة في النهار.';
  } else if (years > 5 && years <= 12 && totalSleepHours > 12) {
    sleepQuality = 'ساعات نوم زائدة';
    advice =
        'إذا استمر طفلك بالنوم لساعات أطول من اللازم، جرب تنظيم الروتين اليومي له.';
  } else if (years > 12 && totalSleepHours > 10) {
    sleepQuality = 'ساعات نوم زائدة';
    advice =
        'النوم المفرط قد يكون دلالة على حاجة الطفل لمزيد من النشاط البدني أو مراجعة عادات النوم.';
  } else {
    // Original conditions for normal sleep quality
    if (years < 1) {
      if (totalSleepHours >= 14) {
        sleepQuality = 'جودة النوم ممتازة';
        advice = 'طفلك يحصل على نوم ممتاز. حافظ على جدول نوم منتظم!';
      } else if (totalSleepHours >= 12) {
        sleepQuality = 'جودة النوم جيدة';
        advice = 'طفلك يحصل على نوم جيد. جرب أن تضمن روتين نوم هادئ.';
      } else {
        sleepQuality = 'جودة النوم سيئة';
        advice = 'طفلك لا يحصل على نوم كافٍ. حاول تقليل المشتتات قبل النوم.';
      }
    } else if (years >= 1 && years <= 3) {
      if (totalSleepHours >= 13) {
        sleepQuality = 'جودة النوم ممتازة';
        advice = 'نوم رائع! تأكد من استمرار اتباع روتين نوم منتظم.';
      } else if (totalSleepHours >= 11) {
        sleepQuality = 'جودة النوم جيدة';
        advice = 'طفلك يحصل على نوم جيد، لكن القليل من المزيد قد يكون مفيدًا.';
      } else {
        sleepQuality = 'جودة النوم سيئة';
        advice = 'نوم طفلك يمكن أن يتحسن. حاول تقليل وقت الشاشات قبل النوم.';
      }
    } else if (years > 3 && years <= 5) {
      if (totalSleepHours >= 12) {
        sleepQuality = 'جودة النوم ممتازة';
        advice = 'نوم رائع! حافظ على جدول نوم منتظم.';
      } else if (totalSleepHours >= 10) {
        sleepQuality = 'جودة النوم جيدة';
        advice = 'طفلك يحصل على نوم كافٍ، لكن المزيد من التنظيم قد يساعد.';
      } else {
        sleepQuality = 'جودة النوم سيئة';
        advice = 'قد يحتاج طفلك إلى المزيد من النوم. جرب اتباع روتين نوم ثابت.';
      }
    } else if (years > 5 && years <= 12) {
      if (totalSleepHours >= 11) {
        sleepQuality = 'جودة النوم ممتازة';
        advice = 'عمل رائع! تأكد من وجود بيئة هادئة لنوم مريح.';
      } else if (totalSleepHours >= 9) {
        sleepQuality = 'جودة النوم جيدة';
        advice = 'طفلك يحصل على نوم كافٍ. شجعه على اتباع عادات نوم جيدة.';
      } else {
        sleepQuality = 'جودة النوم سيئة';
        advice =
            'طفلك قد يحتاج إلى المزيد من النوم. حاول تقليل المنبهات مثل الكافيين أو وقت الشاشة.';
      }
    } else {
      if (totalSleepHours >= 9) {
        sleepQuality = 'جودة النوم ممتازة';
        advice = 'نوم رائع! استمر في العمل الجيد مع روتين نوم منتظم.';
      } else if (totalSleepHours >= 7) {
        sleepQuality = 'جودة النوم جيدة';
        advice =
            'طفلك يحصل على نوم كافٍ، ولكن المزيد من الراحة قد يكون مفيدًا.';
      } else {
        sleepQuality = 'جودة النوم سيئة';
        advice =
            'حاول تعزيز أوقات النوم المبكرة أو تقليل المشتتات الليلية لتحسين النوم.';
      }
    }
  }

  return '$sleepQuality\n$advice';
}

String? calculateSleepHours(
  DateTime? sleepStart,
  DateTime? sleepEnd,
) {
  if (sleepStart == null || sleepEnd == null) {
    return '0.0'; // Return 0 for invalid inputs
  }

  // Handle cases where sleepEnd is before sleepStart (crossing midnight)
  if (sleepEnd.isBefore(sleepStart)) {
    // التحقق مما إذا كان الفارق يمتد إلى اليوم التالي
    if (sleepEnd.difference(sleepStart).inHours.abs() <= 12) {
      // إذا كان الفرق منطقيًا (مثل بضع ساعات)
      sleepEnd = sleepEnd.add(Duration(days: 1));
    } else {
      // إذا كان الفرق غير منطقي (مثل يوم سابق)، أعرض رسالة خطأ
      return "خطأ: وقت النهاية قبل وقت البداية بزمن غير منطقي.";
    }
  }
  // Calculate sleep duration
  Duration sleepDuration = sleepEnd.difference(sleepStart);

  // Convert duration to hours and minutes
  int hours = sleepDuration.inHours;
  int minutes = sleepDuration.inMinutes % 60;

  // Ensure no negative values
  if (hours < 0 || minutes < 0) {
    return '0 ساعات و 0 دقائق';
  }
  return '$hoursساعات$minutesدقايق';
}
