class Poli {
  String? id;
  String namaPoli;

  Poli({this.id, required this.namaPoli});

  Map<String, dynamic> toJson() => {"nama_poli": namaPoli};
}

extension PoliExtension on Poli? {
  bool isNull() {
    return this == null;
  }
}
