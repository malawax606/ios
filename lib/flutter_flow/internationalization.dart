import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'aa'];

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
    String? aaText = '',
  }) =>
      [enText, aaText][languageIndex] ?? '';

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
      'aa': '',
    },
    'nga9b5ve': {
      'en': 'Chat',
      'aa': '',
    },
    'icuctj1e': {
      'en': 'Profile',
      'aa': '',
    },
    'o1xanfku': {
      'en': 'Edit Profile',
      'aa': '',
    },
    'ztk4ynte': {
      'en': 'Account Information',
      'aa': '',
    },
    'sprl9xlk': {
      'en': 'Security',
      'aa': '',
    },
    'tb8gwqu5': {
      'en': 'Help Center',
      'aa': '',
    },
    'igkwrj2d': {
      'en': 'Privacy Policy',
      'aa': '',
    },
    '5lw9vu9l': {
      'en': 'Log Out',
      'aa': '',
    },
    'ct4rq5hx': {
      'en': 'Soomates',
      'aa': '',
    },
    'rv35f78s': {
      'en': 'Home',
      'aa': '',
    },
  },
  // Login
  {
    'yghkeolh': {
      'en': 'Meet new people from all over World.',
      'aa': '',
    },
    'ntx1p7a6': {
      'en': 'Chat with other singles and get to know them better.',
      'aa': '',
    },
    'y3qfv6m0': {
      'en': 'Get Started',
      'aa': '',
    },
    'l64m1arj': {
      'en': 'By signing in, your agreeing our',
      'aa': '',
    },
    'g80jlu4d': {
      'en': 'terms',
      'aa': '',
    },
    'gtlganvt': {
      'en': 'and',
      'aa': '',
    },
    'h32s4wjz': {
      'en': 'privacy policy',
      'aa': '',
    },
    'rmp024x4': {
      'en': 'Home',
      'aa': '',
    },
  },
  // User_Profile
  {
    '13km2bdu': {
      'en': 'Message',
      'aa': '',
    },
    'mxu5aexj': {
      'en': 'Message',
      'aa': '',
    },
    'vgj224bq': {
      'en': 'Full Name',
      'aa': '',
    },
    'fuwrha6t': {
      'en': 'Age',
      'aa': '',
    },
    '1v29tcxl': {
      'en': 'Gender',
      'aa': '',
    },
    'l7gvhns0': {
      'en': 'Job',
      'aa': '',
    },
    'rwicmhcq': {
      'en': 'Skin color',
      'aa': '',
    },
    'gylx52em': {
      'en': 'Married status',
      'aa': '',
    },
    '3m6ctzgc': {
      'en': 'Country',
      'aa': '',
    },
    'mjbf2cga': {
      'en': 'City',
      'aa': '',
    },
    'sglxnf0u': {
      'en': 'About Me',
      'aa': '',
    },
    'cwuksexy': {
      'en': 'Profile',
      'aa': '',
    },
    'abygf1q5': {
      'en': 'Home',
      'aa': '',
    },
  },
  // Message
  {
    'jxtmnjad': {
      'en': 'Message...',
      'aa': '',
    },
    'jc1xg04p': {
      'en': 'Home',
      'aa': '',
    },
  },
  // Form
  {
    'h1qd26l2': {
      'en': 'SELECT PICTURE',
      'aa': '',
    },
    'mdxn4xmm': {
      'en': 'Username...',
      'aa': '',
    },
    '719cjcyg': {
      'en': 'Country',
      'aa': '',
    },
    'ykmx6dau': {
      'en': 'Full Name',
      'aa': '',
    },
    'c29m5axq': {
      'en': '16',
      'aa': '',
    },
    '3fops4eh': {
      'en': '17',
      'aa': '',
    },
    'gm76kszg': {
      'en': '18',
      'aa': '',
    },
    '0spm4ta3': {
      'en': '19',
      'aa': '',
    },
    'j3nji066': {
      'en': '20',
      'aa': '',
    },
    'edvlugsx': {
      'en': '21',
      'aa': '',
    },
    'wrnlxutr': {
      'en': '22',
      'aa': '',
    },
    'gbndv9gn': {
      'en': '23',
      'aa': '',
    },
    'quu7b06a': {
      'en': '24',
      'aa': '',
    },
    'x3d3h1vn': {
      'en': '25',
      'aa': '',
    },
    'gpehbk0z': {
      'en': '26',
      'aa': '',
    },
    '1hvtyq4x': {
      'en': '27',
      'aa': '',
    },
    'xzrouqal': {
      'en': '28',
      'aa': '',
    },
    'sfax4h6s': {
      'en': '29',
      'aa': '',
    },
    'w0nv55gw': {
      'en': '30',
      'aa': '',
    },
    'zbpef5mx': {
      'en': '31',
      'aa': '',
    },
    'gd3w49l7': {
      'en': '32',
      'aa': '',
    },
    'fwtd2hyq': {
      'en': '33',
      'aa': '',
    },
    'ch2oslrb': {
      'en': '34',
      'aa': '',
    },
    'ahbb391j': {
      'en': '35',
      'aa': '',
    },
    'hs2q2gcx': {
      'en': '36',
      'aa': '',
    },
    '5ufkzjr4': {
      'en': '37',
      'aa': '',
    },
    '8i3xplf7': {
      'en': '38',
      'aa': '',
    },
    '6zcxckzg': {
      'en': '39',
      'aa': '',
    },
    'ichjj16z': {
      'en': '40',
      'aa': '',
    },
    'jgr4x695': {
      'en': '41',
      'aa': '',
    },
    '4i45g08j': {
      'en': '42',
      'aa': '',
    },
    'l4ryfcbe': {
      'en': '43',
      'aa': '',
    },
    '0epz2sow': {
      'en': '44',
      'aa': '',
    },
    '2yobqf02': {
      'en': '45',
      'aa': '',
    },
    'hmp7zs3a': {
      'en': '46',
      'aa': '',
    },
    'bagchqvf': {
      'en': '47',
      'aa': '',
    },
    'ln6p3gi2': {
      'en': '48',
      'aa': '',
    },
    'dgftn7m0': {
      'en': '49',
      'aa': '',
    },
    'dl8m3dnw': {
      'en': '50',
      'aa': '',
    },
    'vvdrulqb': {
      'en': '51',
      'aa': '',
    },
    '3xg8vr8f': {
      'en': 'Age',
      'aa': '',
    },
    'wq48ziwk': {
      'en': 'Search',
      'aa': '',
    },
    'c0w8oyaz': {
      'en': 'Lab (Rag)',
      'aa': '',
    },
    '0tddrc2g': {
      'en': 'Dheddig (Dumar)',
      'aa': '',
    },
    'x386kfen': {
      'en': 'Gender',
      'aa': '',
    },
    'eaj7gdf1': {
      'en': 'Wan shaqeya',
      'aa': '',
    },
    'sfltjmcn': {
      'en': 'Mashaqeyi',
      'aa': '',
    },
    'sxj1gdxj': {
      'en': 'Job',
      'aa': '',
    },
    'vd8tj1le': {
      'en': 'Cadan',
      'aa': '',
    },
    '285joo1h': {
      'en': 'Marin',
      'aa': '',
    },
    'r0m17ws8': {
      'en': 'Madow',
      'aa': '',
    },
    'q4x1nnb5': {
      'en': 'Skin color',
      'aa': '',
    },
    'zbvoc4x3': {
      'en': 'Single',
      'aa': '',
    },
    'fre7vpth': {
      'en': 'Divorced',
      'aa': '',
    },
    '71z6i5jc': {
      'en': 'Widowed',
      'aa': '',
    },
    'z7yict2m': {
      'en': 'Separated',
      'aa': '',
    },
    'vxys8391': {
      'en': 'Married Status',
      'aa': '',
    },
    'rzwaiol1': {
      'en': 'About me',
      'aa': '',
    },
    'szbcvyur': {
      'en': 'Username is required.',
      'aa': '',
    },
    '2ujl1pcp': {
      'en': 'Please choose an option from the dropdown',
      'aa': '',
    },
    'a4907i7h': {
      'en': 'Country is required.',
      'aa': '',
    },
    '581imetd': {
      'en': 'Please choose an option from the dropdown',
      'aa': '',
    },
    '7am0d75q': {
      'en': 'Name is required.',
      'aa': '',
    },
    '63014vie': {
      'en': 'Please choose an option from the dropdown',
      'aa': '',
    },
    '7yvuyji9': {
      'en': 'Field is required',
      'aa': '',
    },
    'pxi6gmvj': {
      'en': 'Please choose an option from the dropdown',
      'aa': '',
    },
    '2grizmef': {
      'en': 'Done',
      'aa': '',
    },
    'kh8o1k6d': {
      'en': 'Create Profile',
      'aa': '',
    },
    '3nd5gr0d': {
      'en': 'Home',
      'aa': '',
    },
  },
  // Update_Profile
  {
    'sulsr8n0': {
      'en': 'SELECT PICTURE',
      'aa': '',
    },
    'wavxj8wu': {
      'en': 'Username...',
      'aa': '',
    },
    '1suc30wh': {
      'en': 'Country',
      'aa': '',
    },
    'inzjodpa': {
      'en': 'Full Name',
      'aa': '',
    },
    '2ahu2wai': {
      'en': '16',
      'aa': '',
    },
    'o51nibld': {
      'en': '17',
      'aa': '',
    },
    'j61eplvr': {
      'en': '18',
      'aa': '',
    },
    '7bi4mzaa': {
      'en': '19',
      'aa': '',
    },
    'fc6co4hq': {
      'en': '20',
      'aa': '',
    },
    '6coz2j2e': {
      'en': '21',
      'aa': '',
    },
    '7f04cw9i': {
      'en': '22',
      'aa': '',
    },
    'rei9t5qk': {
      'en': '23',
      'aa': '',
    },
    'nl4f2e6h': {
      'en': '24',
      'aa': '',
    },
    'ru1xbo6j': {
      'en': '25',
      'aa': '',
    },
    'y2f1uzs2': {
      'en': '26',
      'aa': '',
    },
    '1d2hzhpe': {
      'en': '27',
      'aa': '',
    },
    '5357cmkx': {
      'en': '28',
      'aa': '',
    },
    '04w3xffh': {
      'en': '29',
      'aa': '',
    },
    '5iba19y6': {
      'en': '30',
      'aa': '',
    },
    '7krue2d9': {
      'en': '31',
      'aa': '',
    },
    'liozick2': {
      'en': '32',
      'aa': '',
    },
    '4kvu5337': {
      'en': '33',
      'aa': '',
    },
    'mg4hcocd': {
      'en': '34',
      'aa': '',
    },
    'ji7qsa4u': {
      'en': '35',
      'aa': '',
    },
    's493iz2h': {
      'en': '36',
      'aa': '',
    },
    'njsv8ow3': {
      'en': '37',
      'aa': '',
    },
    'odb2yu2k': {
      'en': '38',
      'aa': '',
    },
    'shdeftag': {
      'en': '39',
      'aa': '',
    },
    'jrold8t1': {
      'en': '40',
      'aa': '',
    },
    'in4fa0rw': {
      'en': '41',
      'aa': '',
    },
    'prmpthpc': {
      'en': '42',
      'aa': '',
    },
    'y9fk0bbm': {
      'en': '43',
      'aa': '',
    },
    'qroca1bv': {
      'en': '44',
      'aa': '',
    },
    'gudr79bd': {
      'en': '45',
      'aa': '',
    },
    '4vzuxtus': {
      'en': '46',
      'aa': '',
    },
    'e65ig8yd': {
      'en': '47',
      'aa': '',
    },
    'hd0hrcdb': {
      'en': '48',
      'aa': '',
    },
    'sxhfiplw': {
      'en': '49',
      'aa': '',
    },
    'nbjqee8f': {
      'en': '50',
      'aa': '',
    },
    'qkqbn9xk': {
      'en': '51',
      'aa': '',
    },
    '1wvw1fej': {
      'en': 'Age',
      'aa': '',
    },
    'cj8roffx': {
      'en': 'Search',
      'aa': '',
    },
    'uqw5ayq8': {
      'en': 'Lab (Rag)',
      'aa': '',
    },
    't9j8lzqe': {
      'en': 'Dheddig (Dumar)',
      'aa': '',
    },
    's4slxrjd': {
      'en': 'Gender',
      'aa': '',
    },
    'ew0seqv5': {
      'en': 'Wan shaqeya',
      'aa': '',
    },
    '335xmxzb': {
      'en': 'Mashaqeyi',
      'aa': '',
    },
    'bcwbknbp': {
      'en': 'Job',
      'aa': '',
    },
    '99i5m1d0': {
      'en': 'Cadan',
      'aa': '',
    },
    'yrpc8dgt': {
      'en': 'Marin',
      'aa': '',
    },
    'szqc54jr': {
      'en': 'Madow',
      'aa': '',
    },
    '849t86wo': {
      'en': 'Skin color',
      'aa': '',
    },
    'xvvp0tub': {
      'en': 'Single',
      'aa': '',
    },
    'ckr0owj7': {
      'en': 'Divorced',
      'aa': '',
    },
    'g8oygnvl': {
      'en': 'Widowed',
      'aa': '',
    },
    'mjymnosh': {
      'en': 'Separated',
      'aa': '',
    },
    '2bbe3ygr': {
      'en': 'Married Status',
      'aa': '',
    },
    'kejgiv4y': {
      'en': 'About me',
      'aa': '',
    },
    'jtu38jcc': {
      'en': 'Username is required.',
      'aa': '',
    },
    'cutq92oh': {
      'en': 'Please choose an option from the dropdown',
      'aa': '',
    },
    'mb1cz8nf': {
      'en': 'Last name is required.',
      'aa': '',
    },
    'km3k084q': {
      'en': 'Please choose an option from the dropdown',
      'aa': '',
    },
    'tyohkz4j': {
      'en': 'Name is required.',
      'aa': '',
    },
    'isv4ci4c': {
      'en': 'Please choose an option from the dropdown',
      'aa': '',
    },
    '1sa3acm1': {
      'en': 'Update',
      'aa': '',
    },
    'xgycr8ym': {
      'en': 'Update Profile',
      'aa': '',
    },
    '2virojh0': {
      'en': 'Home',
      'aa': '',
    },
  },
  // Privacy_Policy
  {
    '3801b8ck': {
      'en': 'Privacy Policy',
      'aa': '',
    },
    'fwa70133': {
      'en': '1. Introduction ',
      'aa': '',
    },
    'difgwzom': {
      'en':
          'Privacy Policy This privacy policy explains how Soomluv collects, uses, and protects your personal information.',
      'aa': '',
    },
    'b7l2wj86': {
      'en': '2. Information We Collect',
      'aa': '',
    },
    'drjxr3gx': {
      'en':
          'We may collect personal information such as your name, email, location, and other details to improve your user experience.',
      'aa': '',
    },
    '55k4stl1': {
      'en': '3. How We Use Your Information',
      'aa': '',
    },
    'xyapaa92': {
      'en':
          'Your information is used to personalize your experience, improve Soomluv, and send you relevant updates.',
      'aa': '',
    },
    'lxex32m4': {
      'en': '4. Security ',
      'aa': '',
    },
    '8ze3ipvh': {
      'en':
          ' We take appropriate measures to secure your personal information. However, no method of transmission over the internet is 100% secure.',
      'aa': '',
    },
    'ogzggrjc': {
      'en': '5. Changes to This Policy',
      'aa': '',
    },
    '9kb2xfmj': {
      'en':
          'We may update this privacy policy from time to time. You will be notified of any changes on this page.',
      'aa': '',
    },
    'ol3ndiiz': {
      'en': 'Contact Us',
      'aa': '',
    },
    'nc8qmy64': {
      'en':
          'If you have any questions about this privacy policy, please contact us at +252770601699',
      'aa': '',
    },
    'i59drywk': {
      'en': 'Home',
      'aa': '',
    },
  },
  // HelpCenter
  {
    'z4m2p0ff': {
      'en': 'How can we help you?',
      'aa': '',
    },
    'h40hmatw': {
      'en': 'WhatsApp Support',
      'aa': '',
    },
    'u7r2cxv1': {
      'en': 'Chat with our support team on WhatsApp for quick assistance.',
      'aa': '',
    },
    '040b1w20': {
      'en': 'Open WhatsApp',
      'aa': '',
    },
    'ueg57inh': {
      'en': 'Email Support',
      'aa': '',
    },
    'pjdwg0pt': {
      'en': 'Send us an email for more detailed inquiries or feedback.',
      'aa': '',
    },
    '4fp8cctp': {
      'en': 'Send Email',
      'aa': '',
    },
    'ijhs9161': {
      'en': 'Frequently Asked Questions',
      'aa': '',
    },
    '4wcz7y8b': {
      'en': 'How do I reset my password?',
      'aa': '',
    },
    'n0k1tl1v': {
      'en': 'How can I change my profile picture?',
      'aa': '',
    },
    'tu2zvjop': {
      'en': 'How do I report inappropriate behavior?',
      'aa': '',
    },
    'zzffd790': {
      'en': 'Can I undo a swipe?',
      'aa': '',
    },
    'nfpcxf8p': {
      'en': 'Help Center',
      'aa': '',
    },
    'ynurvbbn': {
      'en': 'Home',
      'aa': '',
    },
  },
  // Security
  {
    'ty9gcseu': {
      'en': 'Security',
      'aa': '',
    },
    '4z8kd6tt': {
      'en': 'Email Verification Status',
      'aa': '',
    },
    'zhl7ds69': {
      'en': 'Verified',
      'aa': '',
    },
    'qjxhlb0a': {
      'en': 'Unverified',
      'aa': '',
    },
    'tp2c7ttc': {
      'en': 'Show Online Status',
      'aa': '',
    },
    'y1w98yko': {
      'en': 'Allow Messages',
      'aa': '',
    },
    '3duv53h4': {
      'en': 'Show Last Seen',
      'aa': '',
    },
    'fkcme1z2': {
      'en': 'Privacy Options',
      'aa': '',
    },
    'm84tubbb': {
      'en': 'Profile Visibility',
      'aa': '',
    },
    'q368bdhz': {
      'en': 'Blocked Users',
      'aa': '',
    },
    'kcmg9nph': {
      'en': 'Message Filtering',
      'aa': '',
    },
    'b9yfx4ks': {
      'en': 'Account Security',
      'aa': '',
    },
    '2qmbh4wb': {
      'en': 'Change Email',
      'aa': '',
    },
    '300kqupg': {
      'en': 'Login Activity',
      'aa': '',
    },
    'ss8tnp7o': {
      'en': 'Linked Accounts',
      'aa': '',
    },
    'zvhotsug': {
      'en': 'Home',
      'aa': '',
    },
  },
  // Account_Settings
  {
    'h0uwbw9u': {
      'en': 'Page Title',
      'aa': '',
    },
    'seycb2o5': {
      'en': 'Profile Information',
      'aa': '',
    },
    '6mkkyfun': {
      'en': 'Full Name',
      'aa': '',
    },
    'tbotu3ud': {
      'en': 'Email',
      'aa': '',
    },
    'w6j40sqc': {
      'en': 'Phone Number',
      'aa': '',
    },
    '7t0h12zg': {
      'en': 'Account Preferences',
      'aa': '',
    },
    'hoct3ywf': {
      'en': 'Show me on Cupid',
      'aa': '',
    },
    'f1jnndh7': {
      'en': 'Enable notifications',
      'aa': '',
    },
    'p29cc161': {
      'en': 'Dark mode',
      'aa': '',
    },
    '8vu4jobt': {
      'en': 'Privacy Settings',
      'aa': '',
    },
    'icv19shu': {
      'en': 'Profile visibility',
      'aa': '',
    },
    'sfur4nqf': {
      'en': 'Public\" \\ \"Friends\" \\ \"Private',
      'aa': '',
    },
    '6nmfjpnq': {
      'en': 'Allow messaging from',
      'aa': '',
    },
    '39n1nwy4': {
      'en': 'Everyone\" \\ \"Matches\" \\ \"No one',
      'aa': '',
    },
    'jmmghu1n': {
      'en': 'Save Changes',
      'aa': '',
    },
    'klivl2ex': {
      'en': 'Home',
      'aa': '',
    },
  },
  // Account_Information
  {
    'prk1qrpm': {
      'en': 'Personal info',
      'aa': '',
    },
    'apzlmiwp': {
      'en': 'Full Name',
      'aa': '',
    },
    'kryfd5q2': {
      'en': 'Username',
      'aa': '',
    },
    'nkvqyval': {
      'en': 'Age',
      'aa': '',
    },
    'oilzqc9s': {
      'en': 'Gender',
      'aa': '',
    },
    'dx1h01pk': {
      'en': 'Job',
      'aa': '',
    },
    '08hrw8kg': {
      'en': 'Skin color',
      'aa': '',
    },
    'akrgzilf': {
      'en': 'Married status',
      'aa': '',
    },
    '6fiihvm4': {
      'en': 'Country',
      'aa': '',
    },
    'tj7wxd1q': {
      'en': 'City',
      'aa': '',
    },
    '4bgicccn': {
      'en': 'Account Information',
      'aa': '',
    },
    '7lzkv7ma': {
      'en': 'Home',
      'aa': '',
    },
  },
  // Check
  {
    '93j8kbl3': {
      'en': 'Home',
      'aa': '',
    },
  },
  // ProfileViews
  {
    'ckj0im9z': {
      'en': 'People who viewed your profile',
      'aa': '',
    },
    'usf4nron': {
      'en': 'Emma Johnson',
      'aa': '',
    },
    'u9mc9evc': {
      'en': 'United States',
      'aa': '',
    },
    'idu6g9ih': {
      'en': 'Liam Chen',
      'aa': '',
    },
    'x2kjvwzg': {
      'en': 'China',
      'aa': '',
    },
    'fronywlu': {
      'en': 'Page Title',
      'aa': '',
    },
    'sbm5d2g0': {
      'en': 'Home',
      'aa': '',
    },
  },
  // Blocked
  {
    'dr8ftaaz': {
      'en': 'People you\'ve blocked',
      'aa': '',
    },
    't735d33u': {
      'en': 'Unblock',
      'aa': '',
    },
    '8o8r2zfq': {
      'en': 'Blocked',
      'aa': '',
    },
    'g1vb37dh': {
      'en': 'Home',
      'aa': '',
    },
  },
  // All_Users
  {
    'ux9nvp5e': {
      'en': 'Page Title',
      'aa': '',
    },
    '5wrh9cpl': {
      'en': 'Home',
      'aa': '',
    },
  },
  // Live_Audio
  {
    'min5eifq': {
      'en': 'Home',
      'aa': '',
    },
  },
  // Users-NoProfile
  {
    'j6xwkhk9': {
      'en': 'No Profiles',
      'aa': '',
    },
    '0py1n1sl': {
      'en': 'Home',
      'aa': '',
    },
  },
  // Call_Join
  {
    'ttoyno93': {
      'en': 'Calafdon Live',
      'aa': '',
    },
    'bhhiqz8y': {
      'en': 'Join the live to connect with other Calafdon People',
      'aa': '',
    },
    'l8h4d4ms': {
      'en': 'Join Live',
      'aa': '',
    },
    'lcjeyf3h': {
      'en': 'Join Live',
      'aa': '',
    },
    'nwqs11ak': {
      'en': 'By joining, you agree to our Terms of Service',
      'aa': '',
    },
    'vpkqpzjz': {
      'en': 'Live Guidelines',
      'aa': '',
    },
    'eu3nhkwa': {
      'en': '1. Be respectful and courteous',
      'aa': '',
    },
    'nzufg3vw': {
      'en': '2. Ensure you\'re in a quiet environment',
      'aa': '',
    },
    'yk8i24qu': {
      'en': '3. Have fun and be yourself!',
      'aa': '',
    },
    '9gzq61zo': {
      'en': 'Live',
      'aa': '',
    },
    '69fj5fv6': {
      'en': 'Home',
      'aa': '',
    },
  },
  // Search
  {
    'blsy9504': {
      'en': 'Search',
      'aa': '',
    },
    'a03nz4wo': {
      'en': 'Enter username',
      'aa': '',
    },
    'eghpzk8s': {
      'en': 'Enter age',
      'aa': '',
    },
    '19k751mg': {
      'en': 'Search',
      'aa': '',
    },
    '7b4k9bte': {
      'en': 'Home',
      'aa': '',
    },
  },
  // Live_AudioCopy
  {
    'i4z2oxmw': {
      'en': 'Home',
      'aa': '',
    },
  },
  // User_Profile-Update
  {
    'b7aimgd9': {
      'en': 'Update\n',
      'aa': '',
    },
    'f2g2qhim': {
      'en': 'Profile',
      'aa': '',
    },
    'fxvgs1gx': {
      'en': 'Home',
      'aa': '',
    },
  },
  // HomePage
  {
    'poood59y': {
      'en': 'Explore',
      'aa': '',
    },
    '1giy2wio': {
      'en': 'Chat',
      'aa': '',
    },
    'qu94a8s5': {
      'en': 'Profile',
      'aa': '',
    },
    'ko5t9ugq': {
      'en': 'Edit Profile',
      'aa': '',
    },
    'i5w3egzd': {
      'en': 'Account Information',
      'aa': '',
    },
    'uwluuo5l': {
      'en': 'Security',
      'aa': '',
    },
    'dlex6wwg': {
      'en': 'Help Center',
      'aa': '',
    },
    '2uqsym08': {
      'en': 'Privacy Policy',
      'aa': '',
    },
    'nepdxyob': {
      'en': 'Log Out',
      'aa': '',
    },
    'umurlsl0': {
      'en': 'New Version Available',
      'aa': '',
    },
    'zsh8cw9m': {
      'en':
          'We\'ve added exciting new features and fixed some bugs. Please update to continue using the app.',
      'aa': '',
    },
    'y578yq0d': {
      'en': 'Update Now',
      'aa': '',
    },
    'baids9km': {
      'en': 'Alafdoon',
      'aa': '',
    },
    '06vzjxv5': {
      'en': 'Home',
      'aa': '',
    },
  },
  // Email_Change
  {
    'knmk75rs': {
      'en': 'Update your email address',
      'aa': '',
    },
    '8yk87oh0': {
      'en':
          'Enter your new email address below. We\'ll send a verification link to confirm the change.',
      'aa': '',
    },
    'ohf07foe': {
      'en': 'Current Email',
      'aa': '',
    },
    '087dyde7': {
      'en': 'New Email',
      'aa': '',
    },
    'xp07sxm8': {
      'en': 'Confirm New Email',
      'aa': '',
    },
    'ld5g1qpe': {
      'en': 'Update Email',
      'aa': '',
    },
    'ls20aqfh': {
      'en':
          'Note: Changing your email may require you to verify your account again.',
      'aa': '',
    },
    'cvg3bp0t': {
      'en': 'Email Update',
      'aa': '',
    },
    'haw6gzbb': {
      'en': 'Home',
      'aa': '',
    },
  },
  // Login_Email
  {
    'bwvo8i1n': {
      'en': 'Login to your account',
      'aa': '',
    },
    'dq63mgt8': {
      'en': 'Email',
      'aa': '',
    },
    'l7t7vaaf': {
      'en': 'Password',
      'aa': '',
    },
    '3nxco7ub': {
      'en': 'Sign In',
      'aa': '',
    },
    'zslzroph': {
      'en': 'Don’t  have account ? ',
      'aa': '',
    },
    '4gffayb5': {
      'en': 'Sign Up',
      'aa': '',
    },
    '63ha8utk': {
      'en': 'Home',
      'aa': '',
    },
  },
  // Create_Account
  {
    'ge9ka76u': {
      'en': 'Create account',
      'aa': '',
    },
    '3ibj5xf1': {
      'en': 'Email',
      'aa': '',
    },
    'cxxd0c0b': {
      'en': 'Password',
      'aa': '',
    },
    'ilhtbu6j': {
      'en': 'Password',
      'aa': '',
    },
    'i40w3mhg': {
      'en': 'Sign Up',
      'aa': '',
    },
    'h86y2lpj': {
      'en': 'i have account ? ',
      'aa': '',
    },
    'dvov2r4j': {
      'en': 'Sign In',
      'aa': '',
    },
    'xq1wk46p': {
      'en': 'Home',
      'aa': '',
    },
  },
  // Test
  {
    'lszfw363': {
      'en': 'Light',
      'aa': '',
    },
    'l5bp5anm': {
      'en': 'Dark',
      'aa': '',
    },
    'jj6028be': {
      'en': 'Language',
      'aa': '',
    },
    'u29rprt5': {
      'en': 'Af-Somali',
      'aa': '',
    },
    '85bmcuan': {
      'en': 'English',
      'aa': '',
    },
    'vlu7ocwg': {
      'en': 'Display',
      'aa': '',
    },
    'w5vtg8kh': {
      'en': 'Home',
      'aa': '',
    },
  },
  // Messages
  {
    'b7on9534': {
      'en': 'Chat',
      'aa': '',
    },
    '5axr0uws': {
      'en': 'Message...',
      'aa': '',
    },
    'f8s0ay9e': {
      'en': 'Send',
      'aa': '',
    },
  },
  // Email_Verify
  {
    'vlnpqmui': {
      'en': 'Verify Your Email',
      'aa': '',
    },
    'um3u9fk8': {
      'en': 'Didn\'t receive the email?',
      'aa': '',
    },
    't7xn5g8k': {
      'en':
          'Please check your spam folder if you don\'t see the email in your inbox.',
      'aa': '',
    },
  },
  // LogOut
  {
    'vij8w91f': {
      'en': 'Are you sure you want to log out?',
      'aa': '',
    },
    'bi3lmgdx': {
      'en': 'Log Out',
      'aa': '',
    },
  },
  // Report
  {
    'u8l3zcfi': {
      'en': 'Doro Sababta ad report u dhaheysid?',
      'aa': '',
    },
    '5hlfxpy1': {
      'en': 'Sawir anshax xumo u saran',
      'aa': '',
    },
    'rnfpug75': {
      'en': 'Magac xun ugu qoran',
      'aa': '',
    },
    'i7tv7fat': {
      'en': 'Sabab kle ban Report u dhahaya',
      'aa': '',
    },
    'ygbk6ywy': {
      'en': 'Inta ku qor sababta',
      'aa': '',
    },
    '011yu5fk': {
      'en': 'Type your message here...',
      'aa': '',
    },
    '2m2wv5r7': {
      'en': 'Submit Report',
      'aa': '',
    },
  },
  // Report_Done
  {
    'tl4ovidu': {
      'en': 'Thanks for reporting',
      'aa': '',
    },
  },
  // More
  {
    'uas9hzk2': {
      'en': 'Report',
      'aa': '',
    },
    'x2w493yh': {
      'en': 'Block',
      'aa': '',
    },
    '51i1hb6s': {
      'en': 'Unblock',
      'aa': '',
    },
  },
  // Miscellaneous
  {
    '7xnzkx31': {
      'en': 'Button',
      'aa': '',
    },
    'yfglmgmb': {
      'en': '',
      'aa': '',
    },
    '29r224mf': {
      'en': '',
      'aa': '',
    },
    'rxv37cag': {
      'en': 'j',
      'aa': '',
    },
    'b4ai7hvs': {
      'en': 'p',
      'aa': '',
    },
    'mdqxmh9z': {
      'en': 'o',
      'aa': '',
    },
    'swm1apdr': {
      'en': 'Please enable it',
      'aa': '',
    },
    'cjcy1ihh': {
      'en': '',
      'aa': '',
    },
    'jx57gt36': {
      'en': '',
      'aa': '',
    },
    'oh3ls5ij': {
      'en': '',
      'aa': '',
    },
    'ssh0nbou': {
      'en': '',
      'aa': '',
    },
    'uf99eevt': {
      'en': '',
      'aa': '',
    },
    'mnh8gx62': {
      'en': '',
      'aa': '',
    },
    '3h5w1sff': {
      'en': '',
      'aa': '',
    },
    '6qqzc2k0': {
      'en': '',
      'aa': '',
    },
    '6zmbb2l6': {
      'en': '',
      'aa': '',
    },
    'sayg6369': {
      'en': '',
      'aa': '',
    },
    '7bh6phk3': {
      'en': '',
      'aa': '',
    },
    'qa779h86': {
      'en': '',
      'aa': '',
    },
    'n22hfl7e': {
      'en': '',
      'aa': '',
    },
    'r35xgwfy': {
      'en': '',
      'aa': '',
    },
    'ayi5962e': {
      'en': '',
      'aa': '',
    },
    'kenycnmu': {
      'en': '',
      'aa': '',
    },
    'sc57ndvr': {
      'en': '',
      'aa': '',
    },
    'dfulk025': {
      'en': '',
      'aa': '',
    },
    'vpeqbxjt': {
      'en': '',
      'aa': '',
    },
    's4ebn6tr': {
      'en': '',
      'aa': '',
    },
    'scqn0ut2': {
      'en': '',
      'aa': '',
    },
    'xdakg80p': {
      'en': '',
      'aa': '',
    },
    'fjzmn1hi': {
      'en': '',
      'aa': '',
    },
    'yyg2m07m': {
      'en': '',
      'aa': '',
    },
    'w90ykgda': {
      'en': '',
      'aa': '',
    },
  },
].reduce((a, b) => a..addAll(b));
