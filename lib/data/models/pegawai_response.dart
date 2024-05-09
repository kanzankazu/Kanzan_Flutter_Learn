import 'package:belajar_flutter/domain/entities/pegawai.dart';

class PegawaiResponse {
  PegawaiResponse({
    this.id,
    this.nip,
    this.nama,
    this.tanggalLahir,
    this.nomorTelepon,
    this.email,
    this.password,
  });

  String? id;
  String? nip;
  String? nama;
  String? tanggalLahir;
  String? nomorTelepon;
  String? email;
  String? password;

  factory PegawaiResponse.fromJson(Map<String, dynamic> json) => PegawaiResponse(
        id: json["id"],
        nip: json["nip"],
        nama: json["nama"],
        tanggalLahir: json["tanggal_lahir"],
        nomorTelepon: json["nomor_telepon"],
        email: json["email"],
        password: json["password"],
      );
}

extension PegawaiResponseExtension on PegawaiResponse {
  Pegawai mapPegawaiResponseToPegawai() => Pegawai(
        id: id ?? "",
        nip: nip ?? "",
        nama: nama ?? "",
        tanggalLahir: tanggalLahir ?? "",
        nomorTelepon: nomorTelepon ?? "",
        email: email ?? "",
        password: password ?? "",
      );
}

extension PegawaiResponseListExtension on List<PegawaiResponse> {
  List<Pegawai> mapListPegawaiResponseToPegawaiList() => map((response) => response.mapPegawaiResponseToPegawai()).toList();
}
