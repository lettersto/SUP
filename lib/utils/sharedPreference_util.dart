import 'package:shared_preferences/shared_preferences.dart';

void updateRecents(String text) async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.getStringList('recents') == null) {
    prefs.setStringList('recents', <String>[text]);
  } else {
    List<String>? recents = prefs.getStringList('recents');
    if (!recents!.contains(text)) {
      recents?.add(text);
      if (recents.length == 20) {
        recents.removeAt(0);
      }
    } else {
      recents.remove(text);
      recents.add(text);
    }
    prefs.setStringList('recents', recents);
  }
}