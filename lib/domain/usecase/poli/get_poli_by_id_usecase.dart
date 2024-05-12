import 'package:belajar_flutter/domain/entities/poli.dart';
import 'package:belajar_flutter/domain/repositories/poli_repository.dart';

import '../../../common/error/failure.dart';
import '../../../common/utils/generics/usecase.dart';
import '../../../common/utils/multiple_result.dart';

class GetByIdPoliUseCase implements UseCase<Poli, String> {
  final PoliRepository repository;

  GetByIdPoliUseCase({
    required this.repository,
  });

  @override
  Future<Result<Failure, Poli>> call(String id) {
    return repository.getById(id);
  }
}
