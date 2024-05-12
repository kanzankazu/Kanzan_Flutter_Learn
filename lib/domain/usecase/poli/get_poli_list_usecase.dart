import 'package:belajar_flutter/domain/entities/poli.dart';
import 'package:belajar_flutter/domain/repositories/poli_repository.dart';

import '../../../common/error/failure.dart';
import '../../../common/utils/generics/no_input.dart';
import '../../../common/utils/generics/usecase.dart';
import '../../../common/utils/multiple_result.dart';

class GetListPoliUseCase implements UseCase<List<Poli>, NoInput> {
  final PoliRepository repository;

  GetListPoliUseCase({
    required this.repository,
  });

  @override
  Future<Result<Failure, List<Poli>>> call(NoInput input) {
    return repository.getList();
  }
}
