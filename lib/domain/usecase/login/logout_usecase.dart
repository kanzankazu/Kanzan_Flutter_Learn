import 'package:belajar_flutter/domain/repositories/login_repository.dart';

import '../../../common/error/failure.dart';
import '../../../common/utils/generics/no_input.dart';
import '../../../common/utils/generics/usecase.dart';
import '../../../common/utils/multiple_result.dart';

class LogoutUsecase extends UseCase<bool, NoInput> {
  LogoutUsecase({required this.loginRepository});

  final LoginRepository loginRepository;

  @override
  Future<Result<Failure, bool>> call(NoInput input) {
    return loginRepository.logout();
  }
}
