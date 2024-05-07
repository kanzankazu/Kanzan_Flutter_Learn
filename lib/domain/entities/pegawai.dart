class Pegawai {
  Pegawai({
    this.id,
    required this.nip,
    required this.nama,
    required this.tanggalLahir,
    required this.nomorTelepon,
    required this.email,
    required this.password,
  });

  String? id;
  String nip;
  String nama;
  String tanggalLahir;
  String nomorTelepon;
  String email;
  String password;

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nama": nama,
        "tanggal_lahir": tanggalLahir,
        "nomor_telepon": nomorTelepon,
        "email": email,
        "password": password,
      };
}

extension PegawaiExtension on Pegawai? {
  bool isNull() {
    return this == null;
  }
}
