import 'package:flutter_exercises/202/cache/shared_not_initialize.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys {
  counter,
  users
}

class SharedManager {
  SharedPreferences? prefs;

  SharedManager();

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void _checkPreferences() {
    if (prefs == null) {
      throw SharedNotInitializeException();
    }
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkPreferences();
    await prefs?.setString(key.name, value);
  }

  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    _checkPreferences();
    await prefs?.setStringList(key.name, value);
  }

  List<String>? getStrings(SharedKeys key) {
    _checkPreferences();
    return prefs?.getStringList(key.name);
  }

  String? getString(SharedKeys key) {
    _checkPreferences();
    return prefs?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    _checkPreferences();
    return (await prefs?.remove(key.name) ?? false);
  }
}