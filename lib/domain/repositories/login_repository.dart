import 'package:belajar_flutter/common/error/failure.dart';

import '../../common/utils/multiple_result.dart';

abstract class LoginRepository {
  Future<Result<Failure, (bool, String)>> login(String username, String password);

  Future<Result<Failure, bool>> logout();
}
