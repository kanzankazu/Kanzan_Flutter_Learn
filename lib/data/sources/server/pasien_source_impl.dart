import 'package:belajar_flutter/data/models/pasien_response.dart';
import 'package:belajar_flutter/data/sources/api/api_client.dart';
import 'package:belajar_flutter/domain/entities/pasien.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class PasienSource {
  Future<List<Pasien>> getList();

  Future<Pasien> save(Pasien poli);

  Future<Pasien> edit(Pasien poli, String id);

  Future<Pasien> getById(String id);

  Future<Pasien> delete(Pasien poli);
}

class PasienSourceImpl implements PasienSource {
  const PasienSourceImpl({required this.client});

  final ApiClient client;

  @override
  Future<List<Pasien>> getList() async {
    final Response response = await client.get('poli');
    final List data = response.data as List;
    List<PasienResponse> result = data.map((json) => PasienResponse.fromJson(json)).toList();
    var mapListPasienResponseToPasienList = result.mapListPasienResponseToPasienList();
    return mapListPasienResponseToPasienList;
  }

  @override
  Future<Pasien> save(Pasien poli) async {
    var data = poli.toJson();
    final Response response = await client.post('poli', data);
    PasienResponse result = PasienResponse.fromJson(response.data);
    var mapPasienResponseToPasien = result.mapPasienResponseToPasien();
    return mapPasienResponseToPasien;
  }

  @override
  Future<Pasien> edit(Pasien poli, String id) async {
    var data = poli.toJson();
    final Response response = await client.put('poli/$id', data);
    if (kDebugMode) print(response);
    PasienResponse result = PasienResponse.fromJson(response.data);
    var mapPasienResponseToPasien = result.mapPasienResponseToPasien();
    return mapPasienResponseToPasien;
  }

  @override
  Future<Pasien> getById(String id) async {
    final Response response = await client.get('poli/$id');
    PasienResponse result = PasienResponse.fromJson(response.data);
    var mapPasienResponseToPasien = result.mapPasienResponseToPasien();
    return mapPasienResponseToPasien;
  }

  @override
  Future<Pasien> delete(Pasien poli) async {
    final Response response = await client.delete('poli/${poli.id}');
    PasienResponse result = PasienResponse.fromJson(response.data);
    var mapPasienResponseToPasien = result.mapPasienResponseToPasien();
    return mapPasienResponseToPasien;
  }
}
