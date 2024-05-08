import 'dart:io';

import 'package:belajar_1/core/error/exceptions.dart';
import 'package:belajar_1/data/models/poli_response.dart';
import 'package:belajar_1/data/sources/api/api_client.dart';
import 'package:belajar_1/domain/entities/poli.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class PoliSource {
  Future<List<Poli>> getList();

  Future<Poli> save(Poli poli);

  Future<Poli> edit(Poli poli, String id);

  Future<Poli> getById(String id);

  Future<Poli> delete(Poli poli);
}

class PoliSourceImpl implements PoliSource {
  const PoliSourceImpl({required this.client});

  final ApiClient client;

  @override
  Future<List<Poli>> getList() async {
    try {
      final Response response = await client.get('poli');
      if (response.statusCode == 200) {
        final List data = response.data as List;
        List<PoliResponse> result = data.map((json) => PoliResponse.fromJson(json)).toList();
        var mapListPoliResponseToPoliList = result.mapListPoliResponseToPoliList();
        return mapListPoliResponseToPoliList;
      } else if (response.statusCode == 403 || response.statusCode == 401) {
        throw UnauthorizedException();
      } else if (response.statusCode == 404) {
        throw ItemNotFoundException();
      } else {
        throw ServerException();
      }
    } on SocketException {
      throw ServerException();
    }
  }

  @override
  Future<Poli> save(Poli poli) async {
    var data = poli.toJson();
    final Response response = await client.post('poli', data);
    PoliResponse result = PoliResponse.fromJson(response.data);
    var mapPoliResponseToPoli = result.mapPoliResponseToPoli();
    return mapPoliResponseToPoli;
  }

  @override
  Future<Poli> edit(Poli poli, String id) async {
    var data = poli.toJson();
    final Response response = await client.put('poli/$id', data);
    if (kDebugMode) print(response);
    PoliResponse result = PoliResponse.fromJson(response.data);
    var mapPoliResponseToPoli = result.mapPoliResponseToPoli();
    return mapPoliResponseToPoli;
  }

  @override
  Future<Poli> getById(String id) async {
    final Response response = await client.get('poli/$id');
    PoliResponse result = PoliResponse.fromJson(response.data);
    var mapPoliResponseToPoli = result.mapPoliResponseToPoli();
    return mapPoliResponseToPoli;
  }

  @override
  Future<Poli> delete(Poli poli) async {
    final Response response = await client.delete('poli/${poli.id}');
    PoliResponse result = PoliResponse.fromJson(response.data);
    var mapPoliResponseToPoli = result.mapPoliResponseToPoli();
    return mapPoliResponseToPoli;
  }
}
