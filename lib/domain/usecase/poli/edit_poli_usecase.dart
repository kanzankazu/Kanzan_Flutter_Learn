import 'package:belajar_1/core/error/failure.dart';
import 'package:belajar_1/core/utils/generics/usecase.dart';
import 'package:belajar_1/core/utils/multiple_result.dart';
import 'package:belajar_1/domain/entities/poli.dart';
import 'package:belajar_1/domain/repositories/poli_repository.dart';

class EditPoliUseCase implements UseCase<Poli, Poli> {
  final PoliRepository repository;

  EditPoliUseCase({
    required this.repository,
  });

  @override
  Future<Result<Failure, Poli>> call(Poli poli) {
    return repository.edit(poli, poli.id ?? "");
  }
}
