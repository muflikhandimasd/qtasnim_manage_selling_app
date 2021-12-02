import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qtasnim_manage_selling_app/model/data_penjualan.dart';

Future<List<DataPenjualan>> generateDataPenjualanList() async {
  var response = await http.get(Uri.parse(
      'https://qtasnim-data-penjualan-app.herokuapp.com/api/get-all-data'));
  var decodedDataPenjualan =
      json.decode(response.body).cast<Map<String, dynamic>>();
  List<DataPenjualan> dataPenjualanList = await decodedDataPenjualan
      .map<DataPenjualan>((json) => DataPenjualan.fromJson(json))
      .toList();
  return dataPenjualanList;
}
