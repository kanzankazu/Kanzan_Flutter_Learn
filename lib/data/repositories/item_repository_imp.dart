import 'package:belajar_1/core/error/exceptions.dart';
import 'package:belajar_1/core/error/failure.dart';
import 'package:belajar_1/core/services/network/internet_info.dart';
import 'package:belajar_1/core/utils/multiple_result.dart';
import 'package:belajar_1/data/sources/local/local_source.dart';
import 'package:belajar_1/data/sources/server/item_source_imp.dart';
import 'package:belajar_1/domain/entities/item.dart';
import 'package:belajar_1/domain/repositories/item_repository.dart';

class ItemRepositoryImp implements ItemRepository {
  const ItemRepositoryImp({
    required this.itemSource,
    required this.localSource,
    required this.internetInfo,
  });

  final ItemSource itemSource;
  final LocalSource localSource;
  final InternetInfo internetInfo;

  @override
  Future<Result<Failure, List<Item>>> getItemList() async {
    try {
      if (await internetInfo.hasConnection()) {
        final result = await itemSource.getItemList();
        return Success(result);
      } else {
        return Error(NotConnectedFailure());
      }
    } on ServerException {
      return Error(ServerFailure());
    }
  }

  @override
  Future<Result<Failure, Item?>> getItemById(int id) async {
    try {
      if (await internetInfo.hasConnection()) {
        final result = await itemSource.getItemById(id);
        return Success(result);
      } else {
        return Error(NotConnectedFailure());
      }
    } on ServerException {
      return Error(ServerFailure());
    } on ItemNotFoundException {
      return Error(ItemNotFoundFailure());
    }
  }

  @override
  Future<Result<Failure, Item?>> saveItem(String name) async {
    try {
      if (await internetInfo.hasConnection()) {
        final result = await itemSource.saveItem(name);
        return Success(result);
      } else {
        return Error(NotConnectedFailure());
      }
    } on ServerException {
      return Error(ServerFailure());
    } on ItemNotFoundException {
      return Error(ItemNotFoundFailure());
    }
  }
}
