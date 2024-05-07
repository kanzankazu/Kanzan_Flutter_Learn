import 'package:belajar_1/core/error/failure.dart';
import 'package:belajar_1/core/services/network/internet_info.dart';
import 'package:belajar_1/core/utils/multiple_result.dart';
import 'package:belajar_1/data/sources/server/pasien_source_impl.dart';
import 'package:belajar_1/domain/entities/pasien.dart';
import 'package:belajar_1/domain/repositories/pasien_repository.dart';

class PasienRepositoryImpl implements PasienRepository {
  PasienRepositoryImpl({required this.poliSource, required this.internetInfo});

  final PasienSource poliSource;
  final InternetInfo internetInfo;

  @override
  Future<Result<Failure, Pasien>> delete(Pasien poli) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Result<Failure, Pasien>> edit(Pasien poli, String id) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  Future<Result<Failure, Pasien>> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<Result<Failure, List<Pasien>>> getList() {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  Future<Result<Failure, Pasien>> save(Pasien poli) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
