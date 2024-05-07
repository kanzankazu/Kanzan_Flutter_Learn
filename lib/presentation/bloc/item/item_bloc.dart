import 'package:belajar_1/core/error/failure.dart';
import 'package:belajar_1/core/utils/generics/bloc_status.dart';
import 'package:belajar_1/core/utils/generics/no_input.dart';
import 'package:belajar_1/domain/entities/item.dart';
import 'package:belajar_1/domain/usecase/items/get_item_by_id_usecase.dart';
import 'package:belajar_1/domain/usecase/items/get_item_list_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'item_bloc_event.dart';
part 'item_bloc_state.dart';

class ItemBloc extends Bloc<ItemBlocEvent, ItemBlocState> {
  ItemBloc({required this.findItemsUseCase, required this.findItemByIdUseCase}) : super(const ItemBlocState(status: Status.empty, datas: [])) {
    on<ItemOnFinds>(_onFindItems);
    on<ItemOnFindItemById>(_onFindItemById);
  }

  final GetItemListUseCase findItemsUseCase;
  final GetItemByIdUseCase findItemByIdUseCase;

  Future<void> _onFindItems(ItemOnFinds event, Emitter<ItemBlocState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await findItemsUseCase(NoInput());

    if (result.isSuccess()) {
      emit(state.copyWith(datas: result.getSuccess(), status: Status.loaded));
    } else {
      if (result.getError() is ServerFailure) {
        emit(state.copyWith(status: Status.serverError));
      } else if (result.getError() is NotConnectedFailure) {
        emit(state.copyWith(status: Status.networkError));
      }
    }
  }

  Future<void> _onFindItemById(ItemOnFindItemById event, Emitter<ItemBlocState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await findItemByIdUseCase(event.id);
    if (result.isSuccess()) {
      emit(state.copyWith(data: result.getSuccess(), status: Status.loaded));
    } else {
      if (result.getError() is ServerFailure) {
        emit(state.copyWith(status: Status.serverError));
      } else if (result.getError() is NotConnectedFailure) {
        emit(state.copyWith(status: Status.networkError));
      } else if (result.getError() is ItemNotFoundFailure) {
        emit(state.copyWith(status: Status.itemNotFound));
      }
    }
  }
}
