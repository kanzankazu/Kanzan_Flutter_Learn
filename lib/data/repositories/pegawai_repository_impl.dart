import 'package:belajar_flutter/core/error/failure.dart';
import 'package:belajar_flutter/core/services/network/internet_info.dart';
import 'package:belajar_flutter/core/utils/multiple_result.dart';
import 'package:belajar_flutter/data/sources/server/pegawai_source_impl.dart';
import 'package:belajar_flutter/domain/entities/pegawai.dart';
import 'package:belajar_flutter/domain/repositories/pegawai_repository.dart';

class PegawaiRepositoryImpl implements PegawaiRepository {
  PegawaiRepositoryImpl({required this.poliSource, required this.internetInfo});

  final PegawaiSource poliSource;
  final InternetInfo internetInfo;

  @override
  Future<Result<Failure, Pegawai>> delete(Pegawai poli) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Result<Failure, Pegawai>> edit(Pegawai poli, String id) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  Future<Result<Failure, Pegawai>> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<Result<Failure, List<Pegawai>>> getList() {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  Future<Result<Failure, Pegawai>> save(Pegawai poli) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
