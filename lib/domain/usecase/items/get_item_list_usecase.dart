import 'package:belajar_1/core/error/failure.dart';
import 'package:belajar_1/core/utils/generics/no_input.dart';
import 'package:belajar_1/core/utils/generics/usecase.dart';
import 'package:belajar_1/core/utils/multiple_result.dart';
import 'package:belajar_1/domain/entities/item.dart';
import 'package:belajar_1/domain/repositories/item_repository.dart';

class GetItemListUseCase implements UseCase<List<Item>, NoInput> {
  final ItemRepository repository;

  const GetItemListUseCase({
    required this.repository,
  });

  @override
  Future<Result<Failure, List<Item>>> call(NoInput input) {
    return repository.getItemList();
  }
}
