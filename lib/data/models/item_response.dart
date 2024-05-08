import 'package:belajar_1/domain/entities/item.dart';

class ItemResponse extends Item {
  const ItemResponse({
    required super.id,
    required super.name,
  });

  factory ItemResponse.fromJson(Map<String, dynamic> json) {
    return ItemResponse(
      id: json["id"],
      name: json["name"],
    );
  }
}
