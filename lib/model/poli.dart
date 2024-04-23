class Poli {
  String? id;
  String namaPoli;

  Poli({this.id, required this.namaPoli});

  isNull(Poli? poli) => poli == null;

  factory Poli.fromJson(Map<String, dynamic> json) {
    return Poli(
      id: json["id"],
      namaPoli: json["nama_poli"],
    );
  }

  Map<String, dynamic> toJson() => {"nama_poli": namaPoli};
}
