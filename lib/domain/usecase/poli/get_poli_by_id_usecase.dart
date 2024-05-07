import 'package:belajar_1/core/error/failure.dart';
import 'package:belajar_1/core/utils/generics/usecase.dart';
import 'package:belajar_1/core/utils/multiple_result.dart';
import 'package:belajar_1/domain/entities/poli.dart';
import 'package:belajar_1/domain/repositories/poli_repository.dart';

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
