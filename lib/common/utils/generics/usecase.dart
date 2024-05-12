import 'package:belajar_flutter/common/error/failure.dart';
import 'package:belajar_flutter/common/utils/multiple_result.dart';

abstract class UseCase<Output, Input> {
  Future<Result<Failure, Output?>> call(Input input);
}
