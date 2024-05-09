import 'package:belajar_flutter/data/models/item_response.dart';

abstract class LocalSource {
  Future<List<ItemResponse>> findItems();
}
