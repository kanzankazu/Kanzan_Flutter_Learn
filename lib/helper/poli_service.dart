import 'package:belajar_1/helper/api_client.dart';
import 'package:belajar_1/model/poli.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class PoliService {
  Future<List<Poli>> listData() async {
    final Response response = await ApiClient().get('poli');
    final List data = response.data as List;
    List<Poli> result = data.map((json) => Poli.fromJson(json)).toList();
    return result;
  }

  Future<Poli> simpan(Poli poli) async {
    var data = poli.toJson();
    final Response response = await ApiClient().post('poli', data);
    Poli result = Poli.fromJson(response.data);
    return result;
  }

  Future<Poli> ubah(Poli poli, String id) async {
    var data = poli.toJson();
    final Response response = await ApiClient().put('poli/$id', data);
    if (kDebugMode) print(response);
    Poli result = Poli.fromJson(response.data);
    return result;
  }

  Future<Poli> getById(String id) async {
    final Response response = await ApiClient().get('poli/$id');
    Poli result = Poli.fromJson(response.data);
    return result;
  }

  Future<Poli> hapus(Poli poli) async {
    final Response response = await ApiClient().delete('poli/${poli.id}');
    Poli result = Poli.fromJson(response.data);
    return result;
  }
}
