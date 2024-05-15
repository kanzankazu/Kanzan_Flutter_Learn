import 'package:belajar_flutter/domain/entities/poli.dart';
import 'package:belajar_flutter/domain/repositories/poli_repository.dart';

import '../../../common/error/failure.dart';
import '../../../common/utils/generics/usecase.dart';
import '../../../common/utils/multiple_result.dart';

class DeletePoliUseCase implements UseCase<Poli, String> {
  final PoliRepository repository;

  DeletePoliUseCase({
    required this.repository,
  });

  @override
  Future<Result<Failure, Poli>> call(String id) {
    return repository.delete(id);
  }
}
