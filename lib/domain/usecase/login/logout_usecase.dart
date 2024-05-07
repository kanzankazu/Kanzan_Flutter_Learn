import 'package:belajar_1/core/error/failure.dart';
import 'package:belajar_1/core/utils/generics/no_input.dart';
import 'package:belajar_1/core/utils/generics/usecase.dart';
import 'package:belajar_1/core/utils/multiple_result.dart';
import 'package:belajar_1/domain/repositories/login_repository.dart';

class LogoutUsecase extends UseCase<bool, NoInput> {
  LogoutUsecase({required this.loginRepository});

  final LoginRepository loginRepository;

  @override
  Future<Result<Failure, bool>> call(NoInput input) {
    return loginRepository.logout();
  }
}
