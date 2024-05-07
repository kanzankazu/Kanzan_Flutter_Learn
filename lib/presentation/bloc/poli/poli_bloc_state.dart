part of 'poli_bloc.dart';

class PoliBlocState extends Equatable {
  const PoliBlocState({
    required this.status,
    this.datas,
    this.data,
  });

  final Status status;
  final List<Poli>? datas;
  final Poli? data;

  @override
  List<Object?> get props => [status, datas, data];

  PoliBlocState copyWith({
    Status? status,
    List<Poli>? datas,
    Poli? data,
  }) {
    return PoliBlocState(
      status: status ?? this.status,
      datas: datas ?? this.datas,
      data: data ?? this.data,
    );
  }
}
