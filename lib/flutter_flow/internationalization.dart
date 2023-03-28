import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ko', 'en'];

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
    String? koText = '',
    String? enText = '',
  }) =>
      [koText, enText][languageIndex] ?? '';

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
  // login_page
  {
    'pm6ki5rz': {
      'ko': 'Welcome\nSpeaking Fridge',
      'en': 'Welcome\nSpeaking Fridge',
    },
    '454luxgn': {
      'ko': '네이버로 시작하기',
      'en': 'Log in with Naver',
    },
    'y6slotsp': {
      'ko': 'Sign in with Google',
      'en': '',
    },
    'pox4w10a': {
      'ko': '',
      'en': 'Home',
    },
  },
  // setting_page
  {
    '5vrrqdyu': {
      'ko': 'Sunny Lee',
      'en': 'Sunny Lee',
    },
    'sdob8fvj': {
      'ko': 'dev.sunnylee@gmail.com',
      'en': 'dev.sunnylee@gmail.com',
    },
    '4r8bn134': {
      'ko': '계정 정보',
      'en': 'Account',
    },
    'hli8hou5': {
      'ko': '냉장고 친구 관리',
      'en': 'Invite Friends',
    },
    'srj0jvqk': {
      'ko': '알림 설정',
      'en': 'Notification Settings',
    },
    'hktowb4m': {
      'ko': '이름 변경하기',
      'en': 'Edit name',
    },
    'cib2z0wl': {
      'ko': '일반',
      'en': 'General',
    },
    'lmrz0ira': {
      'ko': '서비스 이용 규정',
      'en': 'Terms of Service',
    },
    'tuibyyjw': {
      'ko': '지원하기',
      'en': 'Support',
    },
    'p9u0u32a': {
      'ko': '설정',
      'en': 'Profile',
    },
    '0m554xru': {
      'ko': 'Home',
      'en': '',
    },
  },
  // wasted_page
  {
    'lpyok49o': {
      'ko': '달 별 통계',
      'en': '',
    },
    '5ugb2c63': {
      'ko': '1월',
      'en': '',
    },
    '5ews9mm8': {
      'ko': '2월',
      'en': '',
    },
    'ivhvif1b': {
      'ko': '3월',
      'en': '',
    },
    'nj6zryia': {
      'ko': '4월',
      'en': '',
    },
    'jwzie8n0': {
      'ko': '5월',
      'en': '',
    },
    'x8lmyu3k': {
      'ko': '이번 달 정산',
      'en': '',
    },
    'e8hn070p': {
      'ko': '300L',
      'en': '',
    },
    'z9his4vx': {
      'ko': 'Total Wasted',
      'en': '',
    },
    '6f2dyad8': {
      'ko': '22kg',
      'en': '',
    },
    'twn82rvi': {
      'ko': 'saved',
      'en': '',
    },
    'd1sobam6': {
      'ko': '759',
      'en': '',
    },
    '5rzxm3ol': {
      'ko': 'Days for saving',
      'en': '',
    },
    'bm3020sg': {
      'ko': '22',
      'en': '',
    },
    'wmqpsxr1': {
      'ko': 'Friends with you',
      'en': '',
    },
    'p89u8wla': {
      'ko': '식재료 영수증',
      'en': '',
    },
    'ctpsjpk4': {
      'ko': 'Home',
      'en': '',
    },
  },
  // main_page
  {
    'zyxqjtj7': {
      'ko': 'My Fridge',
      'en': '',
    },
    'wrf02hz9': {
      'ko': 'replace with dividers_small_big',
      'en': '',
    },
    'qsjh4o40': {
      'ko': 'Home',
      'en': '',
    },
  },
  // invite_user_page
  {
    '1disvnh2': {
      'ko': '등록하지 않은 친구에게는 요청을 보낼 수 없습니다. 정확한 메일 주소를 입력해주세요. ',
      'en': '',
    },
    'vo1s8iyo': {
      'ko': '친구 이메일 ',
      'en': '',
    },
    '49a268da': {
      'ko': '예) speakingFridge@gmail.com',
      'en': '',
    },
    'aygm9ohj': {
      'ko': '등록',
      'en': '',
    },
    'vv61jrjx': {
      'ko': '돌아가기',
      'en': '',
    },
    '80in378o': {
      'ko': '친구 등록하기',
      'en': '',
    },
    'ipbtkis1': {
      'ko': 'Home',
      'en': '',
    },
  },
  // edit_profile_page
  {
    '29oocmkk': {
      'ko': '나의 이름',
      'en': 'Your Name',
    },
    '9jjli7gm': {
      'ko': '',
      'en': '',
    },
    'c9psjzgd': {
      'ko': '수정하기',
      'en': 'Confirm',
    },
    'md12e3oq': {
      'ko': '돌아가기',
      'en': '',
    },
    'e3v2tku0': {
      'ko': '이름 수정하기',
      'en': 'Edit name',
    },
  },
  // Fridge_collection
  {
    'lzxnql5s': {
      'ko': '냉장고를 선택해 친구를 추가하세요',
      'en': '',
    },
    'yz50azon': {
      'ko': '개인',
      'en': '',
    },
    'uzny9ybu': {
      'ko': '삭제',
      'en': '',
    },
    'b2m3t6fj': {
      'ko': '룸메이트',
      'en': '',
    },
    '5lmknm9p': {
      'ko': '삭제',
      'en': '',
    },
    'wgmwelun': {
      'ko': '동네 친구들',
      'en': '',
    },
    '6e384sf1': {
      'ko': '탈퇴',
      'en': '',
    },
    'wtsjjlzu': {
      'ko': '가족',
      'en': '',
    },
    'mdgr6g1t': {
      'ko': '탈퇴',
      'en': '',
    },
    'z8tv0p5b': {
      'ko': '다른 냉장고 등록',
      'en': 'register another refrigerator',
    },
    '29i70wao': {
      'ko': '냉장고 친구 관리',
      'en': '',
    },
    'yqu2ep96': {
      'ko': 'Home',
      'en': '',
    },
  },
  // change_fridge_page
  {
    'l0o79yv6': {
      'ko': '4',
      'en': '',
    },
    '1a1ux72d': {
      'ko': '냉장고',
      'en': 'fridge',
    },
    'jhkhmgqa': {
      'ko': '개인',
      'en': '',
    },
    'ld88zbek': {
      'ko': '현재 표시 중',
      'en': '',
    },
    '831pxij7': {
      'ko': '룸메이트',
      'en': '',
    },
    '1i9oublk': {
      'ko': '-',
      'en': '',
    },
    'aahq2t0z': {
      'ko': '동네 친구들',
      'en': '',
    },
    'agyayqvb': {
      'ko': '-',
      'en': '',
    },
    'yraznjtp': {
      'ko': '가족',
      'en': '',
    },
    '0gbmh972': {
      'ko': '-',
      'en': '',
    },
    'f981pgss': {
      'ko': '다른 냉장고 등록',
      'en': 'register another refrigerator',
    },
    'i96lsd1k': {
      'ko': '이용 가능한 냉장고',
      'en': '',
    },
    'in9urccf': {
      'ko': 'Home',
      'en': '',
    },
  },
  // Create_fridge_page
  {
    'q9vwqph3': {
      'ko': '뒤로 가기',
      'en': 'Back',
    },
    '5k7c4vr4': {
      'ko': '냉장고 만들기',
      'en': 'Create Fridge',
    },
    'qc84eljt': {
      'ko': '냉장고를 만들고 친구를 추가해 보세요!',
      'en': '',
    },
    'jvta6hkl': {
      'ko': '냉장고 이름',
      'en': '',
    },
    'sk31f2h9': {
      'ko': 'Ex) 동네 친구들',
      'en': '',
    },
    '9h9o51ds': {
      'ko': '등록',
      'en': 'Confirm',
    },
    'jj72c4ux': {
      'ko': 'Home',
      'en': '',
    },
  },
  // fridge_friend_page
  {
    '61er8tsf': {
      'ko': '{냉장고 이름} 멤버',
      'en': '',
    },
    '6sldi00d': {
      'ko': 'user@domainname.com',
      'en': '',
    },
    'b8lb2asd': {
      'ko': 'user@domainname.com',
      'en': '',
    },
    'mrebr9vw': {
      'ko': 'user@domainname.com',
      'en': '',
    },
    'cdgwuwrd': {
      'ko': 'user@domainname.com',
      'en': '',
    },
    'yx48ybh8': {
      'ko': 'user@domainname.com',
      'en': '',
    },
    'e9sbsmhm': {
      'ko': '냉장고 친구 등록하기',
      'en': '',
    },
    'm9a8e2vq': {
      'ko': 'Home',
      'en': '',
    },
  },
  // fridge_list_component
  {
    '1vtq97ls': {
      'ko': '배고프기때문에삼겹살100g',
      'en': '',
    },
    'nlr9ltx6': {
      'ko': 'D-3',
      'en': '',
    },
  },
  // setting_option
  {
    'xn5dlti9': {
      'ko': '냉장고 관리',
      'en': 'Change Friges',
    },
  },
  // invite_user_warning_dialog
  {
    'qb0x3ucz': {
      'ko': '친구를 찾을 수 없습니다!',
      'en': '',
    },
    'qmoq4aij': {
      'ko': '서비스에 등록하지 않은 친구는 추가가 불가능합니다. \n친구에게 함께하자고 말해보는 건 어떨까요?',
      'en': '',
    },
    'bm7gnhmh': {
      'ko': '확인',
      'en': '',
    },
  },
  // delete_opt_dialog
  {
    'gddh9mij': {
      'ko': '다 드셨나요?',
      'en': 'Did you consume all?',
    },
    '2ksqer5l': {
      'ko': '먹을 수 없어서 버리는 것은 폐기, \n먹어서 없어진 것은 소비 입니다. ',
      'en': 'If you not ',
    },
    'xy9rr0cs': {
      'ko': '폐기해요',
      'en': '',
    },
    'vo8u50sn': {
      'ko': '소비했어요',
      'en': '',
    },
  },
  // change_fridge_dialog
  {
    'ncv3nadc': {
      'ko': '냉장고를 바꾸시겠습니까?',
      'en': 'Did you consume all?',
    },
    'penpn2gi': {
      'ko': '냉장고 내 식재료 등의 정보가 변경됩니다.',
      'en': 'If you not ',
    },
    'wjy0r833': {
      'ko': '취소',
      'en': '',
    },
    'uw1ipgpw': {
      'ko': '확인',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '7o77twhl': {
      'ko': '카메라 접근을 허용하시겠습니까?',
      'en': 'Would like to access your Camera',
    },
    'uvr41yl5': {
      'ko': '사진 라이브러리 접근을 허용하시겠습니까?',
      'en': 'Would like to access your photos',
    },
  },
].reduce((a, b) => a..addAll(b));
