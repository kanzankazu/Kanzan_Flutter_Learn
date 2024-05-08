part of 'item_bloc.dart';

class ItemBlocState extends Equatable {
  const ItemBlocState({
    required this.status,
    required this.datas,
    this.data,
  });

  final Status status;
  final List<Item> datas;
  final Item? data;

  @override
  List<Object?> get props => [status, datas, data];

  ItemBlocState copyWith({
    Status? status,
    List<Item>? datas,
    Item? data,
  }) {
    return ItemBlocState(
      status: status ?? this.status,
      datas: datas ?? this.datas,
      data: data ?? this.data,
    );
  }
}
