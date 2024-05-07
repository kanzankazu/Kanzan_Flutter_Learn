import 'package:belajar_1/core/error/failure.dart';
import 'package:belajar_1/core/utils/multiple_result.dart';
import 'package:belajar_1/domain/entities/poli.dart';

abstract class PoliRepository {
  Future<Result<Failure, List<Poli>>> getList();

  Future<Result<Failure, Poli>> save(Poli poli);

  Future<Result<Failure, Poli>> edit(Poli poli, String id);

  Future<Result<Failure, Poli>> getById(String id);

  Future<Result<Failure, Poli>> delete(Poli poli);
}
