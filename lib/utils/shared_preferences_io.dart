import 'package:introduce_e1if/utils/data_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesIO implements IO {
  late Future<SharedPreferences> pref;

  SharedPreferencesIO() {
    pref = SharedPreferences.getInstance();
  }

  @override
  Future<String?> load() {
    return pref.then((pref) => pref.getString('comments'));
  }

  @override
  Future<void> save(String payload) async {
    pref.then((pref) => pref.setString('comments', payload));
  }
}
