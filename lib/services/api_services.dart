import 'dart:developer';

import 'package:covid19/model/indo_model.dart';
import 'package:dio/dio.dart';

import '../model/prov_model.dart';

class ApiService {
  Future<IndoModel> getDataIndo() async {
    try {
      var result = await Dio()
          .get('https://apicovid19indonesia-v2.vercel.app/api/indonesia');

      if (result.statusCode == 200) {
        IndoModel indo = IndoModel.fromJson(result.data);
        log('Data berhasil di ambil');
        return indo;
      }
      return IndoModel();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProvModel>> getDataProv() async {
    try {
      var result = await Dio().get(
          'https://apicovid19indonesia-v2.vercel.app/api/indonesia/provinsi');

      if (result.statusCode == 200) {
        List data = result.data;

        List<ProvModel> prov = data.map((e) => ProvModel.fromJson(e)).toList();
        return prov;
      }
      return <ProvModel>[];
    } catch (e) {
      rethrow;
    }
  }
}
