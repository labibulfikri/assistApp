import 'dart:convert';

import 'package:assist_apps/app/modules/aset/models/aset_model.dart';
import 'package:assist_apps/app/modules/utils.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class AsetController extends GetxController {
  Future<List<AsetModal>> GetAset() async {
    Uri uri = Uri.parse(baseUrl + "op=aset");
    // Uri uri = Uri.parse(baseUrl + "op=perkaracari&s=${search}");

    var res = await http.get(uri);
    List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];
    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => AsetModal.fromJson(e)).toList();
    }
  }
}
