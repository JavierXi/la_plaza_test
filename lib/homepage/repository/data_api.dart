import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:la_plaza/homepage/ui/widgets/data_model.dart';

class DataApi {
  static Future<List<Data>> getDataLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/data.json');
    final body = json.decode(data);
    return body.map<Data>(Data.fromJson).toList();
  }

  static Future<List<Data>> getInternetData() async {
    final url = Uri.parse(
        'https://api.bazzaio.com/v5/listados/listar_productos_tienda/590/0/');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = json.decode(response.body)['data'] as List;
      List<Data> tags = body.map((tagJson) => Data.fromJson(tagJson)).toList();
      return tags;
    } else {
      throw Exception();
    }
  }

  static Future<List<Data>> searchItems(String query) async {
    final url = Uri.parse(
        'https://api.bazzaio.com/v5/listados/listar_productos_tienda/590/0/');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = json.decode(response.body)['data'] as List;
      List<Data> tags = body.map((json) => Data.fromJson(json)).where((data) {
        final nameLower = data.itemName.toLowerCase();
        final searchLower = query.toLowerCase();
        return nameLower.contains(searchLower);
      }).toList();
      return tags;
    } else {
      throw Exception();
    }
  }
}
