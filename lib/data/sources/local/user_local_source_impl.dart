import 'package:belajar_1/core/constants/shared_preferences_keys.dart';
import 'package:belajar_1/data/sources/local/user_local_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalSourceImpl implements UserLocalSource {
  @override
  Future setToken(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(SharedPreferencesKeys.token, value);
  }

  @override
  Future<String?> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(SharedPreferencesKeys.token);
  }

  @override
  Future setUserID(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(SharedPreferencesKeys.userId, value);
  }

  @override
  Future<String> getUserID() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(SharedPreferencesKeys.userId).toString();
  }

  @override
  Future setUsername(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(SharedPreferencesKeys.username, value);
  }

  @override
  Future<String> getUsername() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(SharedPreferencesKeys.username).toString();
  }

  @override
  Future<void> logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
