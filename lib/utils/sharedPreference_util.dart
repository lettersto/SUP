import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtil {
  static SharedPreferences? _sharedPrefs;

  factory SharedPreferenceUtil() => SharedPreferenceUtil._internal();

  SharedPreferenceUtil._internal();

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  int get userNo => _sharedPrefs!.getInt('userNo') ?? 0;

  String get nickname => _sharedPrefs!.getString('nickname') ?? "";

  List<String> get recents => _sharedPrefs!.getStringList('recents') ?? [];

  set userNo(int userNo) {
    _sharedPrefs!.setInt('userNo', userNo);
  }

  set nickname(String nickname) {
    _sharedPrefs!.setString('nickname', nickname);
  }

  set recents(List<String> newRecents) {
    _sharedPrefs!.setStringList('recents', newRecents);
  }
}

void updateRecents(String text) async {
  List<String> recents = SharedPreferenceUtil().recents;
  if (!recents.contains(text)) {
    recents.add(text);
    if (recents.length == 20) {
      recents.removeAt(0);
    }
  } else {
    recents.remove(text);
    recents.add(text);
  }

  SharedPreferenceUtil().recents = recents;
}
