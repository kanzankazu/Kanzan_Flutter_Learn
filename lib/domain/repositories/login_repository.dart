import 'package:belajar_1/core/error/failure.dart';
import 'package:belajar_1/core/utils/multiple_result.dart';

abstract class LoginRepository {
  Future<Result<Failure, (bool, String)>> login(String username, String password);

  Future<Result<Failure, bool>> logout();
}
