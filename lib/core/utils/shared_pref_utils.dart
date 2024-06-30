import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  final SharedPreferences? _prefs;
  static SharedPreferencesUtils? _instance;

  static const String kUserSaved = 'kUserSaved';

  SharedPreferencesUtils._(this._prefs);

  static Future<SharedPreferencesUtils> getInstance() async {
    _instance ??=
        SharedPreferencesUtils._(await SharedPreferences.getInstance());
    return _instance!;
  }

  setBool(String key, bool value) {
    _prefs?.setBool(key, value);
  }

  bool? getBool(String key) => _prefs?.getBool(key);

  setString(String key, String value) {
    _prefs?.setString(key, value);
  }

  String? getString(String key) => _prefs?.getString(key);

  removeString(String key) => _prefs!.remove(key);

  setInt(String key, int value) {
    _prefs?.setInt(key, value);
  }

  int? getInt(String key) => _prefs?.getInt(key);

  removeUserData() {
    _prefs!.clear();
    _prefs.remove(kUserSaved);
  }

  setDouble(String key, double value) {
    _prefs?.setDouble(key, value);
  }
  double? getDouble(String key) => _prefs?.getDouble(key);
}
