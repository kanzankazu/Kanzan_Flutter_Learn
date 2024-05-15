import '../../common/error/failure.dart';
import '../../common/utils/multiple_result.dart';
import '../entities/poli.dart';

abstract class PoliRepository {
  Future<Result<Failure, List<Poli>>> getList();

  Future<Result<Failure, Poli>> save(Poli poli);

  Future<Result<Failure, Poli>> edit(Poli poli, String id);

  Future<Result<Failure, Poli>> getById(String id);

  Future<Result<Failure, Poli>> delete(String id);
}
