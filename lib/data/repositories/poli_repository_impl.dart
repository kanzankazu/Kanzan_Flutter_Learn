import 'package:belajar_flutter/common/error/exceptions.dart';
import 'package:belajar_flutter/common/error/failure.dart';
import 'package:belajar_flutter/common/services/network/internet_info.dart';
import 'package:belajar_flutter/common/utils/multiple_result.dart';
import 'package:belajar_flutter/data/sources/server/poli_source_impl.dart';
import 'package:belajar_flutter/domain/entities/poli.dart';
import 'package:belajar_flutter/domain/repositories/poli_repository.dart';

class PoliRepositoryImpl implements PoliRepository {
  PoliRepositoryImpl({required this.poliSource, required this.internetInfo});

  final PoliSource poliSource;
  final InternetInfo internetInfo;

  @override
  Future<Result<Failure, List<Poli>>> getList() async {
    try {
      if (await internetInfo.hasConnection()) {
        final result = await poliSource.getList();
        return Success(result);
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
        final result = await poliSource.getById(id);
        return Success(result);
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
        final result = await poliSource.save(poli);
        return Success(result);
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
        final result = await poliSource.edit(poli, id);
        return Success(result);
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
        final result = await poliSource.delete(poli);
        return Success(result);
      } else {
        return Error(NotConnectedFailure());
      }
    } on ServerException {
      return Error(ServerFailure());
    }
  }
}
