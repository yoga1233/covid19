import 'package:covid19/model/prov_model.dart';
import 'package:dio/dio.dart';

class ProvService {
  Future<List<ProvModel>> getData() async {
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
