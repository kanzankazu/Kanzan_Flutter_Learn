class Pasien {
  Pasien({
    this.id,
    required this.nomorRm,
    required this.nama,
    required this.tanggalLahir,
    required this.nomorTelepon,
    required this.alamat,
  });

  String? id;
  String nomorRm;
  String nama;
  String tanggalLahir;
  String nomorTelepon;
  String alamat;

  Map<String, dynamic> toJson() => {
        "nomor_rm": nomorRm,
        "nama": nama,
        "tanggal_lahir": tanggalLahir,
        "nomor_telepon": nomorTelepon,
        "alamat": alamat,
      };
}

extension PasienExtension on Pasien? {
  bool isNull() {
    return this == null;
  }
}
