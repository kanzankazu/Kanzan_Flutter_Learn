import 'package:belajar_flutter/core/error/failure.dart';
import 'package:belajar_flutter/core/utils/multiple_result.dart';

abstract class UseCase<Output, Input> {
  Future<Result<Failure, Output?>> call(Input input);
}
