import 'package:belajar_1/core/error/failure.dart';
import 'package:belajar_1/core/utils/generics/usecase.dart';
import 'package:belajar_1/core/utils/multiple_result.dart';
import 'package:belajar_1/domain/entities/item.dart';
import 'package:belajar_1/domain/repositories/item_repository.dart';

class SaveItemUseCase implements UseCase<Item, String> {
  final ItemRepository repository;

  const SaveItemUseCase({
    required this.repository,
  });

  @override
  Future<Result<Failure, Item?>> call(String input) async {
    return repository.saveItem(input);
  }
}
