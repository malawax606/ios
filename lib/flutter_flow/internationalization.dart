import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'sw'];

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
    String? enText = '',
    String? swText = '',
  }) =>
      [enText, swText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage2
  {
    'v4a8ttca': {
      'en': 'Explore',
      'sw': 'Calaf',
    },
    'nga9b5ve': {
      'en': 'Chat',
      'sw': 'Qoralada',
    },
    'icuctj1e': {
      'en': 'Profile',
      'sw': 'Xogta',
    },
    'o1xanfku': {
      'en': 'Edit Profile',
      'sw': 'Wax Kabadal Xogta',
    },
    'ztk4ynte': {
      'en': 'Account Information',
      'sw': 'Macluumaadka Koontada',
    },
    'sprl9xlk': {
      'en': 'Security',
      'sw': 'Amniga',
    },
    'tb8gwqu5': {
      'en': 'Help Center',
      'sw': 'Xarunta Caawinta',
    },
    'igkwrj2d': {
      'en': 'Privacy Policy',
      'sw': 'Siyaasadda Qarsoonnimada',
    },
    '5lw9vu9l': {
      'en': 'Log Out',
      'sw': 'Ka bax',
    },
    'ct4rq5hx': {
      'en': 'Soomates',
      'sw': 'Soomates',
    },
    'rv35f78s': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Login
  {
    'yghkeolh': {
      'en': 'Meet new people from all over World.',
      'sw': 'La kulan dad cusub oo ka kala yimid adduunka oo dhan.',
    },
    'ntx1p7a6': {
      'en': 'Chat with other singles and get to know them better.',
      'sw': 'La hadal kuwa kale ee keligood ah oo si fiican u baro iyaga.',
    },
    'y3qfv6m0': {
      'en': 'Get Started',
      'sw': 'Bilow',
    },
    'l64m1arj': {
      'en': 'By signing in, your agreeing our',
      'sw': 'Markaad saxiixdo, waad ogolaatay annaga',
    },
    'g80jlu4d': {
      'en': 'terms',
      'sw': 'shuruudaha',
    },
    'gtlganvt': {
      'en': 'and',
      'sw': 'iyo',
    },
    'h32s4wjz': {
      'en': 'privacy policy',
      'sw': 'siyaasadda gaarka ah',
    },
    'rmp024x4': {
      'en': 'Home',
      'sw': 'Home',
    },
  },
  // User_Profile
  {
    '13km2bdu': {
      'en': 'Message',
      'sw': 'Ujumbe',
    },
    'mxu5aexj': {
      'en': 'Message',
      'sw': 'Ujumbe',
    },
    'vgj224bq': {
      'en': 'Full Name',
      'sw': 'Jina Kamili',
    },
    'fuwrha6t': {
      'en': 'Age',
      'sw': 'Umri',
    },
    '1v29tcxl': {
      'en': 'Gender',
      'sw': 'Jinsia',
    },
    'l7gvhns0': {
      'en': 'Job',
      'sw': 'Kazi',
    },
    'rwicmhcq': {
      'en': 'Skin color',
      'sw': 'Rangi ya ngozi',
    },
    'gylx52em': {
      'en': 'Married status',
      'sw': 'Hali ya ndoa',
    },
    '3m6ctzgc': {
      'en': 'Country',
      'sw': 'Nchi',
    },
    'mjbf2cga': {
      'en': 'City',
      'sw': 'Jiji',
    },
    'sglxnf0u': {
      'en': 'About Me',
      'sw': 'Kuhusu Mimi',
    },
    'abygf1q5': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Message
  {
    '851jdurs': {
      'en': '🩷',
      'sw': '',
    },
    'gmv8wcf6': {
      'en': '😂',
      'sw': '',
    },
    '6z39kbze': {
      'en': '😡',
      'sw': '',
    },
    'vz5it9g7': {
      'en': '👍',
      'sw': '',
    },
    'gx1qiaq4': {
      'en': '😒',
      'sw': '',
    },
    'm87fyq7s': {
      'en': '🤭',
      'sw': '',
    },
    'yw6behyx': {
      'en': '😳',
      'sw': '',
    },
    '8thnfpmn': {
      'en': '👊',
      'sw': '',
    },
    'yhu5z6eq': {
      'en': 'Report',
      'sw': '',
    },
    'giauzmew': {
      'en': 'Copy',
      'sw': '',
    },
    '68qsmidz': {
      'en': 'Copy',
      'sw': '',
    },
    'kbylux12': {
      'en': 'Delete',
      'sw': '',
    },
    'jxtmnjad': {
      'en': 'Message...',
      'sw': 'Ujumbe...',
    },
    'jc1xg04p': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Form
  {
    'h1qd26l2': {
      'en': 'SELECT PICTURE',
      'sw': 'CHAGUA PICHA',
    },
    'mdxn4xmm': {
      'en': 'Username...',
      'sw': 'Jina la mtumiaji...',
    },
    '719cjcyg': {
      'en': 'Country',
      'sw': 'Nchi',
    },
    'ykmx6dau': {
      'en': 'Full Name',
      'sw': 'Jina Kamili',
    },
    'c29m5axq': {
      'en': '16',
      'sw': '16',
    },
    '3fops4eh': {
      'en': '17',
      'sw': '17',
    },
    'gm76kszg': {
      'en': '18',
      'sw': '18',
    },
    '0spm4ta3': {
      'en': '19',
      'sw': '19',
    },
    'j3nji066': {
      'en': '20',
      'sw': '20',
    },
    'edvlugsx': {
      'en': '21',
      'sw': '21',
    },
    'wrnlxutr': {
      'en': '22',
      'sw': '22',
    },
    'gbndv9gn': {
      'en': '23',
      'sw': '23',
    },
    'quu7b06a': {
      'en': '24',
      'sw': '24',
    },
    'x3d3h1vn': {
      'en': '25',
      'sw': '25',
    },
    'gpehbk0z': {
      'en': '26',
      'sw': '26',
    },
    '1hvtyq4x': {
      'en': '27',
      'sw': '27',
    },
    'xzrouqal': {
      'en': '28',
      'sw': '28',
    },
    'sfax4h6s': {
      'en': '29',
      'sw': '29',
    },
    'w0nv55gw': {
      'en': '30',
      'sw': '30',
    },
    'zbpef5mx': {
      'en': '31',
      'sw': '31',
    },
    'gd3w49l7': {
      'en': '32',
      'sw': '32',
    },
    'fwtd2hyq': {
      'en': '33',
      'sw': '33',
    },
    'ch2oslrb': {
      'en': '34',
      'sw': '34',
    },
    'ahbb391j': {
      'en': '35',
      'sw': '35',
    },
    'hs2q2gcx': {
      'en': '36',
      'sw': '36',
    },
    '5ufkzjr4': {
      'en': '37',
      'sw': '37',
    },
    '8i3xplf7': {
      'en': '38',
      'sw': '38',
    },
    '6zcxckzg': {
      'en': '39',
      'sw': '39',
    },
    'ichjj16z': {
      'en': '40',
      'sw': '40',
    },
    'jgr4x695': {
      'en': '41',
      'sw': '41',
    },
    '4i45g08j': {
      'en': '42',
      'sw': '42',
    },
    'l4ryfcbe': {
      'en': '43',
      'sw': '43',
    },
    '0epz2sow': {
      'en': '44',
      'sw': '44',
    },
    '2yobqf02': {
      'en': '45',
      'sw': '45',
    },
    'hmp7zs3a': {
      'en': '46',
      'sw': '46',
    },
    'bagchqvf': {
      'en': '47',
      'sw': '47',
    },
    'ln6p3gi2': {
      'en': '48',
      'sw': '48',
    },
    'dgftn7m0': {
      'en': '49',
      'sw': '49',
    },
    'dl8m3dnw': {
      'en': '50',
      'sw': '50',
    },
    'vvdrulqb': {
      'en': '51',
      'sw': '51',
    },
    '3xg8vr8f': {
      'en': 'Age',
      'sw': 'Umri',
    },
    'wq48ziwk': {
      'en': 'Search',
      'sw': 'Tafuta',
    },
    'c0w8oyaz': {
      'en': 'Lab (Rag)',
      'sw': 'Maabara (Rag)',
    },
    '0tddrc2g': {
      'en': 'Dheddig (Dumar)',
      'sw': 'Dheddig (Dumar)',
    },
    'x386kfen': {
      'en': 'Gender',
      'sw': 'Jinsia',
    },
    'eaj7gdf1': {
      'en': 'Wan shaqeya',
      'sw': 'Wan shaqeya',
    },
    'sfltjmcn': {
      'en': 'Mashaqeyi',
      'sw': 'Mashaqeyi',
    },
    'sxj1gdxj': {
      'en': 'Job',
      'sw': 'Kazi',
    },
    'vd8tj1le': {
      'en': 'Cadan',
      'sw': 'Kadani',
    },
    '285joo1h': {
      'en': 'Marin',
      'sw': 'Marin',
    },
    'r0m17ws8': {
      'en': 'Madow',
      'sw': 'Madow',
    },
    'q4x1nnb5': {
      'en': 'Skin color',
      'sw': 'Rangi ya ngozi',
    },
    'zbvoc4x3': {
      'en': 'Wan sogursady',
      'sw': 'Mtu mmoja',
    },
    'z7yict2m': {
      'en': 'wali mangursan',
      'sw': 'Imetenganishwa',
    },
    'vxys8391': {
      'en': 'Married Status',
      'sw': 'Hali ya Ndoa',
    },
    'rzwaiol1': {
      'en': 'About me',
      'sw': 'Kuhusu mimi',
    },
    'szbcvyur': {
      'en': 'Username is required.',
      'sw': 'Jina la mtumiaji linahitajika.',
    },
    '2ujl1pcp': {
      'en': 'Please choose an option from the dropdown',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'a4907i7h': {
      'en': 'Country is required.',
      'sw': 'Nchi inahitajika.',
    },
    '581imetd': {
      'en': 'Please choose an option from the dropdown',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    '7am0d75q': {
      'en': 'Name is required.',
      'sw': 'Jina linahitajika.',
    },
    '63014vie': {
      'en': 'Please choose an option from the dropdown',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    '7yvuyji9': {
      'en': 'Field is required',
      'sw': '',
    },
    'pxi6gmvj': {
      'en': 'Please choose an option from the dropdown',
      'sw': '',
    },
    '2grizmef': {
      'en': 'Done',
      'sw': 'Imekamilika',
    },
    'kh8o1k6d': {
      'en': 'Create Profile',
      'sw': 'Unda Wasifu',
    },
    '3nd5gr0d': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Update_Profile
  {
    'sulsr8n0': {
      'en': 'SELECT PICTURE',
      'sw': 'CHAGUA PICHA',
    },
    'wavxj8wu': {
      'en': 'Username...',
      'sw': 'Jina la mtumiaji...',
    },
    '1suc30wh': {
      'en': 'Country',
      'sw': 'Nchi',
    },
    'inzjodpa': {
      'en': 'Full Name',
      'sw': 'Jina Kamili',
    },
    '2ahu2wai': {
      'en': '16',
      'sw': '16',
    },
    'o51nibld': {
      'en': '17',
      'sw': '17',
    },
    'j61eplvr': {
      'en': '18',
      'sw': '18',
    },
    '7bi4mzaa': {
      'en': '19',
      'sw': '19',
    },
    'fc6co4hq': {
      'en': '20',
      'sw': '20',
    },
    '6coz2j2e': {
      'en': '21',
      'sw': '21',
    },
    '7f04cw9i': {
      'en': '22',
      'sw': '22',
    },
    'rei9t5qk': {
      'en': '23',
      'sw': '23',
    },
    'nl4f2e6h': {
      'en': '24',
      'sw': '24',
    },
    'ru1xbo6j': {
      'en': '25',
      'sw': '25',
    },
    'y2f1uzs2': {
      'en': '26',
      'sw': '26',
    },
    '1d2hzhpe': {
      'en': '27',
      'sw': '27',
    },
    '5357cmkx': {
      'en': '28',
      'sw': '28',
    },
    '04w3xffh': {
      'en': '29',
      'sw': '29',
    },
    '5iba19y6': {
      'en': '30',
      'sw': '30',
    },
    '7krue2d9': {
      'en': '31',
      'sw': '31',
    },
    'liozick2': {
      'en': '32',
      'sw': '32',
    },
    '4kvu5337': {
      'en': '33',
      'sw': '33',
    },
    'mg4hcocd': {
      'en': '34',
      'sw': '34',
    },
    'ji7qsa4u': {
      'en': '35',
      'sw': '35',
    },
    's493iz2h': {
      'en': '36',
      'sw': '36',
    },
    'njsv8ow3': {
      'en': '37',
      'sw': '37',
    },
    'odb2yu2k': {
      'en': '38',
      'sw': '38',
    },
    'shdeftag': {
      'en': '39',
      'sw': '39',
    },
    'jrold8t1': {
      'en': '40',
      'sw': '40',
    },
    'in4fa0rw': {
      'en': '41',
      'sw': '41',
    },
    'prmpthpc': {
      'en': '42',
      'sw': '42',
    },
    'y9fk0bbm': {
      'en': '43',
      'sw': '43',
    },
    'qroca1bv': {
      'en': '44',
      'sw': '44',
    },
    'gudr79bd': {
      'en': '45',
      'sw': '45',
    },
    '4vzuxtus': {
      'en': '46',
      'sw': '46',
    },
    'e65ig8yd': {
      'en': '47',
      'sw': '47',
    },
    'hd0hrcdb': {
      'en': '48',
      'sw': '48',
    },
    'sxhfiplw': {
      'en': '49',
      'sw': '49',
    },
    'nbjqee8f': {
      'en': '50',
      'sw': '50',
    },
    'qkqbn9xk': {
      'en': '51',
      'sw': '51',
    },
    '1wvw1fej': {
      'en': 'Age',
      'sw': 'Umri',
    },
    'cj8roffx': {
      'en': 'Search',
      'sw': 'Tafuta',
    },
    'uqw5ayq8': {
      'en': 'Lab (Rag)',
      'sw': 'Maabara (Rag)',
    },
    't9j8lzqe': {
      'en': 'Dheddig (Dumar)',
      'sw': 'Dheddig (Dumar)',
    },
    's4slxrjd': {
      'en': 'Gender',
      'sw': 'Jinsia',
    },
    'ew0seqv5': {
      'en': 'Wan shaqeya',
      'sw': 'Wan shaqeya',
    },
    '335xmxzb': {
      'en': 'Mashaqeyi',
      'sw': 'Mashaqeyi',
    },
    'bcwbknbp': {
      'en': 'Job',
      'sw': 'Kazi',
    },
    '99i5m1d0': {
      'en': 'Cadan',
      'sw': 'Kadani',
    },
    'yrpc8dgt': {
      'en': 'Marin',
      'sw': 'Marin',
    },
    'szqc54jr': {
      'en': 'Madow',
      'sw': 'Madow',
    },
    '849t86wo': {
      'en': 'Skin color',
      'sw': 'Rangi ya ngozi',
    },
    'xvvp0tub': {
      'en': 'Wan sogursady',
      'sw': 'Mtu mmoja',
    },
    'ckr0owj7': {
      'en': 'wali mangursan',
      'sw': 'Wameachwa',
    },
    '2bbe3ygr': {
      'en': 'Married Status',
      'sw': 'Hali ya Ndoa',
    },
    'kejgiv4y': {
      'en': 'About me',
      'sw': 'Kuhusu mimi',
    },
    'jtu38jcc': {
      'en': 'Username is required.',
      'sw': 'Jina la mtumiaji linahitajika.',
    },
    'cutq92oh': {
      'en': 'Please choose an option from the dropdown',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'mb1cz8nf': {
      'en': 'Last name is required.',
      'sw': 'Jina la mwisho linahitajika.',
    },
    'km3k084q': {
      'en': 'Please choose an option from the dropdown',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'tyohkz4j': {
      'en': 'Name is required.',
      'sw': 'Jina linahitajika.',
    },
    'isv4ci4c': {
      'en': 'Please choose an option from the dropdown',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    '1sa3acm1': {
      'en': 'Update',
      'sw': 'Sasisha',
    },
    'xgycr8ym': {
      'en': 'Update Profile',
      'sw': 'Sasisha Wasifu',
    },
    '2virojh0': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Privacy_Policy
  {
    '3801b8ck': {
      'en': 'Privacy Policy',
      'sw': 'Sera ya Faragha',
    },
    'fwa70133': {
      'en': '1. Introduction ',
      'sw': '1. Utangulizi',
    },
    'difgwzom': {
      'en':
          'Privacy Policy This privacy policy explains how Soomluv collects, uses, and protects your personal information.',
      'sw':
          'Sera ya Faragha Sera hii ya faragha inaeleza jinsi Soomluv inavyokusanya, kutumia, na kulinda taarifa zako za kibinafsi.',
    },
    'b7l2wj86': {
      'en': '2. Information We Collect',
      'sw': '2. Taarifa Tunazokusanya',
    },
    'drjxr3gx': {
      'en':
          'We may collect personal information such as your name, email, location, and other details to improve your user experience.',
      'sw':
          'Tunaweza kukusanya taarifa za kibinafsi kama vile jina lako, barua pepe, eneo, na maelezo mengine ili kuboresha matumizi yako.',
    },
    '55k4stl1': {
      'en': '3. How We Use Your Information',
      'sw': '3. Jinsi Tunavyotumia Taarifa Zako',
    },
    'xyapaa92': {
      'en':
          'Your information is used to personalize your experience, improve Soomluv, and send you relevant updates.',
      'sw':
          'Maelezo yako yanatumiwa kubinafsisha matumizi yako, kuboresha Soomluv, na kukutumia masasisho muhimu.',
    },
    'lxex32m4': {
      'en': '4. Security ',
      'sw': '4. Usalama',
    },
    '8ze3ipvh': {
      'en':
          ' We take appropriate measures to secure your personal information. However, no method of transmission over the internet is 100% secure.',
      'sw':
          'Tunachukua hatua zinazofaa ili kupata taarifa zako za kibinafsi. Hata hivyo, hakuna njia ya maambukizi kwenye mtandao ambayo ni salama 100%.',
    },
    'ogzggrjc': {
      'en': '5. Changes to This Policy',
      'sw': '5. Mabadiliko ya Sera hii',
    },
    '9kb2xfmj': {
      'en':
          'We may update this privacy policy from time to time. You will be notified of any changes on this page.',
      'sw':
          'Tunaweza kusasisha sera hii ya faragha mara kwa mara. Utaarifiwa kuhusu mabadiliko yoyote kwenye ukurasa huu.',
    },
    'ol3ndiiz': {
      'en': 'Contact Us',
      'sw': 'Wasiliana Nasi',
    },
    'nc8qmy64': {
      'en':
          'If you have any questions about this privacy policy, please contact us at +252770601699',
      'sw':
          'Ikiwa una maswali yoyote kuhusu sera hii ya faragha, tafadhali wasiliana nasi kwa +252770601699',
    },
    'i59drywk': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // HelpCenter
  {
    'z4m2p0ff': {
      'en': 'How can we help you?',
      'sw': 'Je, tunaweza kukusaidia vipi?',
    },
    'h40hmatw': {
      'en': 'WhatsApp Support',
      'sw': 'Usaidizi wa WhatsApp',
    },
    'u7r2cxv1': {
      'en': 'Chat with our support team on WhatsApp for quick assistance.',
      'sw':
          'Piga gumzo na timu yetu ya usaidizi kwenye WhatsApp kwa usaidizi wa haraka.',
    },
    '040b1w20': {
      'en': 'Open WhatsApp',
      'sw': 'Fungua WhatsApp',
    },
    'ueg57inh': {
      'en': 'Email Support',
      'sw': 'Msaada wa barua pepe',
    },
    'pjdwg0pt': {
      'en': 'Send us an email for more detailed inquiries or feedback.',
      'sw': 'Tutumie barua pepe kwa maswali au maoni ya kina zaidi.',
    },
    '4fp8cctp': {
      'en': 'Send Email',
      'sw': 'Tuma Barua Pepe',
    },
    'ijhs9161': {
      'en': 'Frequently Asked Questions',
      'sw': 'Maswali Yanayoulizwa Mara Kwa Mara',
    },
    '4wcz7y8b': {
      'en': 'How do I reset my password?',
      'sw': 'Je, ninawezaje kuweka upya nenosiri langu?',
    },
    'n0k1tl1v': {
      'en': 'How can I change my profile picture?',
      'sw': 'Ninawezaje kubadilisha picha yangu ya wasifu?',
    },
    'tu2zvjop': {
      'en': 'How do I report inappropriate behavior?',
      'sw': 'Je, ninaripotije tabia isiyofaa?',
    },
    'zzffd790': {
      'en': 'Can I undo a swipe?',
      'sw': 'Je, ninaweza kutendua kutelezesha kidole?',
    },
    'nfpcxf8p': {
      'en': 'Help Center',
      'sw': 'Kituo cha Usaidizi',
    },
    'ynurvbbn': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Security
  {
    'ty9gcseu': {
      'en': 'Security',
      'sw': 'Usalama',
    },
    '4z8kd6tt': {
      'en': 'Email Verification Status',
      'sw': 'Hali ya Uthibitishaji wa Barua Pepe',
    },
    'zhl7ds69': {
      'en': 'Verified',
      'sw': 'Imethibitishwa',
    },
    'qjxhlb0a': {
      'en': 'Unverified',
      'sw': 'Haijathibitishwa',
    },
    'tp2c7ttc': {
      'en': 'Show Online Status',
      'sw': 'Onyesha Hali ya Mtandaoni',
    },
    'y1w98yko': {
      'en': 'Allow Messages',
      'sw': 'Ruhusu Ujumbe',
    },
    '3duv53h4': {
      'en': 'Show Last Seen',
      'sw': 'Onyesha Kuonekana Mara ya Mwisho',
    },
    'fkcme1z2': {
      'en': 'Privacy Options',
      'sw': 'Chaguzi za Faragha',
    },
    'm84tubbb': {
      'en': 'Profile Visibility',
      'sw': 'Mwonekano wa Wasifu',
    },
    'q368bdhz': {
      'en': 'Blocked Users',
      'sw': 'Watumiaji Waliozuiwa',
    },
    'kcmg9nph': {
      'en': 'Message Filtering',
      'sw': 'Kuchuja Ujumbe',
    },
    'b9yfx4ks': {
      'en': 'Account Security',
      'sw': 'Usalama wa Akaunti',
    },
    '2qmbh4wb': {
      'en': 'Change Email',
      'sw': 'Badilisha Barua pepe',
    },
    '300kqupg': {
      'en': 'Login Activity',
      'sw': 'Shughuli ya Kuingia',
    },
    'ss8tnp7o': {
      'en': 'Linked Accounts',
      'sw': 'Akaunti Zilizounganishwa',
    },
    'zvhotsug': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Account_Settings
  {
    'h0uwbw9u': {
      'en': 'Page Title',
      'sw': 'Kichwa cha Ukurasa',
    },
    'seycb2o5': {
      'en': 'Profile Information',
      'sw': 'Maelezo ya Wasifu',
    },
    '6mkkyfun': {
      'en': 'Full Name',
      'sw': 'Jina Kamili',
    },
    'tbotu3ud': {
      'en': 'Email',
      'sw': 'Barua pepe',
    },
    'w6j40sqc': {
      'en': 'Phone Number',
      'sw': 'Nambari ya Simu',
    },
    '7t0h12zg': {
      'en': 'Account Preferences',
      'sw': 'Mapendeleo ya Akaunti',
    },
    'hoct3ywf': {
      'en': 'Show me on Cupid',
      'sw': 'Nionyeshe kwenye Cupid',
    },
    'f1jnndh7': {
      'en': 'Enable notifications',
      'sw': 'Washa arifa',
    },
    'p29cc161': {
      'en': 'Dark mode',
      'sw': 'Hali ya giza',
    },
    '8vu4jobt': {
      'en': 'Privacy Settings',
      'sw': 'Mipangilio ya Faragha',
    },
    'icv19shu': {
      'en': 'Profile visibility',
      'sw': 'Mwonekano wa wasifu',
    },
    'sfur4nqf': {
      'en': 'Public\" \\ \"Friends\" \\ \"Private',
      'sw': 'Umma\" \\\"Marafiki\" \\\"Binafsi',
    },
    '6nmfjpnq': {
      'en': 'Allow messaging from',
      'sw': 'Ruhusu ujumbe kutoka',
    },
    '39n1nwy4': {
      'en': 'Everyone\" \\ \"Matches\" \\ \"No one',
      'sw': 'Kila mtu\" \\ \"Inalingana\" \\ \"Hakuna mtu',
    },
    'jmmghu1n': {
      'en': 'Save Changes',
      'sw': 'Hifadhi Mabadiliko',
    },
    'klivl2ex': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Account_Information
  {
    'prk1qrpm': {
      'en': 'Personal info',
      'sw': 'Taarifa za kibinafsi',
    },
    'apzlmiwp': {
      'en': 'Full Name',
      'sw': 'Jina Kamili',
    },
    'kryfd5q2': {
      'en': 'Username',
      'sw': 'Jina la mtumiaji',
    },
    'nkvqyval': {
      'en': 'Age',
      'sw': 'Umri',
    },
    'oilzqc9s': {
      'en': 'Gender',
      'sw': 'Jinsia',
    },
    'dx1h01pk': {
      'en': 'Job',
      'sw': 'Kazi',
    },
    '08hrw8kg': {
      'en': 'Skin color',
      'sw': 'Rangi ya ngozi',
    },
    'akrgzilf': {
      'en': 'Married status',
      'sw': 'Hali ya ndoa',
    },
    '6fiihvm4': {
      'en': 'Country',
      'sw': 'Nchi',
    },
    'tj7wxd1q': {
      'en': 'City',
      'sw': 'Jiji',
    },
    '4bgicccn': {
      'en': 'Account Information',
      'sw': 'Taarifa za Akaunti',
    },
    '7lzkv7ma': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Check
  {
    'cesonx2w': {
      'en': 'Checking...',
      'sw': '',
    },
    '93j8kbl3': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // ProfileViews
  {
    'ckj0im9z': {
      'en': 'People who viewed your profile',
      'sw': 'Watu waliotazama wasifu wako',
    },
    'usf4nron': {
      'en': 'Emma Johnson',
      'sw': 'Emma Johnson',
    },
    'u9mc9evc': {
      'en': 'United States',
      'sw': 'Marekani',
    },
    'idu6g9ih': {
      'en': 'Liam Chen',
      'sw': 'Liam Chen',
    },
    'x2kjvwzg': {
      'en': 'China',
      'sw': 'China',
    },
    'fronywlu': {
      'en': 'Page Title',
      'sw': 'Kichwa cha Ukurasa',
    },
    'sbm5d2g0': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Blocked
  {
    'dr8ftaaz': {
      'en': 'People you\'ve blocked',
      'sw': 'Watu ambao umewazuia',
    },
    't735d33u': {
      'en': 'Unblock',
      'sw': 'Ondoa kizuizi',
    },
    '8o8r2zfq': {
      'en': 'Blocked',
      'sw': 'Imezuiwa',
    },
    'g1vb37dh': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // All_Users
  {
    'ux9nvp5e': {
      'en': 'Page Title',
      'sw': 'Kichwa cha Ukurasa',
    },
    '5wrh9cpl': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Live_Audio
  {
    'min5eifq': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Users-NoProfile
  {
    'j6xwkhk9': {
      'en': 'No Profiles',
      'sw': 'Hakuna Wasifu',
    },
    '0py1n1sl': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Call_Join
  {
    'ttoyno93': {
      'en': 'Calafdon Live',
      'sw': 'Calafdon Live',
    },
    'bhhiqz8y': {
      'en': 'Join the live to connect with other Calafdon People',
      'sw': 'Jiunge na moja kwa moja ili kuungana na Watu wengine wa Calafdon',
    },
    'l8h4d4ms': {
      'en': 'Join Live',
      'sw': 'Jiunge Moja kwa Moja',
    },
    'lcjeyf3h': {
      'en': 'Join Live',
      'sw': 'Jiunge Moja kwa Moja',
    },
    'nwqs11ak': {
      'en': 'By joining, you agree to our Terms of Service',
      'sw': 'Kwa kujiunga, unakubali Sheria na Masharti yetu',
    },
    'vpkqpzjz': {
      'en': 'Live Guidelines',
      'sw': 'Miongozo ya moja kwa moja',
    },
    'eu3nhkwa': {
      'en': '1. Be respectful and courteous',
      'sw': '1. Kuwa na heshima na adabu',
    },
    'nzufg3vw': {
      'en': '2. Ensure you\'re in a quiet environment',
      'sw': '2. Hakikisha uko katika mazingira tulivu',
    },
    'yk8i24qu': {
      'en': '3. Have fun and be yourself!',
      'sw': '3. Furahia na uwe mwenyewe!',
    },
    '9gzq61zo': {
      'en': 'Live',
      'sw': 'Ishi',
    },
    '69fj5fv6': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Search
  {
    'blsy9504': {
      'en': 'Search',
      'sw': 'Tafuta',
    },
    'a03nz4wo': {
      'en': 'Enter username',
      'sw': 'Ingiza jina la mtumiaji',
    },
    'eghpzk8s': {
      'en': 'Enter age',
      'sw': 'Ingiza umri',
    },
    '19k751mg': {
      'en': 'Search',
      'sw': 'Tafuta',
    },
    '7b4k9bte': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Live_AudioCopy
  {
    'i4z2oxmw': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // User_Profile-Update
  {
    'b7aimgd9': {
      'en': 'Update\n',
      'sw': 'Sasisha',
    },
    'f2g2qhim': {
      'en': 'Profile',
      'sw': 'Wasifu',
    },
    'fxvgs1gx': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // HomePage
  {
    'poood59y': {
      'en': 'Explore',
      'sw': 'Chunguza',
    },
    '1giy2wio': {
      'en': 'Chat',
      'sw': 'Soga',
    },
    'qu94a8s5': {
      'en': 'Profile',
      'sw': 'Wasifu',
    },
    'ko5t9ugq': {
      'en': 'Edit Profile',
      'sw': 'Badilisha Wasifu',
    },
    'i5w3egzd': {
      'en': 'Account Information',
      'sw': 'Taarifa za Akaunti',
    },
    'uwluuo5l': {
      'en': 'Security',
      'sw': 'Usalama',
    },
    '8z6sqpp3': {
      'en': 'Display',
      'sw': 'Onyesho',
    },
    'dlex6wwg': {
      'en': 'Help Center',
      'sw': 'Kituo cha Usaidizi',
    },
    '2uqsym08': {
      'en': 'Privacy Policy',
      'sw': 'Sera ya Faragha',
    },
    'nepdxyob': {
      'en': 'Log Out',
      'sw': 'Toka nje',
    },
    'umurlsl0': {
      'en': 'New Version Available',
      'sw': 'Toleo Jipya Linapatikana',
    },
    'zsh8cw9m': {
      'en':
          'We\'ve added exciting new features and fixed some bugs. Please update to continue using the app.',
      'sw':
          'Tumeongeza vipengele vipya vya kusisimua na kurekebisha hitilafu kadhaa. Tafadhali sasisha ili kuendelea kutumia programu.',
    },
    'y578yq0d': {
      'en': 'Update Now',
      'sw': 'Sasisha Sasa',
    },
    'baids9km': {
      'en': 'Alafdoon',
      'sw': 'Alafdoon',
    },
    '06vzjxv5': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Email_Change
  {
    'knmk75rs': {
      'en': 'Update your email address',
      'sw': 'Sasisha anwani yako ya barua pepe',
    },
    '8yk87oh0': {
      'en':
          'Enter your new email address below. We\'ll send a verification link to confirm the change.',
      'sw':
          'Weka barua pepe yako mpya hapa chini. Tutatuma kiungo cha uthibitishaji ili kuthibitisha mabadiliko.',
    },
    'ohf07foe': {
      'en': 'Current Email',
      'sw': 'Barua pepe ya Sasa',
    },
    '087dyde7': {
      'en': 'New Email',
      'sw': 'Barua pepe Mpya',
    },
    'xp07sxm8': {
      'en': 'Confirm New Email',
      'sw': 'Thibitisha Barua pepe Mpya',
    },
    'ld5g1qpe': {
      'en': 'Update Email',
      'sw': 'Sasisha Barua pepe',
    },
    'ls20aqfh': {
      'en':
          'Note: Changing your email may require you to verify your account again.',
      'sw':
          'Kumbuka: Kubadilisha barua pepe yako kunaweza kukuhitaji uthibitishe akaunti yako tena.',
    },
    'cvg3bp0t': {
      'en': 'Email Update',
      'sw': 'Sasisho la Barua pepe',
    },
    'haw6gzbb': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Display
  {
    'lszfw363': {
      'en': 'Light',
      'sw': 'Iftiin',
    },
    'l5bp5anm': {
      'en': 'Dark',
      'sw': 'Madow',
    },
    'jj6028be': {
      'en': 'Language',
      'sw': 'Luuqada',
    },
    'u29rprt5': {
      'en': 'Af-Somali',
      'sw': 'Af-Somali',
    },
    '85bmcuan': {
      'en': 'English',
      'sw': 'Ingiriis',
    },
    'vlu7ocwg': {
      'en': 'Display',
      'sw': 'Bandhig',
    },
    'w5vtg8kh': {
      'en': 'Home',
      'sw': 'Home',
    },
  },
  // Vpn-
  {
    '897uq6ab': {
      'en': 'VPN Connection Detected',
      'sw': '',
    },
    'tryle5wc': {
      'en':
          'For security reasons, we cannot allow the use of VPN while using this app. Please turn off your VPN and try again.',
      'sw': '',
    },
    '2esxb1dy': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Net
  {
    'dbg92qcb': {
      'en': 'Oops! No Internet Connection',
      'sw': '',
    },
    'fny164u1': {
      'en': 'Please check your internet connection and try again.',
      'sw': '',
    },
    '2vbnjfc4': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Payment
  {
    '8winfi6x': {
      'en': 'Premium Features',
      'sw': '',
    },
    '9tkjcg1i': {
      'en': 'Get Verified',
      'sw': '',
    },
    '2atq5d12': {
      'en': 'Hide Online Status',
      'sw': '',
    },
    '12gxeych': {
      'en': 'Read messages without seeing',
      'sw': '',
    },
    'fvrn3bi7': {
      'en': 'View profiles without knowing you',
      'sw': '',
    },
    '6k13wkuo': {
      'en': 'Ad-Free Experience',
      'sw': '',
    },
    'dzno9t24': {
      'en': 'Select Payment Method',
      'sw': '',
    },
    'vyn6pso3': {
      'en': 'Subscription Plan',
      'sw': '',
    },
    'svdvn7rl': {
      'en': 'Monthly Plan',
      'sw': '',
    },
    'gxukwazw': {
      'en': '\$2.99/month',
      'sw': '',
    },
    'psx4jhb8': {
      'en': 'Cancel anytime',
      'sw': '',
    },
    'tubaaa3w': {
      'en': 'Subscribe Now',
      'sw': '',
    },
    '57vtov4h': {
      'en':
          'By subscribing, you agree to our Terms of Service and Privacy Policy',
      'sw': '',
    },
    'cqllgfp2': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // pay
  {
    'pc8y7eix': {
      'en': 'Recent Login Activity',
      'sw': '',
    },
    'g47ezdwj': {
      'en': 'iPhone 12 Pro',
      'sw': '',
    },
    'h10aro7j': {
      'en': 'New York, USA',
      'sw': '',
    },
    'xwox6cve': {
      'en': 'Today, 10:30 AM',
      'sw': '',
    },
    'ni8dazgz': {
      'en': 'MacBook Air',
      'sw': '',
    },
    'dx7507js': {
      'en': 'San Francisco, USA',
      'sw': '',
    },
    'tvfdnvb7': {
      'en': 'Yesterday, 3:45 PM',
      'sw': '',
    },
    'u84y79bu': {
      'en': 'iPad Pro',
      'sw': '',
    },
    'p0m8yzqn': {
      'en': 'London, UK',
      'sw': '',
    },
    '26whwme2': {
      'en': '2 days ago, 9:15 AM',
      'sw': '',
    },
    'd0bi1tlg': {
      'en': 'Windows PC',
      'sw': '',
    },
    'x6gu3hs3': {
      'en': 'Berlin, Germany',
      'sw': '',
    },
    '71rm685r': {
      'en': '1 week ago, 2:00 PM',
      'sw': '',
    },
    'fjpfiyvm': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Test
  {
    'gfya3kta': {
      'en': 'Hello World',
      'sw': '',
    },
    'rq6kdjxy': {
      'en': 'Button',
      'sw': '',
    },
    'pfsypg2e': {
      'en': 'Page Title',
      'sw': 'Kichwa cha Ukurasa',
    },
    'rgy6tfd6': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Update_App
  {
    '05n2x7cw': {
      'en': 'New Version Available',
      'sw': '',
    },
    'x4yuwwhi': {
      'en':
          'We\'ve added exciting new features and fixed some bugs. Please update to continue using the app.',
      'sw': '',
    },
    '6fwz6hen': {
      'en': 'Update Now',
      'sw': '',
    },
    '6ygnhhcs': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Messages
  {
    'b7on9534': {
      'en': 'Chat',
      'sw': 'Soga',
    },
    '5axr0uws': {
      'en': 'Message...',
      'sw': 'Ujumbe...',
    },
    'f8s0ay9e': {
      'en': 'Send',
      'sw': 'Tuma',
    },
  },
  // Email_Verify
  {
    'vlnpqmui': {
      'en': 'Verify Your Email',
      'sw': 'Thibitisha Barua pepe Yako',
    },
    'um3u9fk8': {
      'en': 'Didn\'t receive the email?',
      'sw': 'Hukupokea barua pepe?',
    },
    't7xn5g8k': {
      'en':
          'Please check your spam folder if you don\'t see the email in your inbox.',
      'sw':
          'Tafadhali angalia folda yako ya barua taka ikiwa huoni barua pepe kwenye kikasha chako.',
    },
  },
  // LogOut
  {
    'vij8w91f': {
      'en': 'Are you sure you want to log out?',
      'sw': 'Je, una uhakika unataka kutoka?',
    },
    'bi3lmgdx': {
      'en': 'Log Out',
      'sw': 'Toka nje',
    },
  },
  // Report
  {
    'u8l3zcfi': {
      'en': 'Doro Sababta ad report u dhaheysid?',
      'sw': 'Doro Sababta ad report you dhaheysid?',
    },
    '5hlfxpy1': {
      'en': 'Sawir anshax xumo u saran',
      'sw': 'Sawir anshax xumo u saran',
    },
    'rnfpug75': {
      'en': 'Magac xun ugu qoran',
      'sw': 'Magac xun ugu qoran',
    },
    'i7tv7fat': {
      'en': 'Sabab kle ban Report u dhahaya',
      'sw': 'Sabab kle ban Report u dhahaya',
    },
    'ygbk6ywy': {
      'en': 'Inta ku qor sababta',
      'sw': 'Inta kwa qor sababta',
    },
    '011yu5fk': {
      'en': 'Type your message here...',
      'sw': 'Andika ujumbe wako hapa...',
    },
    '2m2wv5r7': {
      'en': 'Submit Report',
      'sw': 'Wasilisha Ripoti',
    },
  },
  // Report_Done
  {
    'tl4ovidu': {
      'en': 'Thanks for reporting',
      'sw': 'Asante kwa kuripoti',
    },
    'yukcfss5': {
      'en': 'Done',
      'sw': '',
    },
  },
  // More
  {
    'uas9hzk2': {
      'en': 'Report',
      'sw': 'Ripoti',
    },
    'x2w493yh': {
      'en': 'Block',
      'sw': 'Zuia',
    },
    '51i1hb6s': {
      'en': 'Unblock',
      'sw': 'Ondoa kizuizi',
    },
  },
  // Miscellaneous
  {
    '7xnzkx31': {
      'en': 'Button',
      'sw': 'Kitufe',
    },
    'yfglmgmb': {
      'en': '',
      'sw':
          'Ili kupiga picha au video, programu hii inahitaji ruhusa ya kufikia kamera.',
    },
    '29r224mf': {
      'en': '',
      'sw':
          'Ili kupakia data, programu hii inahitaji ruhusa ya kufikia maktaba ya picha.',
    },
    'rxv37cag': {
      'en': 'j',
      'sw': 'j',
    },
    'b4ai7hvs': {
      'en': 'p',
      'sw': 'uk',
    },
    'mdqxmh9z': {
      'en': 'o',
      'sw': 'o',
    },
    'swm1apdr': {
      'en': 'Please enable it',
      'sw': 'Tafadhali iwashe',
    },
    'cjcy1ihh': {
      'en': '',
      'sw': '',
    },
    'jx57gt36': {
      'en': '',
      'sw': '',
    },
    'oh3ls5ij': {
      'en': '',
      'sw': '',
    },
    'ssh0nbou': {
      'en': '',
      'sw': '',
    },
    'uf99eevt': {
      'en': '',
      'sw': '',
    },
    'mnh8gx62': {
      'en': '',
      'sw': '',
    },
    '3h5w1sff': {
      'en': '',
      'sw': '',
    },
    '6qqzc2k0': {
      'en': '',
      'sw': '',
    },
    '6zmbb2l6': {
      'en': '',
      'sw': '',
    },
    'sayg6369': {
      'en': '',
      'sw': '',
    },
    '7bh6phk3': {
      'en': '',
      'sw': '',
    },
    'qa779h86': {
      'en': '',
      'sw': '',
    },
    'n22hfl7e': {
      'en': '',
      'sw': '',
    },
    'r35xgwfy': {
      'en': '',
      'sw': '',
    },
    'ayi5962e': {
      'en': '',
      'sw': '',
    },
    'kenycnmu': {
      'en': '',
      'sw': '',
    },
    'sc57ndvr': {
      'en': '',
      'sw': '',
    },
    'dfulk025': {
      'en': '',
      'sw': '',
    },
    'vpeqbxjt': {
      'en': '',
      'sw': '',
    },
    's4ebn6tr': {
      'en': '',
      'sw': '',
    },
    'scqn0ut2': {
      'en': '',
      'sw': '',
    },
    'xdakg80p': {
      'en': '',
      'sw': '',
    },
    'fjzmn1hi': {
      'en': '',
      'sw': '',
    },
    'yyg2m07m': {
      'en': '',
      'sw': '',
    },
    'w90ykgda': {
      'en': '',
      'sw': '',
    },
  },
].reduce((a, b) => a..addAll(b));
