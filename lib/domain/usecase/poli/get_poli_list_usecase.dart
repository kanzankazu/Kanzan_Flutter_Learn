import 'package:belajar_1/core/error/failure.dart';
import 'package:belajar_1/core/utils/generics/no_input.dart';
import 'package:belajar_1/core/utils/generics/usecase.dart';
import 'package:belajar_1/core/utils/multiple_result.dart';
import 'package:belajar_1/domain/entities/poli.dart';
import 'package:belajar_1/domain/repositories/poli_repository.dart';

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
