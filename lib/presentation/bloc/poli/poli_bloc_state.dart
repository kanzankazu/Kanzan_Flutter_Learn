part of 'poli_bloc.dart';

class PoliBlocState extends Equatable {
  const PoliBlocState({
    required this.status,
    this.returnOnPoliGetList,
    this.returnOnPoliGetItemById,
    this.returnOnPoliSave,
    this.returnOnPoliEdit,
    this.returnOnPoliDelete,
  });

  final Status status;
  final List<Poli>? returnOnPoliGetList;
  final Poli? returnOnPoliGetItemById;
  final Poli? returnOnPoliSave;
  final Poli? returnOnPoliEdit;
  final Poli? returnOnPoliDelete;

  @override
  List<Object?> get props => [
        status,
        returnOnPoliGetList,
        returnOnPoliGetItemById,
        returnOnPoliSave,
        returnOnPoliEdit,
        returnOnPoliDelete,
      ];

  PoliBlocState copyWith({
    Status? status,
    List<Poli>? returnOnPoliGetList,
    Poli? returnOnPoliGetItemById,
    Poli? returnOnPoliSave,
    Poli? returnOnPoliEdit,
    Poli? returnOnPoliDelete,
  }) {
    return PoliBlocState(
      status: status ?? this.status,
      returnOnPoliGetList: returnOnPoliGetList ?? this.returnOnPoliGetList,
      returnOnPoliGetItemById: returnOnPoliGetItemById ?? this.returnOnPoliGetItemById,
      returnOnPoliSave: returnOnPoliSave ?? this.returnOnPoliSave,
      returnOnPoliEdit: returnOnPoliEdit ?? this.returnOnPoliEdit,
      returnOnPoliDelete: returnOnPoliDelete ?? this.returnOnPoliDelete,
    );
  }
}
