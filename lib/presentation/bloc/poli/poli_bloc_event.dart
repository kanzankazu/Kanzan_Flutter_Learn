part of 'poli_bloc.dart';

abstract class PoliBlocEvent extends Equatable {
  const PoliBlocEvent();

  @override
  List<Object> get props => [];
}

class OnPoliGetList extends PoliBlocEvent {}

class OnPoliGetItemById extends PoliBlocEvent {
  const OnPoliGetItemById({required this.id});

  @override
  List<Object> get props => [id];

  final String id;
}

class OnPoliSave extends PoliBlocEvent {
  const OnPoliSave({required this.poli});

  final Poli poli;
}

class OnPoliEdit extends PoliBlocEvent {
  const OnPoliEdit({required this.poli});

  final Poli poli;
}

class OnPoliDelete extends PoliBlocEvent {
  const OnPoliDelete({required this.id});

  final String id;
}
