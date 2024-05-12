import '../../../common/error/failure.dart';
import '../../../common/utils/generics/usecase.dart';
import '../../../common/utils/multiple_result.dart';
import '../../entities/poli.dart';
import '../../repositories/poli_repository.dart';

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
