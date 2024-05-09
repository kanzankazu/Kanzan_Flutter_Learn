import 'package:belajar_flutter/core/error/failure.dart';
import 'package:belajar_flutter/core/utils/multiple_result.dart';
import 'package:belajar_flutter/domain/entities/item.dart';

abstract class ItemRepository {
  Future<Result<Failure, List<Item>>> getItemList();

  Future<Result<Failure, Item?>> getItemById(int id);

  Future<Result<Failure, Item?>> saveItem(String name);
}
