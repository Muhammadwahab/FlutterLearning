
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefSingleton {
  static final SharedPrefSingleton _instance = SharedPrefSingleton._internal();

  factory SharedPrefSingleton() => _instance;

  SharedPrefSingleton._internal();

  late SharedPreferences _pref;

  Future<void> initialize() async {
    _pref = await SharedPreferences.getInstance();
  }

  Future<bool> putString(String key, String data) => _pref.setString(key, data);

  Future<bool> putBool(String key, bool data) => _pref.setBool(key, data);

  Future<bool> putInt(String key, int data) => _pref.setInt(key, data);

  String? getString(String key) => _pref.getString(key);

  int? getInt(String key) => _pref.getInt(key);

  bool? getBool(String key) => _pref.getBool(key);
}
