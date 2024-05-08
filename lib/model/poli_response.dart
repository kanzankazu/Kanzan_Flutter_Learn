import 'package:belajar_flutter/model/poli.dart';

class PoliResponse {
  String? id;
  String? namaPoli;

  PoliResponse({this.id, this.namaPoli});

  factory PoliResponse.fromJson(Map<String, dynamic> json) {
    return PoliResponse(
      id: json["id"],
      namaPoli: json["nama_poli"],
    );
  }
}

extension PoliResponseExtension on PoliResponse {
  Poli mapPoliResponseToPoli() {
    return Poli(
      id: id ?? "",
      namaPoli: namaPoli ?? "",
    );
  }
}

extension PoliResponseListExtension on List<PoliResponse> {
  List<Poli> mapListPoliResponseToPoliList() {
    return map((response) => response.mapPoliResponseToPoli()).toList();
  }
}
