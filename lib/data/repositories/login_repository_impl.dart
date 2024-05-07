import 'package:belajar_1/core/error/failure.dart';
import 'package:belajar_1/core/utils/multiple_result.dart';
import 'package:belajar_1/data/sources/local/user_local_source.dart';
import 'package:belajar_1/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({required this.userLocalSource});

  final UserLocalSource userLocalSource;

  @override
  Future<Result<Failure, (bool, String)>> login(String username, String password) async {
    bool isLogin = false;
    String errorMessage = "";
    if (username == 'admin' && password == 'admin') {
      await userLocalSource.setToken("admin");
      await userLocalSource.setUserID("1");
      await userLocalSource.setUsername("admin");
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
    return Success((isLogin, errorMessage));
  }

  @override
  Future<Result<Failure, bool>> logout() async {
    await userLocalSource.logout();
    return const Success(true);
  }
}
