import 'package:belajar_1/data/models/pegawai_response.dart';
import 'package:belajar_1/data/sources/api/api_client.dart';
import 'package:belajar_1/domain/entities/pegawai.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class PegawaiSource {
  Future<List<Pegawai>> getList();

  Future<Pegawai> save(Pegawai poli);

  Future<Pegawai> edit(Pegawai poli, String id);

  Future<Pegawai> getById(String id);

  Future<Pegawai> delete(Pegawai poli);
}

class PegawaiSourceImpl implements PegawaiSource {
  const PegawaiSourceImpl({required this.client});

  final ApiClient client;

  @override
  Future<List<Pegawai>> getList() async {
    final Response response = await client.get('poli');
    final List data = response.data as List;
    List<PegawaiResponse> result = data.map((json) => PegawaiResponse.fromJson(json)).toList();
    var mapListPegawaiResponseToPegawaiList = result.mapListPegawaiResponseToPegawaiList();
    return mapListPegawaiResponseToPegawaiList;
  }

  @override
  Future<Pegawai> save(Pegawai pegawai) async {
    var data = pegawai.toJson();
    final Response response = await client.post('poli', data);
    PegawaiResponse result = PegawaiResponse.fromJson(response.data);
    var mapPegawaiResponseToPegawai = result.mapPegawaiResponseToPegawai();
    return mapPegawaiResponseToPegawai;
  }

  @override
  Future<Pegawai> edit(Pegawai pegawai, String id) async {
    var data = pegawai.toJson();
    final Response response = await client.put('poli/$id', data);
    if (kDebugMode) print(response);
    PegawaiResponse result = PegawaiResponse.fromJson(response.data);
    var mapPegawaiResponseToPegawai = result.mapPegawaiResponseToPegawai();
    return mapPegawaiResponseToPegawai;
  }

  @override
  Future<Pegawai> getById(String id) async {
    final Response response = await client.get('poli/$id');
    PegawaiResponse result = PegawaiResponse.fromJson(response.data);
    var mapPegawaiResponseToPegawai = result.mapPegawaiResponseToPegawai();
    return mapPegawaiResponseToPegawai;
  }

  @override
  Future<Pegawai> delete(Pegawai pegawai) async {
    final Response response = await client.delete('poli/${pegawai.id}');
    PegawaiResponse result = PegawaiResponse.fromJson(response.data);
    var mapPegawaiResponseToPegawai = result.mapPegawaiResponseToPegawai();
    return mapPegawaiResponseToPegawai;
  }
}
