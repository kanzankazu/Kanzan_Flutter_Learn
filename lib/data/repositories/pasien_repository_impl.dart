import 'package:belajar_flutter/core/error/failure.dart';
import 'package:belajar_flutter/core/services/network/internet_info.dart';
import 'package:belajar_flutter/core/utils/multiple_result.dart';
import 'package:belajar_flutter/data/sources/server/pasien_source_impl.dart';
import 'package:belajar_flutter/domain/entities/pasien.dart';
import 'package:belajar_flutter/domain/repositories/pasien_repository.dart';

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
