import 'package:belajar_1/core/error/failure.dart';
import 'package:belajar_1/core/utils/multiple_result.dart';
import 'package:belajar_1/domain/entities/pasien.dart';

abstract class PasienRepository {
  Future<Result<Failure, List<Pasien>>> getList();

  Future<Result<Failure, Pasien>> save(Pasien poli);

  Future<Result<Failure, Pasien>> edit(Pasien poli, String id);

  Future<Result<Failure, Pasien>> getById(String id);

  Future<Result<Failure, Pasien>> delete(Pasien poli);
}
