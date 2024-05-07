import 'package:belajar_1/core/error/failure.dart';
import 'package:belajar_1/core/utils/multiple_result.dart';

abstract class UseCase<Output, Input> {
  Future<Result<Failure, Output?>> call(Input input);
}
