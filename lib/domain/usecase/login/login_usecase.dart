import 'package:belajar_1/core/error/failure.dart';
import 'package:belajar_1/core/utils/generics/usecase.dart';
import 'package:belajar_1/core/utils/multiple_result.dart';
import 'package:belajar_1/domain/entities/request/login_request.dart';
import 'package:belajar_1/domain/repositories/login_repository.dart';

class LoginUseCase extends UseCase<(bool, String), LoginRequest> {
  LoginUseCase({required this.loginRepository});

  final LoginRepository loginRepository;

  @override
  Future<Result<Failure, (bool, String)>> call(LoginRequest input) {
    return loginRepository.login(input.username, input.password);
  }
}
