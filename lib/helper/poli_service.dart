import 'package:belajar_flutter/helper/api_client.dart';
import 'package:belajar_flutter/model/poli.dart';
import 'package:belajar_flutter/model/poli_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class PoliService {
  Future<List<Poli>> getList() async {
    final Response response = await ApiClient().get('poli');
    final List data = response.data as List;
    List<PoliResponse> result = data.map((json) => PoliResponse.fromJson(json)).toList();
    var mapListPoliResponseToPoliList = result.mapListPoliResponseToPoliList();
    return mapListPoliResponseToPoliList;
  }

  Future<Poli> save(Poli poli) async {
    var data = poli.toJson();
    final Response response = await ApiClient().post('poli', data);
    PoliResponse result = PoliResponse.fromJson(response.data);
    var mapPoliResponseToPoli = result.mapPoliResponseToPoli();
    return mapPoliResponseToPoli;
  }

  Future<Poli> edit(Poli poli, String id) async {
    var data = poli.toJson();
    final Response response = await ApiClient().put('poli/$id', data);
    if (kDebugMode) print(response);
    PoliResponse result = PoliResponse.fromJson(response.data);
    var mapPoliResponseToPoli = result.mapPoliResponseToPoli();
    return mapPoliResponseToPoli;
  }

  Future<Poli> getById(String id) async {
    final Response response = await ApiClient().get('poli/$id');
    PoliResponse result = PoliResponse.fromJson(response.data);
    var mapPoliResponseToPoli = result.mapPoliResponseToPoli();
    return mapPoliResponseToPoli;
  }

  Future<Poli> delete(Poli poli) async {
    final Response response = await ApiClient().delete('poli/${poli.id}');
    PoliResponse result = PoliResponse.fromJson(response.data);
    var mapPoliResponseToPoli = result.mapPoliResponseToPoli();
    return mapPoliResponseToPoli;
  }
}
