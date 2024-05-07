import 'package:belajar_1/data/models/item_response.dart';
import 'package:belajar_1/data/sources/local/local_source.dart';

class LocalSourceImp implements LocalSource {
  @override
  Future<List<ItemResponse>> findItems() async {
    // FAKE DATA OFFLINE
    return Future.value([const ItemResponse(id: 0, name: "Data Local"), const ItemResponse(id: 1, name: "Data Local")]);
  }
}
