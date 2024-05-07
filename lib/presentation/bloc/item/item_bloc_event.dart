part of 'item_bloc.dart';

abstract class ItemBlocEvent extends Equatable {
  const ItemBlocEvent();

  @override
  List<Object> get props => [];
}

class ItemOnFinds extends ItemBlocEvent {}

class ItemOnFindItemById extends ItemBlocEvent {
  const ItemOnFindItemById({required this.id});

  final int id;

  @override
  List<Object> get props => [id];
}
