import 'package:belajar_flutter/domain/entities/poli.dart';

class PoliResponse {
  PoliResponse({
    this.id,
    this.namaPoli,
  });

  String? id;
  String? namaPoli;

  factory PoliResponse.fromJson(Map<String, dynamic> json) => PoliResponse(
        id: json["id"],
        namaPoli: json["nama_poli"],
      );
}

extension PoliResponseExtension on PoliResponse {
  Poli mapPoliResponseToPoli() => Poli(
        id: id ?? "",
        namaPoli: namaPoli ?? "",
      );
}

extension PoliResponseListExtension on List<PoliResponse> {
  List<Poli> mapListPoliResponseToPoliList() => map((response) => response.mapPoliResponseToPoli()).toList();
}
