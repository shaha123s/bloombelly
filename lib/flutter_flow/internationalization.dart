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
  // login
  {
    '8vnkwbot': {
      'ar': 'BloomBelly',
      'en': 'BloomBelly',
    },
    'nie8cq0x': {
      'ar': 'اهلا بك ',
      'en': 'Hey, you',
    },
    'c19azji2': {
      'ar': 'Email address',
      'en': 'Email address',
    },
    'f0mhl0i1': {
      'ar': 'Password',
      'en': 'Password',
    },
    'qvsv8rlt': {
      'ar': 'تسجيل الدخول',
      'en': 'Log in',
    },
    'lrgjt8r3': {
      'ar': 'Forgot your password?',
      'en': 'Forgot your password?',
    },
  },
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
    'wmcf7o7g': {
      'ar': 'الصفحة الرئيسية',
      'en': 'Home',
    },
    '13qttaet': {
      'ar': 'بروفايل الطفل',
      'en': 'Child profile',
    },
    'pt5kal02': {
      'ar': 'الإعدادات',
      'en': 'Settings',
    },
    'xyd3igcz': {
      'ar': 'تواصل معنا',
      'en': 'Contact us',
    },
    'ez6ouobj': {
      'ar': 'تسجيل الخروج',
      'en': 'Log out',
    },
    '55k7r2cx': {
      'ar': 'tools',
      'en': 'tools',
    },
  },
  // foodtrack
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
    'rpfkg7ge': {
      'ar': 'الموصى به 2000- 2500 ',
      'en': 'Recommended 2000-2500',
    },
    '1v27i0sl': {
      'ar': 'السعرات الحرارية',
      'en': 'calories',
    },
    'tymm9ze4': {
      'ar': 'Enter calories',
      'en': 'Enter calories',
    },
    'arnqq2t0': {
      'ar': 'الموصى به: 70-100 ',
      'en': 'Recommended: 70-100',
    },
    '2zt83gvq': {
      'ar': 'البروتين',
      'en': 'Protein',
    },
    'awtlhw1s': {
      'ar': 'Enter protein (g)',
      'en': 'Enter protein (g)',
    },
    'l8rurqhg': {
      'ar': 'الموصى به: 27 ',
      'en': 'Recommended: 27',
    },
    'ali3v77y': {
      'ar': 'الحديد',
      'en': 'Iron',
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
      'ar': 'Track Baby\'s Kicks',
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
      'ar': 'اسبوع  الحمل',
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
    '6qcw3x64': {
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
    'gzdd6ttw': {
      'ar': 'الوزن',
      'en': 'the weight',
    },
    'dacguyk1': {
      'ar': 'الطول',
      'en': 'height',
    },
    'zdpzzwbm': {
      'ar': 'الاسبوع  ',
      'en': 'week',
    },
    'zyoysm0u': {
      'ar': '  من الحمل',
      'en': 'From pregnancy',
    },
    '42xdx4v6': {
      'ar': 'Week 13 of your pregnancy',
      'en': 'Week 13 of your pregnancy',
    },
    'qgajrvrk': {
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
    'n3xmx7ae': {
      'ar': 'المراجع التعليمية لهذا الاسبوع',
      'en': 'Educational references for this week',
    },
    'aqlfvwq3': {
      'ar': 'كيفية التغلب على غثيان الصباح',
      'en': 'How to overcome morning sickness',
    },
    'eqw0nv65': {
      'ar': 'Track Pregnancy',
      'en': 'Track Pregnancy',
    },
    '76vylq6p': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // chat
  {
    'vjco19i2': {
      'ar': 'مرحبا',
      'en': 'Welcome',
    },
    'yqmyfnbl': {
      'ar': '11:13 pm',
      'en': '11:13 pm',
    },
    'za9vj04o': {
      'ar': 'مرحبا كيف يمكنني مساعدتك؟   ',
      'en': 'Hello, how can I help you?',
    },
    'h5gl9fg6': {
      'ar': '11:13 pm',
      'en': '11:13 pm',
    },
    '5wpb3y1h': {
      'ar': 'لدي مشكلة',
      'en': 'I have a problem',
    },
    '1pef8lsk': {
      'ar': '11:13 pm',
      'en': '11:13 pm',
    },
    '0xfgt2m5': {
      'ar': 'ماهي مشكتلك ؟',
      'en': 'What is your problem?',
    },
    '4kamrtx2': {
      'ar': '11:13 pm',
      'en': '11:13 pm',
    },
    'dz0t1ktu': {
      'ar': 'اعاني من الغثيان والصداع',
      'en': 'I suffer from nausea and headache',
    },
    '6v8suhzo': {
      'ar': '11:13 pm',
      'en': '11:13 pm',
    },
    '1gn9b9sf': {
      'ar': 'chatbot',
      'en': 'chatbot',
    },
    'yp8nqfoq': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // homee
  {
    'j51kbf86': {
      'ar': 'الاسبوع 37',
      'en': 'Week 37',
    },
    'xqbupwwk': {
      'ar': 'اليوم 3537',
      'en': 'Day 3537',
    },
    'sl67nnw2': {
      'ar': 'رؤيتي اليومية',
      'en': 'My daily vision',
    },
    'bk0sfvpc': {
      'ar': 'اليوم ',
      'en': 'today',
    },
    '9dnh2ost': {
      'ar': '35',
      'en': '35',
    },
    '9f6ppjew': {
      'ar': 'الوزن',
      'en': 'the weight',
    },
    '4wqpwl3i': {
      'ar': ' 37الاسبوع',
      'en': '37th week',
    },
    'ruah5k7c': {
      'ar': 'Today',
      'en': 'Today',
    },
    'wagfcn6s': {
      'ar': 'Insights',
      'en': 'Insights',
    },
    'bb776fuh': {
      'ar': '2',
      'en': '2',
    },
    '96bs7zas': {
      'ar': 'Secret Chats',
      'en': 'Secret Chats',
    },
    'neu2r26w': {
      'ar': 'Bloombelly',
      'en': 'Bloombelly',
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
    'raom23pf': {
      'ar': 'الاسم',
      'en': 'the name',
    },
    'rdg5i9l4': {
      'ar': 'العمر: 3 سنوات',
      'en': 'Age: 3 years',
    },
    'rggck95k': {
      'ar': 'العمر',
      'en': 'the age',
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
  // paidservices
  {
    'vqfw0mmi': {
      'ar': 'premium',
      'en': 'premium',
    },
    'dhbl0wf0': {
      'ar': 'رصيدك ',
      'en': 'Your balance',
    },
    'u1extfmh': {
      'ar': 'تتبع النوم',
      'en': 'Sleep tracking',
    },
    'lj1rusup': {
      'ar':
          'راقبي نمط نوم الطفل وعدد الساعات حسب فئته العمرية مع نصائح لتحسين جودة النوم',
      'en':
          'Monitor your child\'s sleep pattern and the number of hours according to their age group, with tips to improve sleep quality.',
    },
    'e0ynruo1': {
      'ar': 'سعر الخدمة',
      'en': 'Service price',
    },
    'ggxcjr4d': {
      'ar': '15000',
      'en': '15,000',
    },
    'v2xnbuq6': {
      'ar': 'الشات بوت',
      'en': 'Chatbot',
    },
    'u9nyusob': {
      'ar':
          'احصل على نصائح مخصصة ودعم على مدار الساعة من مساعد الذكاء الاصطناعي ',
      'en': 'Get personalized advice and 24/7 support from your AI assistant.',
    },
    'xgi8emdz': {
      'ar': 'سعر الخدمة',
      'en': 'Service price',
    },
    'dx4blkkw': {
      'ar': '50000',
      'en': '50,000',
    },
    'ooj5olg1': {
      'ar': 'تتبع الغذاء',
      'en': 'Food tracking',
    },
    'lghoweby': {
      'ar': 'تابع النظام الغذائي المناسب لعمر طفلك\n',
      'en': 'Follow a diet appropriate for your child\'s age.',
    },
    'd68ops2w': {
      'ar': 'بسعر الخدمة',
      'en': 'At the service price',
    },
    'kxy05rbz': {
      'ar': '40000',
      'en': '40,000',
    },
    'dkqb8hw0': {
      'ar': 'تتبع اللقاح',
      'en': 'Vaccine tracking',
    },
    'knq6x8j0': {
      'ar':
          'تعرفي على مواعيد التطعيمات الضرورية لطفلك وفقًا لعمره، ولا تفوّتي أي جرعة.',
      'en':
          'Find out the necessary vaccination dates for your child according to his age, and do not miss any dose.',
    },
    '7fh85mvy': {
      'ar': 'سعر الخدمة',
      'en': 'Service price',
    },
    'm8pwldp5': {
      'ar': '20000',
      'en': '20,000',
    },
    'w7orw0dy': {
      'ar': 'تتبع النمو',
      'en': 'Track growth',
    },
    'mdgcapt4': {
      'ar': 'تابع وزن وطول طفلك بشكل دوري',
      'en': 'Monitor your child\'s weight and height regularly.',
    },
    'bsuyon7g': {
      'ar': 'سعر الخدمة',
      'en': 'Service price',
    },
    'zew4323o': {
      'ar': '30000',
      'en': '30,000',
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
    'z1parlsi': {
      'ar': 'BloomBelly',
      'en': 'BloomBelly',
    },
    'squf2nwq': {
      'ar': 'اهلا بك ',
      'en': 'Hey, you',
    },
    'oeo8fnqe': {
      'ar': 'Email address',
      'en': 'Email address',
    },
    'mcyb56dk': {
      'ar': 'Password',
      'en': 'Password',
    },
    'm30sy3v2': {
      'ar': 'تسجيل الدخول',
      'en': 'Log in',
    },
    '5xrxu055': {
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
    '0hsa6yak': {
      'ar': 'تتبع التغذية',
      'en': 'Nutrition tracking',
    },
    'rolfqt1l': {
      'ar': 'تتبع النظام الغذائي والاحتياجات الغذائية',
      'en': 'Track diet and nutritional needs',
    },
    'mzqqxe4p': {
      'ar': 'الدردشة مع الشات بوت',
      'en': 'Chat with a chatbot',
    },
    'p8pinwig': {
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
    'if0labas': {
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
    'zlokwln5': {
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
    'mrwnb1ob': {
      'ar': 'الوقت',
      'en': 'the time',
    },
    'gt6bcwtl': {
      'ar': 'وقت الاستيقاظ',
      'en': 'wake-up time',
    },
    'evnwo84k': {
      'ar': 'الوقت',
      'en': 'the time',
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
    'd3w18qhp': {
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
    'x7wx2oiw': {
      'ar': ' January 1, 2020  ',
      'en': 'January 1, 2020',
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
    'pzkndq58': {
      'ar': 'الحساسية',
      'en': 'Allergy',
    },
    'dt8w4eet': {
      'ar': 'الحالات الصحية',
      'en': 'Health conditions',
    },
    'o2hozsij': {
      'ar': 'سجلات التطعيمات',
      'en': 'Immunization records',
    },
    'qrgislah': {
      'ar': 'قائمة المفضلة',
      'en': 'Favorites list',
    },
    'zqyc77dw': {
      'ar': 'دفتر اللقاحات',
      'en': 'Vaccination book',
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
    'veo89f31': {
      'ar': 'تحرير الملف الشخصي',
      'en': 'Edit profile',
    },
    'uryd33jr': {
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
    'h23vbfdu': {
      'ar': 'تتبع نوم طفلك',
      'en': 'Track your child\'s sleep',
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
    'vwki4ys3': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // chat1
  {
    '6st70ehq': {
      'ar': 'sned',
      'en': 'sned',
    },
    'mec0srh9': {
      'ar': 'chatbot',
      'en': 'chatbot',
    },
    'xpua3wm5': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // profilemother
  {
    'roh137ss': {
      'ar': 'الرصيد',
      'en': 'Balance',
    },
    'zc8hsbv5': {
      'ar': '\$47,892.50',
      'en': '\$47,892.50',
    },
    '5z2rvjhk': {
      'ar': 'Account Overview',
      'en': 'Account Overview',
    },
    'atzjcgmy': {
      'ar': 'الحالة',
      'en': 'the condition',
    },
    'z8fsnvp0': {
      'ar': 'البريد الإلكتروني',
      'en': 'e-mail',
    },
    'gdhia27x': {
      'ar': 'رقم الهاتف',
      'en': 'phone number',
    },
    '0miz35o2': {
      'ar': 'الدور',
      'en': 'The role',
    },
  },
  // bill
  {
    '3ux9gcaq': {
      'ar': 'ملخص الدفع',
      'en': 'Payment Summary',
    },
    'b57vyt1f': {
      'ar': '\$9.99',
      'en': '\$9.99',
    },
    'rgxm7pxd': {
      'ar': 'تكلفة الخدمة',
      'en': 'Service cost',
    },
    'lu0ijupl': {
      'ar': '\$25.50',
      'en': '\$25.50',
    },
    'pohfaugy': {
      'ar': 'الرصيد الحالي ',
      'en': 'Current balance',
    },
    'gkghg77v': {
      'ar': '\$15.51',
      'en': '\$15.51',
    },
    'ixir55v9': {
      'ar': 'الرصيد المتبقي',
      'en': 'Remaining balance',
    },
    '491je617': {
      'ar': 'Page Title',
      'en': 'Page Title',
    },
    'wszxbogc': {
      'ar': 'Home',
      'en': 'Home',
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
