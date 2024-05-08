import 'package:belajar_flutter/helper/user_info.dart';

class LoginService {
  Future<(bool, String)> login(String username, String password) async {
    bool isLogin = false;
    String errorMessage = "";
    if (username == 'admin' && password == 'admin') {
      await UserInfo().setToken("admin");
      await UserInfo().setUserID("1");
      await UserInfo().setUsername("admin");
      errorMessage = "";
      isLogin = true;
    } else if (username.isEmpty && password.isEmpty) {
      errorMessage = "Username dan Password kosong";
      isLogin = false;
    } else if (username.isEmpty || password.isEmpty) {
      errorMessage = "Username atau Password ada yang kosong";
      isLogin = false;
    } else {
      errorMessage = "Username atau Password Tidak Valid";
      isLogin = false;
    }
    return (isLogin, errorMessage);
  }

  Future<bool> logout() async {
    await UserInfo().logout();
    return true;
  }
}
