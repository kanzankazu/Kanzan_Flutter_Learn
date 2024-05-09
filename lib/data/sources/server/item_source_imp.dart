import 'dart:convert';
import 'dart:io';

import 'package:belajar_flutter/core/constants/network_path.dart';
import 'package:belajar_flutter/core/error/exceptions.dart';
import 'package:belajar_flutter/data/models/item_response.dart';
import 'package:http/http.dart' as http;

abstract class ItemSource {
  Future<List<ItemResponse>> getItemList();

  Future<ItemResponse?> getItemById(int id);

  Future<ItemResponse?> saveItem(String name);
}

class ItemSourceImp implements ItemSource {
  const ItemSourceImp({required this.client});

  final http.Client client;

  @override
  Future<List<ItemResponse>> getItemList() async {
    try {
      http.Response response = await client.get(Uri.parse(NetworkPath.items));
      if (response.statusCode == 200) {
        List<ItemResponse> result = (jsonDecode(response.body) as List).map((item) => ItemResponse.fromJson(item)).toList();
        return result;
      } else {
        throw ServerException();
      }
    } on SocketException {
      throw ServerException();
    }
  }

  @override
  Future<ItemResponse?> getItemById(int id) async {
    try {
      http.Response response = await client.get(Uri.parse(NetworkPath.findItemById(id)));
      if (response.statusCode == 200) {
        ItemResponse result = ItemResponse.fromJson(jsonDecode(response.body));
        return result;
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
  Future<ItemResponse?> saveItem(String name) async {
    try {
      http.Response response = await client.post(Uri.parse(NetworkPath.items), body: {name: name});
      if (response.statusCode == 200) {
        ItemResponse result = ItemResponse.fromJson(jsonDecode(response.body));
        return result;
      } else if (response.statusCode == 404) {
        throw ItemNotFoundException();
      } else {
        throw ServerException();
      }
    } on SocketException {
      throw ServerException();
    }
  }
}
