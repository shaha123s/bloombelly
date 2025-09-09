import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ar', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? arText = '',
    String? enText = '',
  }) =>
      [arText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // choserole
  {
    'qnlvu3hs': {
      'ar': 'Select Role',
      'en': 'Select Role',
    },
    'x0jdobz8': {
      'ar': 'حامل لأول مرة',
      'en': 'First time pregnant',
    },
    'id5h7k8z': {
      'ar': 'الأمهات الحوامل لأول مرة',
      'en': 'First-time pregnant mothers',
    },
    'z5xvidgq': {
      'ar': 'الأم الحامل ',
      'en': 'pregnant mother',
    },
    'iodgtzqp': {
      'ar': 'الأمهات الحوامل مع طفل',
      'en': 'Pregnant mothers with a child',
    },
    '5f6hr9h8': {
      'ar': 'الأب',
      'en': 'father',
    },
    '6mxxk9kv': {
      'ar': 'شركاء الأمهات الحوامل',
      'en': 'Partners of pregnant mothers',
    },
    'qmp6m75b': {
      'ar': 'Continue',
      'en': 'Continue',
    },
  },
  // tools
  {
    'xu5am80f': {
      'ar': 'Tools',
      'en': 'Tools',
    },
    '1nbu4oh0': {
      'ar': 'الصفحة الرئيسية',
      'en': 'Home',
    },
    '19tb3esa': {
      'ar': 'بروفايل الطفل',
      'en': 'Child profile',
    },
    'j9bo7q3j': {
      'ar': 'الإعدادات',
      'en': 'Settings',
    },
    'jed0o5to': {
      'ar': 'تواصل معنا',
      'en': 'Contact us',
    },
    'lw963n4h': {
      'ar': 'تسجيل الخروج',
      'en': 'Log out',
    },
    'mw0e5a7k': {
      'ar': 'تتبع الحمل',
      'en': 'Pregnancy tracking',
    },
    'knrsf3ib': {
      'ar': 'شاهد نمو الطفل وتغيرات الجسم',
      'en': 'Watch your baby\'s growth and body changes.',
    },
    'c7vm4rso': {
      'ar': 'مراقبة الاختبارات و النتائج',
      'en': 'Monitoring tests and results',
    },
    'tpu2qrrx': {
      'ar': 'تتبع مقاييسك الصحية واختباراتك',
      'en': 'Track your health metrics and tests',
    },
    'rm72871y': {
      'ar': 'دليل الإسعافات الأولية',
      'en': 'First Aid Guide',
    },
    '5zoaclm6': {
      'ar': 'تعلم كيفية التعامل مع حالات الطوارئ',
      'en': 'Learn how to handle emergencies',
    },
    'g344eh2t': {
      'ar': 'تتبع التغذية',
      'en': 'Nutrition tracking',
    },
    'mcglx5g2': {
      'ar': 'تتبع النظام الغذائي والاحتياجات الغذائية',
      'en': 'Track diet and nutritional needs',
    },
    'hii57dz3': {
      'ar': 'الدردشة مع الشات بوت',
      'en': 'Chat with a chatbot',
    },
    'uv994e0m': {
      'ar': 'احصل على اجابات لأسئلتك',
      'en': 'Get answers to your questions',
    },
    'e3ic11or': {
      'ar': 'prime',
      'en': 'prime',
    },
    's1anr2r9': {
      'ar': 'تتبع الركلات',
      'en': 'Track kicks',
    },
    'f8gilex5': {
      'ar': 'مراقبة أنماط حركة الجنين',
      'en': 'Monitoring fetal movement patterns',
    },
    'pkegjxrk': {
      'ar': 'نرعى طفلك كما نهتم بك',
      'en': 'We care for your child as we care for you',
    },
    '0fof3u04': {
      'ar': 'خدمة برايم لمتابعة نمو الطفل خطوة بخطوة',
      'en': 'Prime service to follow the child\'s development step by step',
    },
    'im6hccf1': {
      'ar': 'انضمام',
      'en': 'joining',
    },
    'dmomdecu': {
      'ar': 'Button',
      'en': '',
    },
    'v57izq1y': {
      'ar': 'Home',
      'en': 'Home',
    },
    'o4w4ditc': {
      'ar': 'Chat',
      'en': 'Chat',
    },
    'pqj1aylh': {
      'ar': 'Favorites',
      'en': 'Favorites',
    },
    'kbk92t11': {
      'ar': 'Profile',
      'en': 'Profile',
    },
    '55k7r2cx': {
      'ar': 'tools',
      'en': 'tools',
    },
  },
  // foodtrackpreagnet
  {
    'e0tnl5ku': {
      'ar': 'Nutrition Check',
      'en': 'Nutrition Check',
    },
    'sd1o2yb0': {
      'ar': 'تتيعي كمية استهلاكك اليومي',
      'en': 'Track your daily intake',
    },
    'eeax4dod': {
      'ar': 'سجلي نظامك الغذلئي للبقاء بصحة جيدة اثناء الحمل',
      'en': 'Record your diet to stay healthy during pregnancy.',
    },
    '1v27i0sl': {
      'ar': 'السعرات الحرارية',
      'en': 'calories',
    },
    'rpfkg7ge': {
      'ar': 'الموصى به 2000- 2500 ',
      'en': 'Recommended 2000-2500',
    },
    'tymm9ze4': {
      'ar': 'Enter calories',
      'en': 'Enter calories',
    },
    '2zt83gvq': {
      'ar': 'البروتين',
      'en': 'Protein',
    },
    'arnqq2t0': {
      'ar': 'الموصى به: 70-100 ',
      'en': 'Recommended: 70-100',
    },
    'awtlhw1s': {
      'ar': 'Enter protein (g)',
      'en': 'Enter protein (g)',
    },
    'ali3v77y': {
      'ar': 'الحديد',
      'en': 'Iron',
    },
    'l8rurqhg': {
      'ar': 'الموصى به: 27 ',
      'en': 'Recommended: 27',
    },
    'qej74sxj': {
      'ar': 'Enter iron (mg)',
      'en': 'Enter iron (mg)',
    },
    'okfbyyo9': {
      'ar': 'تحقق من التغذية',
      'en': 'Check the nutrition',
    },
  },
  // TrackPregnancy
  {
    'd99mru24': {
      'ar': 'Track Pregnancy',
      'en': 'Track Pregnancy',
    },
    'wd67mrzy': {
      'ar': 'الوزن',
      'en': 'the weight',
    },
    '83jnrnp8': {
      'ar': 'الطول',
      'en': 'height',
    },
    'g77nqpru': {
      'ar': 'الاسبوع  ',
      'en': 'week',
    },
    'y5em8bmh': {
      'ar': '  من الحمل',
      'en': 'From pregnancy',
    },
    'ohczx91f': {
      'ar': 'Week 13 of your pregnancy',
      'en': 'Week 13 of your pregnancy',
    },
    'gtrom6n5': {
      'ar': 'كيف ينمو طفلك؟',
      'en': 'How is your child growing?',
    },
    'ahlv2m5l': {
      'ar': 'ما هي تغيراتك الجسدية؟',
      'en': 'What are your physical changes?',
    },
    'kgtqx27s': {
      'ar': 'ما هي تغييراتك النفسية؟',
      'en': 'What are your psychological changes?',
    },
    'df47lng1': {
      'ar': 'نصائح',
      'en': 'advice',
    },
    '4tx4zz56': {
      'ar': 'وثقي رحلتك معنا',
      'en': 'Document your journey with us',
    },
    'dld14pfm': {
      'ar': 'Write your feelings',
      'en': 'Write your feelings',
    },
    '3hc8fh1o': {
      'ar': 'المراجع التعليمية لهذا الاسبوع',
      'en': 'Educational references for this week',
    },
    'pc17yz23': {
      'ar': 'المراجع التعليمية لهذا الاسبوع',
      'en': 'Educational references for this week',
    },
  },
  // FirstAidGuide
  {
    '5lxwm3ch': {
      'ar': 'First Aid Guide',
      'en': 'First Aid Guide',
    },
  },
  // aid
  {
    'vh2tna8k': {
      'ar': 'First Aid Guide',
      'en': 'First Aid Guide',
    },
    '1qade66l': {
      'ar': 'الاعراض',
      'en': 'Symptoms',
    },
    'qdp2ciua': {
      'ar': 'التوقيت',
      'en': 'Timing',
    },
    '09j67iuc': {
      'ar': 'علامات التحذير',
      'en': 'Warning signs',
    },
    '4ly25sos': {
      'ar': 'الاسعافات الأولية',
      'en': 'first aid',
    },
    'px7tinsq': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // TracKicks
  {
    'utn6s3mm': {
      'ar': 'Baby\'s Kicks',
      'en': 'Track Baby\'s Kicks',
    },
    'iaspws8n': {
      'ar': 'ركلات اليوم',
      'en': 'Kicks of the day',
    },
    'qzhxg7ta': {
      'ar': 'حفظ الركلات',
      'en': 'Save kicks',
    },
    '226yywu1': {
      'ar': 'احسب جودة الركلات',
      'en': 'Calculate the quality of kicks',
    },
    'lwxmisyj': {
      'ar': 'kicks',
      'en': 'kicks',
    },
  },
  // MonitorTestResults
  {
    'urmpnezk': {
      'ar': 'Monitor Test & Results',
      'en': 'Monitor Test & Results',
    },
    'd3l0rurf': {
      'ar': 'التحميل والتحليل',
      'en': 'Download and analyze',
    },
    'iyck48oj': {
      'ar': 'TextField',
      'en': 'TextField',
    },
    'e1pvivz9': {
      'ar': 'انقر للتحمبل',
      'en': 'Click to download',
    },
    '12izkcm2': {
      'ar': 'تحليل',
      'en': 'analysis',
    },
    'h7xvbir6': {
      'ar': 'النتائج',
      'en': 'Results',
    },
    '1x73epm5': {
      'ar': 'الفحوصات المطلوبة',
      'en': 'Required tests',
    },
    'fekzi9d9': {
      'ar': 'تعداد الدم cbc',
      'en': 'CBC blood count',
    },
  },
  // date
  {
    'tnb1z6zu': {
      'ar': 'في أي مرحلة من حملك',
      'en': 'At what stage of your pregnancy',
    },
    'tyewbue0': {
      'ar': '',
      'en': 'Pregnancy week',
    },
    'bhd82zaq': {
      'ar': 'Select...',
      'en': 'Select...',
    },
    '6gv9kz3k': {
      'ar': 'Search...',
      'en': 'Search...',
    },
    '9ju3wey7': {
      'ar': 'تاريخ اخر دورة',
      'en': 'Date of last period',
    },
    'jeph9igt': {
      'ar': 'اسبوع  الحمل',
      'en': 'Pregnancy week',
    },
    'b584xfha': {
      'ar': 'تاريخ الولادة',
      'en': 'birth date',
    },
    '4c0el6ko': {
      'ar': 'ادخلي تاريخ اخر دورة شهرية',
      'en': 'Enter the date of your last menstrual period.',
    },
    '2a7526fs': {
      'ar': 'TextField',
      'en': 'TextField',
    },
    'ia6k853u': {
      'ar': 'ادخلي تاريخ الولادة',
      'en': 'Enter date of birth',
    },
    'e71ni0pq': {
      'ar': 'حساب المرحلة',
      'en': 'Stage account',
    },
    'a9st2hxc': {
      'ar': 'س',
      'en': 'S',
    },
  },
  // father
  {
    'zdpzzwbm': {
      'ar': 'الاسبوع  ',
      'en': 'week',
    },
    '6b9cnpwz': {
      'ar': '  من الحمل',
      'en': 'From pregnancy',
    },
    'e32tui5v': {
      'ar': 'Week 13 of your pregnancy',
      'en': 'Week 13 of your pregnancy',
    },
    'baolrqf9': {
      'ar': 'الوزن',
      'en': 'the weight',
    },
    'wxhco17o': {
      'ar': 'الطول',
      'en': 'height',
    },
    'uufcfcrx': {
      'ar': 'كيف ينمو طفلك؟',
      'en': 'How is your child growing?',
    },
    'l5ctptaq': {
      'ar': 'ما هي تغيرات زوجتك الجسدية؟',
      'en': 'What are your wife\'s physical changes?',
    },
    'oj98mang': {
      'ar': 'ما هي تغييرات زوجتك النفسية؟',
      'en': 'What are your wife\'s psychological changes?',
    },
    '0p1h33w2': {
      'ar': 'ما هو دورك في هذه المرحلة؟',
      'en': 'What is your role at this stage?',
    },
    '7ouzdhq7': {
      'ar': 'المراجع التعليمية لهذا الاسبوع',
      'en': 'Educational references for this week',
    },
    'v7kkf8ur': {
      'ar': 'Track Pregnancy',
      'en': 'Track Pregnancy',
    },
    'qlgf4dxd': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // vaccince
  {
    '8d29h6na': {
      'ar': 'متابعة اللقاحات',
      'en': 'Vaccine follow-up',
    },
    'zzwuk1jl': {
      'ar': 'اسم الطفل: أحمد',
      'en': 'Child\'s name: Ahmed',
    },
    'rdg5i9l4': {
      'ar': 'العمر: 3 سنوات',
      'en': 'Age: 3 years',
    },
    'w4dbrqy7': {
      'ar': 'العمر: 3 سنوات',
      'en': 'Age: 3 years',
    },
    '06aa348s': {
      'ar': 'قائمة اللقاحات',
      'en': 'Vaccination list',
    },
    'f867v9uo': {
      'ar': 'موعد اللقاح: March 15, 2024',
      'en': 'Vaccination date: March 15, 2024',
    },
    '8v4d3s9y': {
      'ar': 'الحالة: مكتمل',
      'en': 'Status: Complete',
    },
    'i84a1imv': {
      'ar': 'الأعراض المتوقعة',
      'en': 'Expected symptoms',
    },
    '50eq4tlf': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // symptoms
  {
    'l3xgkuf4': {
      'ar': 'تتبع الأعراض',
      'en': 'Track symptoms',
    },
    'r6hcfh7a': {
      'ar': 'أعراض ما بعد التطعيم',
      'en': 'Post-vaccination symptoms',
    },
    '37ocyfkc': {
      'ar': 'الإجرائات الوقائية',
      'en': 'Preventive measures',
    },
    'be76w2z2': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // children1
  {
    'w7gxd18z': {
      'ar': 'أخبرينا عن طفلك',
      'en': 'Tell us about your child',
    },
    'rwef4mgz': {
      'ar': 'اسم الطفل',
      'en': 'Child\'s name',
    },
    '49oikonn': {
      'ar': 'ادخل تاريخ الميلاد',
      'en': 'Enter date of birth',
    },
    'bciuq31y': {
      'ar': 'تاريخ الميلاد',
      'en': 'date of birth',
    },
    'pyoibwg5': {
      'ar': 'ادخل تاريخ الميلاد',
      'en': 'Enter date of birth',
    },
    'kxzliper': {
      'ar': 'الجنس',
      'en': 'Sex',
    },
    'v18318te': {
      'ar': 'Select...',
      'en': 'Select...',
    },
    'pedcdk7t': {
      'ar': 'Search...',
      'en': 'Search...',
    },
    'xj137tev': {
      'ar': 'ذكر',
      'en': 'male',
    },
    'a67kbmxi': {
      'ar': 'انثى',
      'en': 'feminine',
    },
    '684sfczn': {
      'ar': 'التالي',
      'en': 'the next',
    },
    'do3m5wr2': {
      'ar': 'Field is required',
      'en': 'Field is required',
    },
    '540kvyy5': {
      'ar': 'الاسم قصير جدا',
      'en': 'The name is too short',
    },
    'ehbhl0am': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '8eypjl59': {
      'ar': 'Field is required',
      'en': 'Field is required',
    },
    'xxzjopii': {
      'ar': 'القيمة خاطئة',
      'en': 'The value is wrong.',
    },
    'q0k7226x': {
      'ar': 'القيمة خاطئة',
      'en': 'The value is wrong.',
    },
    '2d105hin': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'mtyy5w2h': {
      'ar': 'Field is required',
      'en': 'Field is required',
    },
    'cjnk8ez3': {
      'ar': 'القيمة خاطئة',
      'en': 'The value is wrong.',
    },
    '6sslkkth': {
      'ar': 'القيمة خاطئة',
      'en': 'The value is wrong.',
    },
    '4st9se44': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'noelnzja': {
      'ar': 'Field is required',
      'en': 'Field is required',
    },
    'wbnv28r1': {
      'ar': 'الوصف قصير جدا',
      'en': 'The description is too short.',
    },
    '9i97s22g': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'r7fh3nxg': {
      'ar': 'Field is required',
      'en': 'Field is required',
    },
    'jpio0j4i': {
      'ar': 'الوصف قصيرا جدا',
      'en': 'The description is too short',
    },
    'hzd0lhsp': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'vu7whyf9': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // choseservices
  {
    'syo66anb': {
      'ar': 'خدمات مخصصة لطفلك',
      'en': 'Services tailored to your child',
    },
    '8gt4noir': {
      'ar': 'اختر الخدمة التي ترغب بالحصول عليها',
      'en': 'Choose the service you want to get',
    },
    'zhvy9gj5': {
      'ar': 'تتبع التغذية',
      'en': 'Nutrition tracking',
    },
    'ajnwtur0': {
      'ar': 'سعر الخدمة',
      'en': '',
    },
    'tfw64ezo': {
      'ar': '15000',
      'en': '',
    },
    's04p5xlc': {
      'ar': 'ازالة',
      'en': '',
    },
    's7n2hpze': {
      'ar': 'اضافة',
      'en': '',
    },
    'l3qkfe8s': {
      'ar': 'الشات بوت',
      'en': 'Nutrition tracking',
    },
    'ahd3bxm1': {
      'ar': 'سعر الخدمة',
      'en': '',
    },
    '8zlu8fqx': {
      'ar': '50000',
      'en': '',
    },
    'jxqjlsku': {
      'ar': 'ازالة',
      'en': '',
    },
    '8ew9qjk5': {
      'ar': 'اضافة',
      'en': '',
    },
    'hegcuo18': {
      'ar': 'تتبع النمو',
      'en': 'Nutrition tracking',
    },
    'fsr40g4b': {
      'ar': 'سعر الخدمة',
      'en': '',
    },
    'da27vr7n': {
      'ar': '30000',
      'en': '',
    },
    'vp6eqpj9': {
      'ar': 'ازالة',
      'en': '',
    },
    '8uai44f8': {
      'ar': 'اضافة',
      'en': '',
    },
    'rlq7yv92': {
      'ar': 'تتبع النوم',
      'en': 'Nutrition tracking',
    },
    'qonpf1fu': {
      'ar': 'سعر الخدمة',
      'en': '',
    },
    'yynti8a5': {
      'ar': '20000',
      'en': '',
    },
    '53p63jo2': {
      'ar': 'ازالة',
      'en': '',
    },
    '5le2mucs': {
      'ar': 'اضافة',
      'en': '',
    },
    'wegb8pa5': {
      'ar': 'تتبع اللقاحات',
      'en': 'Nutrition tracking',
    },
    '26w5yxqt': {
      'ar': 'سعر الخدمة',
      'en': '',
    },
    'ea5xso1w': {
      'ar': '40000',
      'en': '',
    },
    'iqlyu0ts': {
      'ar': 'ازالة',
      'en': '',
    },
    '3z1wnbxn': {
      'ar': 'اضافة',
      'en': '',
    },
    'csz2jynr': {
      'ar': ' Use Service',
      'en': 'Use Service',
    },
    '447kdjjm': {
      'ar': 'Cancel',
      'en': 'Cancel',
    },
  },
  // loginCopy
  {
    't0b87xlh': {
      'ar': 'BloomBelly',
      'en': 'BloomBelly',
    },
    'vyza79d0': {
      'ar': 'اهلا بك ',
      'en': 'Hey, you',
    },
    'iosoxnb2': {
      'ar': 'Email address',
      'en': 'Email address',
    },
    'tbn12l91': {
      'ar': 'Password',
      'en': 'Password',
    },
    'yu3j7ww2': {
      'ar': 'تسجيل الدخول',
      'en': 'Log in',
    },
    'vat9lyo9': {
      'ar': 'Forgot your password?',
      'en': 'Forgot your password?',
    },
  },
  // motherwithch
  {
    'g0oqyjbu': {
      'ar': 'خدمات مخصصة لطفلك',
      'en': 'Services tailored to your child',
    },
    'fgg1jlgs': {
      'ar': 'اختر الخدمة التي ترغب بالحصول عليها',
      'en': 'Choose the service you want to get',
    },
    'ujykfpx3': {
      'ar': 'تتبع التغذية',
      'en': 'Nutrition tracking',
    },
    'txfmk7hm': {
      'ar': 'تتبع النظام الغذائي \nوالاحتياجات الغذائية',
      'en': 'Track diet and nutritional needs',
    },
    '05p2cb3v': {
      'ar': 'الدردشة مع الشات بوت',
      'en': 'Chat with a chatbot',
    },
    '8abchmvn': {
      'ar': 'احصل على اجابات لأسئلتك',
      'en': 'Get answers to your questions',
    },
    'o6be2ru9': {
      'ar': 'تتبع اللقاحات',
      'en': 'Vaccine tracking',
    },
    'jwz3eszx': {
      'ar': 'تعرفي على مواعيد التطعيمات الضرورية لطفلك وفقًا لعمره\n\n',
      'en':
          'Learn about the necessary vaccination dates for your child according to his age.',
    },
    'p6k4un7u': {
      'ar': 'تتبع النوم',
      'en': 'Sleep tracking',
    },
    'dhs80g3o': {
      'ar': 'راقبي نمط نوم الطفل وعدد الساعات حسب فئته العمرية ',
      'en':
          'Monitor your child\'s sleep pattern and the number of hours according to his age group.',
    },
    '36cpkop6': {
      'ar': 'تتبع النمو',
      'en': 'Track growth',
    },
    '3vqmqmc1': {
      'ar': 'شاهدي تطور الوزن والطول شهريًا حسب معايير منظمة الصحة',
      'en':
          'See your monthly weight and height development according to WHO standards.',
    },
    'knnx05jn': {
      'ar': 'التالي',
      'en': 'the next',
    },
    'q5sveotk': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // foodtrackchild
  {
    'c8lqap0p': {
      'ar': 'Foodtrack',
      'en': 'Foodtrack',
    },
    'cgjc238o': {
      'ar': 'الوجبات',
      'en': 'Meals',
    },
    'ugream62': {
      'ar': 'تفاصيل الوجبة',
      'en': 'Meal details',
    },
    '4nsswhly': {
      'ar': 'ما هي الأصناف التي تناولها؟',
      'en': 'What types of food did he eat?',
    },
    '1vjvtc48': {
      'ar': 'مقدار الوجبة',
      'en': 'Meal amount',
    },
    'dqpgp53y': {
      'ar': 'كم كانت الكمية؟(حاولي التقدير بالغرام)',
      'en': 'How much was it? (Try to estimate in grams)',
    },
    'gl980tnp': {
      'ar': 'ميعاد الوجبة',
      'en': 'Meal time',
    },
    '927wj8pz': {
      'ar': 'ما هي الأصناف التي تناولها؟',
      'en': 'What types of food did he eat?',
    },
    'xviigyqe': {
      'ar': 'حفظ',
      'en': 'save',
    },
    'mjhoipum': {
      'ar': 'ارشيف الوجبات السابقة',
      'en': 'Archive of previous meals',
    },
    'd0lsjpq3': {
      'ar': 'Front',
      'en': 'Front',
    },
    'rljo2zzr': {
      'ar': 'Hello World',
      'en': 'Hello World',
    },
    '2as6kdea': {
      'ar': 'Back',
      'en': 'Back',
    },
    'bat6i4yo': {
      'ar': 'Hello World',
      'en': 'Hello World',
    },
    'e7dii7vn': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // sleeptrack1
  {
    'o7wzevss': {
      'ar': 'Sleeptrack',
      'en': 'Sleeptrack',
    },
    'rn06ex8a': {
      'ar': 'تتبع نوم طفلك',
      'en': 'Track your child\'s sleep',
    },
    '86285rjg': {
      'ar': 'وقت النوم',
      'en': 'bedtime',
    },
    '7hgpyo67': {
      'ar': 'وقت النوم',
      'en': '',
    },
    'gt6bcwtl': {
      'ar': 'وقت الاستيقاظ',
      'en': 'wake-up time',
    },
    'ds06n1jr': {
      'ar': 'وقت الاستيقاظ',
      'en': '',
    },
    'vwg07qur': {
      'ar': 'ملاحظات حول جدول النوم',
      'en': 'Notes on sleep schedule',
    },
    'mswkrped': {
      'ar': 'اية ملاحظة؟',
      'en': 'Any comment?',
    },
    'si4cnuyw': {
      'ar': 'حفظ',
      'en': 'save',
    },
    'f0uysvbv': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // childprofile
  {
    'pmrohy1q': {
      'ar': 'childinfo',
      'en': 'childinfo',
    },
    'jmpi5oca': {
      'ar': 'مقاييس الصحة الرئيسية',
      'en': 'Key health metrics',
    },
    'vuk7e9jr': {
      'ar': 'الطول',
      'en': 'height',
    },
    'q38pizp5': {
      'ar': 'الوزن',
      'en': 'the weight',
    },
    'z2hi2yog': {
      'ar': 'سجلات النشاط اليومي',
      'en': 'Daily activity logs',
    },
    'uuia5y9a': {
      'ar': 'أنماط النوم',
      'en': 'Sleep patterns',
    },
    'q0gclyxm': {
      'ar': 'تتبع الوجبات',
      'en': 'Meal tracking',
    },
    'o2hozsij': {
      'ar': 'سجلات التطعيمات',
      'en': 'Immunization records',
    },
    'zqyc77dw': {
      'ar': 'دفتر اللقاحات',
      'en': 'Vaccination book',
    },
    'veo89f31': {
      'ar': 'تحرير الملف الشخصي',
      'en': 'Edit profile',
    },
    'wpwkhay1': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // children2
  {
    'r3rzbr16': {
      'ar': 'أخبرينا عن طفلك',
      'en': 'Tell us about your child',
    },
    'xzcca873': {
      'ar': 'الطول بالسانتيمتر',
      'en': 'Length in centimeters',
    },
    'wh2axij4': {
      'ar': 'الطول بالأرقام',
      'en': 'Length in numbers',
    },
    '45ownry7': {
      'ar': 'الوزن بالكيلو',
      'en': 'Weight in kg',
    },
    'gcnho9p7': {
      'ar': 'الوزن بالأرقام',
      'en': 'Weight in numbers',
    },
    'zfmbdeap': {
      'ar': 'حفظ',
      'en': 'save',
    },
    'cag48gb7': {
      'ar': 'Field is required',
      'en': 'Field is required',
    },
    'plwxianf': {
      'ar': 'الاسم قصير جدا',
      'en': 'The name is too short',
    },
    'hl5jtu66': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'v0ioi3jx': {
      'ar': 'Field is required',
      'en': 'Field is required',
    },
    'fw0r6h2v': {
      'ar': 'القيمة خاطئة',
      'en': 'The value is wrong.',
    },
    'bc41rib7': {
      'ar': 'القيمة خاطئة',
      'en': 'The value is wrong.',
    },
    'cwae3h0z': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'bbnyt90j': {
      'ar': 'Field is required',
      'en': 'Field is required',
    },
    'fn3f8i37': {
      'ar': 'القيمة خاطئة',
      'en': 'The value is wrong.',
    },
    'gz8y23t9': {
      'ar': 'القيمة خاطئة',
      'en': 'The value is wrong.',
    },
    'dijihu0y': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'bf9q2x2q': {
      'ar': 'Field is required',
      'en': 'Field is required',
    },
    's969ngv1': {
      'ar': 'الوصف قصير جدا',
      'en': 'The description is too short.',
    },
    '605nrlvh': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '92kr4638': {
      'ar': 'Field is required',
      'en': 'Field is required',
    },
    '6441g9vl': {
      'ar': 'الوصف قصيرا جدا',
      'en': 'The description is too short',
    },
    'u3qlzjhh': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'wq22kqsw': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // sleeptrack2
  {
    '7aycy29v': {
      'ar': 'Sleeptrack',
      'en': 'Sleeptrack',
    },
    '21c2lzqc': {
      'ar': 'أنماط النوم الحديثة',
      'en': 'Modern Sleep Patterns',
    },
    'ydu0thqf': {
      'ar': 'إجمالي النوم',
      'en': 'Total sleep',
    },
    'scjulb3s': {
      'ar': '8 ساعات',
      'en': '8 hours',
    },
    '7hu5hk97': {
      'ar': 'اخر نوم مسجل',
      'en': 'Last recorded sleep',
    },
    'c3mrgo0h': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // chat1
  {
    'hjeb3aur': {
      'ar': 'User',
      'en': '',
    },
    'a9inswzv': {
      'ar': 'Ai Assistant',
      'en': '',
    },
    '6st70ehq': {
      'ar': 'sned',
      'en': 'sned',
    },
    '1gn9b9sf': {
      'ar': 'chatbot',
      'en': 'chatbot',
    },
    '103qjwgy': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // profilemother
  {
    'y4txz4t8': {
      'ar': 'الرصيد الحالي',
      'en': 'Balance',
    },
    'iau6wfp7': {
      'ar': '\$47,892.50',
      'en': '\$47,892.50',
    },
    '7i3pargy': {
      'ar': 'البريد الإلكتروني',
      'en': '',
    },
    'u6bo03bb': {
      'ar': 'رقم الهاتف',
      'en': '',
    },
    '5mm5aug7': {
      'ar': 'اسبوع الحمل',
      'en': '',
    },
    'vz0bjjp0': {
      'ar': 'الحالة',
      'en': '',
    },
  },
  // homepage
  {
    'e9daqzuh': {
      'ar': 'Bloombelly',
      'en': '',
    },
    '813zz75p': {
      'ar': 'الاسبوع',
      'en': '',
    },
    '2xitgrfz': {
      'ar': 'Hello World',
      'en': '',
    },
    'eo1u9r9v': {
      'ar': 'رؤيتي اليومية',
      'en': 'My daily vision',
    },
    'xzskous6': {
      'ar': 'الوزن',
      'en': '',
    },
    'z3ecmk39': {
      'ar': 'الطول',
      'en': '',
    },
    '3w5jju52': {
      'ar': 'اليوم',
      'en': '',
    },
    'clr26rdm': {
      'ar': '20',
      'en': '',
    },
    'xf4bwywj': {
      'ar': 'الصفحة الرئيسية',
      'en': 'Home',
    },
    'j962xehy': {
      'ar': 'بروفايل الطفل',
      'en': 'Child profile',
    },
    'r1ktgbwk': {
      'ar': 'الإعدادات',
      'en': 'Settings',
    },
    'q0j75h0e': {
      'ar': 'تواصل معنا',
      'en': 'Contact us',
    },
    'ccoosqhd': {
      'ar': 'تسجيل الخروج',
      'en': 'Log out',
    },
    '0xzp6ojt': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // paid
  {
    'p6yvvgd9': {
      'ar': 'premium',
      'en': 'premium',
    },
    '1lvurtz3': {
      'ar': 'رصيدك ',
      'en': 'Your balance',
    },
    'jlsi9dfx': {
      'ar': '\$9.99',
      'en': '\$9.99',
    },
    'mifasl46': {
      'ar': 'تكلفة الخدمة',
      'en': 'Service cost',
    },
    'uyhjobr3': {
      'ar': '\$25.50',
      'en': '\$25.50',
    },
    '3nqhbpxl': {
      'ar': 'الرصيد الحالي ',
      'en': 'Current balance',
    },
    'u6nmm6e8': {
      'ar': '\$15.51',
      'en': '\$15.51',
    },
    'aht8x8ji': {
      'ar': 'الرصيد المتبقي',
      'en': 'Remaining balance',
    },
    'o7s15exf': {
      'ar': ' Use Service',
      'en': 'Use Service',
    },
  },
  // toolsCopy
  {
    'kt74l44a': {
      'ar': 'Tools',
      'en': 'Tools',
    },
    'brgzsxmx': {
      'ar': 'تتبع الحمل',
      'en': 'Pregnancy tracking',
    },
    'pb0vftdh': {
      'ar': 'شاهد نمو الطفل وتغيرات الجسم',
      'en': 'Watch your baby\'s growth and body changes.',
    },
    'rm5cyco7': {
      'ar': 'مراقبة الاختبارات و النتائج',
      'en': 'Monitoring tests and results',
    },
    'heckm3wr': {
      'ar': 'تتبع مقاييسك الصحية واختباراتك',
      'en': 'Track your health metrics and tests',
    },
    's9oxk9uz': {
      'ar': 'دليل الإسعافات الأولية',
      'en': 'First Aid Guide',
    },
    'q2rvy4f9': {
      'ar': 'تعلم كيفية التعامل مع حالات الطوارئ',
      'en': 'Learn how to handle emergencies',
    },
    '49ll2mk2': {
      'ar': 'تتبع التغذية',
      'en': 'Nutrition tracking',
    },
    '7n8l8tsk': {
      'ar': 'تتبع النظام الغذائي والاحتياجات الغذائية',
      'en': 'Track diet and nutritional needs',
    },
    'lq5vv3bl': {
      'ar': 'الدردشة مع الشات بوت',
      'en': 'Chat with a chatbot',
    },
    'ddnysw0s': {
      'ar': 'احصل على اجابات لأسئلتك',
      'en': 'Get answers to your questions',
    },
    'brnr7hod': {
      'ar': 'تتبع الركلات',
      'en': 'Track kicks',
    },
    'c0chlfyv': {
      'ar': 'مراقبة أنماط حركة الجنين',
      'en': 'Monitoring fetal movement patterns',
    },
    'wtdbb7yo': {
      'ar': 'تتبع اللقاحات',
      'en': 'Vaccine tracking',
    },
    'ipmdiyv5': {
      'ar': 'تعرفي على مواعيد التطعيمات الضرورية لطفلك وفقًا لعمره\n\n',
      'en':
          'Learn about the necessary vaccination dates for your child according to his age.',
    },
    'tq4u99hk': {
      'ar': 'تتبع النوم',
      'en': 'Sleep tracking',
    },
    'durc1h7n': {
      'ar': 'راقبي نمط نوم الطفل وعدد الساعات حسب فئته العمرية ',
      'en':
          'Monitor your child\'s sleep pattern and the number of hours according to his age group.',
    },
    'zikva1ow': {
      'ar': 'تتبع النمو',
      'en': 'Track growth',
    },
    'nyfy5gew': {
      'ar': 'شاهدي تطور الوزن والطول شهريًا حسب معايير منظمة الصحة',
      'en':
          'See your monthly weight and height development according to WHO standards.',
    },
    'o291vzyp': {
      'ar': 'Home',
      'en': 'Home',
    },
    'y9ei3lze': {
      'ar': 'Chat',
      'en': 'Chat',
    },
    'vugrtk36': {
      'ar': 'Favorites',
      'en': 'Favorites',
    },
    'nc1ur7dg': {
      'ar': 'Profile',
      'en': 'Profile',
    },
    'q2ctmks1': {
      'ar': 'الصفحة الرئيسية',
      'en': 'Home',
    },
    'gd25shg1': {
      'ar': 'بروفايل الطفل',
      'en': 'Child profile',
    },
    'ma5a0mem': {
      'ar': 'الإعدادات',
      'en': 'Settings',
    },
    '9rrnk3el': {
      'ar': 'تواصل معنا',
      'en': 'Contact us',
    },
    '8pemt3xp': {
      'ar': 'تسجيل الخروج',
      'en': 'Log out',
    },
    '3hfzfjij': {
      'ar': 'tools',
      'en': 'tools',
    },
  },
  // charts
  {
    '08pgfk0z': {
      'ar': 'age',
      'en': '',
    },
    'ylz81kk9': {
      'ar': 'avg girls tall',
      'en': '',
    },
    'z99edpdc': {
      'ar': 'girls tall',
      'en': '',
    },
    'dk6psx1d': {
      'ar': 'age',
      'en': '',
    },
    'obxsmdg8': {
      'ar': 'tall',
      'en': '',
    },
    'znbdqoq1': {
      'ar': 'age',
      'en': '',
    },
    'avdf9q6s': {
      'ar': 'avg boy tall',
      'en': '',
    },
    '6buwz7bk': {
      'ar': 'girls tall',
      'en': '',
    },
    '7efdfh7x': {
      'ar': 'age',
      'en': '',
    },
    '2rxcyg9x': {
      'ar': 'tall',
      'en': '',
    },
    'cuj6wo6y': {
      'ar': 'age',
      'en': '',
    },
    'fnqqzr7f': {
      'ar': 'avg girl wieght',
      'en': '',
    },
    '4ppnzb9a': {
      'ar': '',
      'en': '',
    },
    'i7uuynf2': {
      'ar': 'age',
      'en': '',
    },
    'a1m3l2lz': {
      'ar': 'tall',
      'en': '',
    },
    'a1guctpx': {
      'ar': 'age',
      'en': '',
    },
    'mt3os39j': {
      'ar': 'avg boy wieght',
      'en': '',
    },
    'godd57ow': {
      'ar': '',
      'en': '',
    },
    'khh2j6ht': {
      'ar': 'age',
      'en': '',
    },
    'tym74ydl': {
      'ar': 'tall',
      'en': '',
    },
    '94v5fqt6': {
      'ar': 'check your baby hight status',
      'en': '',
    },
    'ajvnnfpg': {
      'ar': 'hight',
      'en': '',
    },
    'v4kmhu0k': {
      'ar': 'check your baby wieght status',
      'en': '',
    },
    'wfsm1inf': {
      'ar': 'weight',
      'en': '',
    },
    'u8r3b0b4': {
      'ar': 'Page Title',
      'en': '',
    },
    '2lkekd8e': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // whighttracking
  {
    'csi7kvv2': {
      'ar': 'Today\'s Weight',
      'en': '',
    },
    't8h4azkl': {
      'ar': 'Enter weight',
      'en': '',
    },
    'vcv2kb3t': {
      'ar': 'kg',
      'en': '',
    },
    'bh6h8b0q': {
      'ar': 'Date:',
      'en': '',
    },
    '0grpgi05': {
      'ar': 'Today, Dec 15',
      'en': '',
    },
    'n2g1orfv': {
      'ar': 'Notes (optional)',
      'en': '',
    },
    '00yujm0d': {
      'ar': 'Save Weight',
      'en': '',
    },
    'znzz8zgc': {
      'ar': 'Quick Summary',
      'en': '',
    },
    'bk2flfll': {
      'ar': 'Current Weight',
      'en': '',
    },
    'phijxlky': {
      'ar': '68.5 kg',
      'en': '',
    },
    'zj6t8dw4': {
      'ar': 'Total Gain',
      'en': '',
    },
    'jj03agtx': {
      'ar': '+12.3 kg',
      'en': '',
    },
    '5m2b2pts': {
      'ar': 'Last 7 Days',
      'en': '',
    },
    'bzgszcab': {
      'ar': '+0.4 kg',
      'en': '',
    },
    'l3nlm2ro': {
      'ar': 'Gestational Week',
      'en': '',
    },
    'j57a0byp': {
      'ar': 'Week 28',
      'en': '',
    },
    'g30kcmfe': {
      'ar': 'Weight Tracking',
      'en': '',
    },
  },
  // Setting
  {
    'iokzk73e': {
      'ar': 'الإعدادت',
      'en': '',
    },
    'to9wxgd0': {
      'ar': ' الملف الشخصي للأم',
      'en': '',
    },
    'vbxkb5m6': {
      'ar': 'الأدوات',
      'en': '',
    },
    '8pspb1ex': {
      'ar': 'حساب الطفل',
      'en': '',
    },
    'teu6z9kz': {
      'ar': 'الخدمات المدفوعة',
      'en': '',
    },
    'a5pzixek': {
      'ar': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '30qzz21z': {
      'ar': '',
      'en': '',
    },
    'g1p600ov': {
      'ar': '',
      'en': '',
    },
    '4ama9elb': {
      'ar': '',
      'en': '',
    },
    'lfo295s9': {
      'ar': '',
      'en': '',
    },
    '09gw04o2': {
      'ar': '',
      'en': '',
    },
    '9bkrr51l': {
      'ar': '',
      'en': '',
    },
    'bz46wqxp': {
      'ar': '',
      'en': '',
    },
    'q0ifgp3i': {
      'ar': '',
      'en': '',
    },
    'gr3tsw0m': {
      'ar': '',
      'en': '',
    },
    'wsf49w1o': {
      'ar': '',
      'en': '',
    },
    'qk13x9hy': {
      'ar': '',
      'en': '',
    },
    'ztrg6lt5': {
      'ar': '',
      'en': '',
    },
    'xs8k2qhe': {
      'ar': '',
      'en': '',
    },
    'y9dqnxye': {
      'ar': '',
      'en': '',
    },
    'rv0c8xnq': {
      'ar': '',
      'en': '',
    },
    'axwu8ci7': {
      'ar': '',
      'en': '',
    },
    'rppk50vz': {
      'ar': '',
      'en': '',
    },
    '7g42rnz8': {
      'ar': '',
      'en': '',
    },
    '2nwis2b3': {
      'ar': '',
      'en': '',
    },
    '1lp395no': {
      'ar': '',
      'en': '',
    },
    'r93zt3du': {
      'ar': '',
      'en': '',
    },
    '1nyb8if0': {
      'ar': '',
      'en': '',
    },
    'za8ib5bi': {
      'ar': '',
      'en': '',
    },
    't8jinq6r': {
      'ar': '',
      'en': '',
    },
    'a809u8lx': {
      'ar': '',
      'en': '',
    },
    'qvuh2csz': {
      'ar': '',
      'en': '',
    },
    'pr5sb8h1': {
      'ar': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
