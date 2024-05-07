import 'package:belajar_1/data/models/item_response.dart';

abstract class LocalSource {
  Future<List<ItemResponse>> findItems();
}
