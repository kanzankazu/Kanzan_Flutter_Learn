import 'package:belajar_flutter/domain/entities/poli.dart';
import 'package:belajar_flutter/domain/repositories/poli_repository.dart';

import '../../../common/error/failure.dart';
import '../../../common/utils/generics/usecase.dart';
import '../../../common/utils/multiple_result.dart';

class SavePoliUseCase implements UseCase<Poli, Poli> {
  final PoliRepository repository;

  SavePoliUseCase({
    required this.repository,
  });

  @override
  Future<Result<Failure, Poli>> call(Poli poli) {
    return repository.save(poli);
  }
}
