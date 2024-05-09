import 'package:belajar_flutter/domain/entities/pasien.dart';

class PasienResponse {
  PasienResponse({
    this.id,
    this.nomorRm,
    this.nama,
    this.tanggalLahir,
    this.nomorTelepon,
    this.alamat,
  });

  String? id;
  String? nomorRm;
  String? nama;
  String? tanggalLahir;
  String? nomorTelepon;
  String? alamat;

  factory PasienResponse.fromJson(Map<String, dynamic> json) => PasienResponse(
        id: json["id"],
        nomorRm: json["nomor_rm"],
        nama: json["nama"],
        tanggalLahir: json["tanggal_lahir"],
        nomorTelepon: json["nomor_telepon"],
        alamat: json["alamat"],
      );
}

extension PasienResponseExtension on PasienResponse {
  Pasien mapPasienResponseToPasien() => Pasien(
        id: id ?? "",
        nomorRm: nomorRm ?? "",
        nama: nama ?? "",
        tanggalLahir: tanggalLahir ?? "",
        nomorTelepon: nomorTelepon ?? "",
        alamat: alamat ?? "",
      );
}

extension PasienResponseListExtension on List<PasienResponse> {
  List<Pasien> mapListPasienResponseToPasienList() => map((response) => response.mapPasienResponseToPasien()).toList();
}
