import 'package:belajar_1/core/error/exceptions.dart';
import 'package:belajar_1/core/error/failure.dart';
import 'package:belajar_1/core/services/network/internet_info.dart';
import 'package:belajar_1/core/utils/multiple_result.dart';
import 'package:belajar_1/data/sources/server/poli_source_impl.dart';
import 'package:belajar_1/domain/entities/poli.dart';
import 'package:belajar_1/domain/repositories/poli_repository.dart';

class PoliRepositoryImpl implements PoliRepository {
  PoliRepositoryImpl({required this.poliSource, required this.internetInfo});

  final PoliSource poliSource;
  final InternetInfo internetInfo;

  @override
  Future<Result<Failure, List<Poli>>> getList() async {
    try {
      if (await internetInfo.hasConnection()) {
        var result = poliSource.getList();
        return Success(result as List<Poli>);
      } else {
        return Error(NotConnectedFailure());
      }
    } on ServerException {
      return Error(ServerFailure());
    }
  }

  @override
  Future<Result<Failure, Poli>> getById(String id) async {
    try {
      if (await internetInfo.hasConnection()) {
        var result = poliSource.getById(id);
        return Success(result as Poli);
      } else {
        return Error(NotConnectedFailure());
      }
    } on ServerException {
      return Error(ServerFailure());
    }
  }

  @override
  Future<Result<Failure, Poli>> save(Poli poli) async {
    try {
      if (await internetInfo.hasConnection()) {
        var result = poliSource.getList();
        return Success(result as Poli);
      } else {
        return Error(NotConnectedFailure());
      }
    } on ServerException {
      return Error(ServerFailure());
    }
  }

  @override
  Future<Result<Failure, Poli>> edit(Poli poli, String id) async {
    try {
      if (await internetInfo.hasConnection()) {
        var result = poliSource.getList();
        return Success(result as Poli);
      } else {
        return Error(NotConnectedFailure());
      }
    } on ServerException {
      return Error(ServerFailure());
    }
  }

  @override
  Future<Result<Failure, Poli>> delete(Poli poli) async {
    try {
      if (await internetInfo.hasConnection()) {
        var result = poliSource.getList();
        return Success(result as Poli);
      } else {
        return Error(NotConnectedFailure());
      }
    } on ServerException {
      return Error(ServerFailure());
    }
  }
}
