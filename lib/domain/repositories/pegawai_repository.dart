import '../../common/error/failure.dart';
import '../../common/utils/multiple_result.dart';
import '../entities/pegawai.dart';

abstract class PegawaiRepository {
  Future<Result<Failure, List<Pegawai>>> getList();

  Future<Result<Failure, Pegawai>> save(Pegawai poli);

  Future<Result<Failure, Pegawai>> edit(Pegawai poli, String id);

  Future<Result<Failure, Pegawai>> getById(String id);

  Future<Result<Failure, Pegawai>> delete(Pegawai poli);
}
