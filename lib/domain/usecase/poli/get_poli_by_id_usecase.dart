import 'package:belajar_flutter/core/error/failure.dart';
import 'package:belajar_flutter/core/utils/generics/usecase.dart';
import 'package:belajar_flutter/core/utils/multiple_result.dart';
import 'package:belajar_flutter/domain/entities/poli.dart';
import 'package:belajar_flutter/domain/repositories/poli_repository.dart';

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
