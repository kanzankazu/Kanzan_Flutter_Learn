import 'package:belajar_flutter/core/error/failure.dart';
import 'package:belajar_flutter/core/utils/multiple_result.dart';

abstract class LoginRepository {
  Future<Result<Failure, (bool, String)>> login(String username, String password);

  Future<Result<Failure, bool>> logout();
}
