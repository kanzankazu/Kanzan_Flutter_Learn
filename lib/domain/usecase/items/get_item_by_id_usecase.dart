import 'package:belajar_1/core/error/failure.dart';
import 'package:belajar_1/core/utils/generics/usecase.dart';
import 'package:belajar_1/core/utils/multiple_result.dart';
import 'package:belajar_1/domain/entities/item.dart';
import 'package:belajar_1/domain/repositories/item_repository.dart';

class GetItemByIdUseCase implements UseCase<Item, int> {
  final ItemRepository repository;

  GetItemByIdUseCase({required this.repository});

  @override
  Future<Result<Failure, Item?>> call(int input) async {
    return repository.getItemById(input);
  }
}
