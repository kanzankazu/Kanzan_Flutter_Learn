class Poli {
  Poli({
    this.id,
    required this.namaPoli,
  });

  String? id;
  String namaPoli;

  Map<String, dynamic> toJson() => {
        "nama_poli": namaPoli,
      };
}

extension PoliExtension on Poli? {
  bool isNull() {
    return this == null;
  }
}
